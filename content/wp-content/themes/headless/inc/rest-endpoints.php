<?php

require get_stylesheet_directory() . '/src/rest-api.php';

define('REST_NAMESPACE', 'site');
define('REST_VERSION', 'v1');

$GLOBALS['REST_API'] = $restApi = new RestApi(REST_NAMESPACE, REST_VERSION);

// initialise the whole rest api ecosystem
$restApi->init();

function site_test_callback(WP_REST_Request $request) {
  return [
    'hello' => 'world',
  ];
}

$restApi->registerGet('/test', 'site_test_callback');

// manually set up cors ourselves
add_action('rest_api_init', function () {
  remove_filter('rest_pre_serve_request', 'rest_send_cors_headers');
  add_filter('rest_pre_serve_request', function ($value) {
    header('Access-Control-Allow-Origin: ' . '*');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Headers: Authorization, X-WP-Nonce, Content-Type, Accept');
    header('Vary: Origin');
    return $value;
  });
}, 15);