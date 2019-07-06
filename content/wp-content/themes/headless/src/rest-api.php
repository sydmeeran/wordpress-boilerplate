
<?php

class RestApi {
  private $_namespace;
  private $_version;

  function __construct($namespace = 'site', $version = 'v1') {
    $this->_namespace = $namespace;
    $this->_version = $version;
  }

  public function init() {
    $this->_registerPostTypes();
  }

  public function ensureAcf($data, $maxDepth = 15, $depth = 0) {
    if ($depth > $maxDepth) {
      return;
    }

    if (is_array($data)) {
      foreach ($data as $index => $item) {
        if ($item instanceof stdClass || $item instanceof WP_Post) {
          $data[$index] = get_object_vars($item);
          $data[$index]['acf'] = get_fields($data[$index]['ID']);
          $data[$index]['title'] = $data[$index]['post_title'];
          $data[$index]['permalink'] = get_the_permalink($data[$index]['ID']);
        }
      }
    }

    $newDepth = $depth + 1;
    foreach ($data as $index => $item) {
      if (is_array($item)) {
        $data[$index] = $this->ensureAcf($item, $maxDepth, $newDepth);
      }
    }

    return $data;
  }

  public function getPosts(WP_REST_Request $request) {
    $post_info = $this->_getPostType($request);
    return $this->_prepareRestResponse($this->_query($post_info), 200);
  }

  private function _query($post_info) {
    $single = isset($post_info['slug']) && $post_info['slug'];
    $posts = [];

    $query_args = [
      'post_type' => $post_info['post_type'],
      'numberposts' => -1,
    ];

    if ($single) {
      $query_args += [
        'name' => $post_info['slug'],
      ];
    }

    $transient_result = false;

    if ($single) {
      if (WP_TRANSIENTS) {
        $transient_result = get_transient($post_info['post_type'] . '_' . $post_info['slug']);
      }

      if ($transient_result) {
        $posts = $this->ensureAcf($transient_result);
      } else {
        $query = get_posts($query_args);
        $posts = $this->ensureAcf($query);

        if (WP_TRANSIENTS) {
          set_transient($post_info['post_type'] . '_' . $post_info['slug'], $query, 86400);
        }
      }

      return count($posts) === 1 ? $posts[0] : false;
    } else {
      if (WP_TRANSIENTS) {
        $transient_result = get_transient($post_info['post_type']);
      }

      if ($transient_result) {
        $posts = $this->ensureAcf($transient_result);
        $posts['WP_TRANSIENTS'] = true;

      } else {

        $query = get_posts($query_args);
        $posts = $this->ensureAcf($query);

        if (WP_TRANSIENTS) {
          set_transient($post_info['post_type'], $query, 86400);
        }
      }
      return $posts;
    }
  }

  private function _getPostType(WP_REST_Request $request) {
    $request_url = strtolower($_SERVER['REQUEST_URI']);
    $uri_parts = explode('/', $request_url);

    if (count($uri_parts) === 5) { // individual post type
      return ['post_type' => $uri_parts[count($uri_parts) - 1], 'slug' => false];
    } else if (count($uri_parts === 6)) { // in a listing page
      return ['post_type' => $uri_parts[count($uri_parts) - 2], 'slug' => $uri_parts[count($uri_parts) - 1]];
    }
  }

  private function _registerEndpoint($method, $endpoint, $callback) {
    if (strpos($endpoint, '/') !== 0) {
      $endpoint = '/' . $endpoint;
    }

    add_action('rest_api_init', function () use ($method, $endpoint, $callback) {
      register_rest_route($this->_namespace . '/' . $this->_version, $endpoint, [
        'methods' => [$method, 'OPTIONS'],
        'callback' => $callback,
      ]);
    });
  }

  private function _registerPostTypes() {
    $post_types = get_post_types([
      'public' => true,
    ]);

    foreach ($post_types as $index => $post_type) {
      $this->registerGet($post_type, [$this, 'getPosts']);
      $this->registerGet($post_type . '/' . '(?P<slug>\S+)' . '/', [$this, 'getPosts']);

      // transient management
      add_action('save_post_' . $post_type, function ($post_id) use ($post_type) {
        $post = get_post($post_id);
        $delete = false;

        if ('trash' === $post->post_status) {
          $delete = true;
        }

        $query_args = [
          'post_type' => $post_type,
          'numberposts' => -1,
        ];

        $query = get_posts($query_args);

        if (WP_TRANSIENTS) {
          set_transient($post_type, $query, 86400);

          if ($delete) {
            $originalSlug = explode('_', $post->post_name)[0];

            delete_transient($post_type . '_' . $originalSlug);
          } else {
            set_transient($post_type . '_' . $post->post_name, [$post], 86400);
          }
        }
      });
    }
  }

  public function registerGet($endpoint, $callback) {
    $this->_registerEndpoint('GET', $endpoint, $callback);
  }

  public function registerPost($endpoint, $callback) {
    $this->_registerEndpoint('POST', $endpoint, $callback);
  }

  private function _prepareRestResponse($retData = false, $code = 200) {
    $response = false;
    switch ($code) {
    case 200:
      $response = new WP_REST_Response([
        'error' => false,
        'data' => $retData,
      ], $code);
      break;
    default:
      $response = new WP_REST_Response([
        'error' => false,
        'data' => $retData,
      ], $code);
      break;
    }
    return $response;
  }
}
