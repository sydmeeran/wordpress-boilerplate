<?php

class PostType {
  private $_slug = 'custom_type';
  private $_name = 'Custom Type';
  private $_namePlural = 'Custom Types';
  private $_isPublic = true;
  private $_hierarchical = false;
  private $_supports = ['title', 'author', 'thumbnail', 'excerpt', 'revisions'];
  private $_isRest = true;
  private $_dashIcon = false;
  private $_withFront = true;

  public function __construct($args) {
    $this->_slug = $this->_getArg($args, 'slug', $this->_slug);
    $this->_name = $this->_getArg($args, 'name', $this->_name);
    $this->_namePlural = $this->_getArg($args, 'namePlural', $this->_namePlural);
    $this->_isPublic = $this->_getArg($args, 'isPublic', $this->_isPublic);
    $this->_hierarchical = $this->_getArg($args, 'heirarchial', $this->_hierarchical);
    $this->_supports = $this->_getArg($args, 'supports', $this->_supports);
    $this->_isRest = $this->_getArg($args, 'isRest', $this->_isRest);
    $this->_dashIcon = $this->_getArg($args, 'dashIcon', DashIcons::$icons['admin-post']);
    $this->_withFront = $this->_getArg($args, 'withFront', $this->_withFront);
  }

  private function _getArg($args, $item, $default) {
    return isset($args[$item]) && $args[$item] ? $args[$item] : $default;
  }

  public function setArgs($args) {
    // merge and replace items
  }

  public function build() {
    register_post_type($this->_slug,
      array(
        'labels' => array(
          'name' => __($this->_namePlural),
          'singular_name' => __($this->_name),
          'edit_item' => __('Edit ' . $this->_name),
          'add_new_item' => __('Add New ' . $this->_name),
          'new_item' => __('New ' . $this->_name),
          'view_item' => __('View ' . $this->_name),
          'view_items' => __('View ' . $this->_namePlural),
          'search_items' => __($this->_name),
        ),
        'public' => $this->_isPublic,
        'hierarchical' => $this->_hierarchical,
        'capability_type' => 'post',
        'supports' => $this->_supports,
        'rewrite' => array(
          'slug' => $this->_slug,
          'with_front' => $this->_withFront,
        ),
        'show_in_rest' => true,
        'show_in_nav_menus' => true,
        'menu_icon' => $this->_dashIcon,
      )
    );
  }
}

class DashIcons {
  public static $icons = [
    "menu" => "dashicons-menu",
    "admin-site" => "dashicons-admin-site",
    "dashboard" => "dashicons-dashboard",
    "admin-post" => "dashicons-admin-post",
    "admin-media" => "dashicons-admin-media",
    "admin-links" => "dashicons-admin-links",
    "admin-page" => "dashicons-admin-page",
    "admin-comments" => "dashicons-admin-comments",
    "admin-appearance" => "dashicons-admin-appearance",
    "admin-plugins" => "dashicons-admin-plugins",
    "admin-users" => "dashicons-admin-users",
    "admin-tools" => "dashicons-admin-tools",
    "admin-settings" => "dashicons-admin-settings",
    "admin-network" => "dashicons-admin-network",
    "admin-home" => "dashicons-admin-home",
    "admin-generic" => "dashicons-admin-generic",
    "admin-collapse" => "dashicons-admin-collapse",
    "welcome-write-blog" => "dashicons-welcome-write-blog",
    "welcome-add-page" => "dashicons-welcome-add-page",
    "welcome-view-site" => "dashicons-welcome-view-site",
    "welcome-widgets-menus" => "dashicons-welcome-widgets-menus",
    "welcome-comments" => "dashicons-welcome-comments",
    "welcome-learn-more" => "dashicons-welcome-learn-more",
    "format-aside" => "dashicons-format-aside",
    "format-image" => "dashicons-format-image",
    "format-gallery" => "dashicons-format-gallery",
    "format-video" => "dashicons-format-video",
    "format-status" => "dashicons-format-status",
    "format-quote" => "dashicons-format-quote",
    "format-chat" => "dashicons-format-chat",
    "format-audio" => "dashicons-format-audio",
    "camera" => "dashicons-camera",
    "images-alt" => "dashicons-images-alt",
    "images-alt2" => "dashicons-images-alt2",
    "video-alt" => "dashicons-video-alt",
    "video-alt2" => "dashicons-video-alt2",
    "video-alt3" => "dashicons-video-alt3",
    "image-crop" => "dashicons-image-crop",
    "image-rotate-left" => "dashicons-image-rotate-left",
    "image-rotate-right" => "dashicons-image-rotate-right",
    "image-flip-vertical" => "dashicons-image-flip-vertical",
    "image-flip-horizontal" => "dashicons-image-flip-horizontal",
    "undo" => "dashicons-undo",
    "redo" => "dashicons-redo",
    "editor-bold" => "dashicons-editor-bold",
    "editor-italic" => "dashicons-editor-italic",
    "editor-ul" => "dashicons-editor-ul",
    "editor-ol" => "dashicons-editor-ol",
    "editor-quote" => "dashicons-editor-quote",
    "editor-alignleft" => "dashicons-editor-alignleft",
    "editor-aligncenter" => "dashicons-editor-aligncenter",
    "editor-alignright" => "dashicons-editor-alignright",
    "editor-insertmore" => "dashicons-editor-insertmore",
    "editor-spellcheck" => "dashicons-editor-spellcheck",
    "editor-distractionfree" => "dashicons-editor-distractionfree",
    "editor-kitchensink" => "dashicons-editor-kitchensink",
    "editor-underline" => "dashicons-editor-underline",
    "editor-justify" => "dashicons-editor-justify",
    "editor-textcolor" => "dashicons-editor-textcolor",
    "editor-paste-word" => "dashicons-editor-paste-word",
    "editor-paste-text" => "dashicons-editor-paste-text",
    "editor-removeformatting" => "dashicons-editor-removeformatting",
    "editor-video" => "dashicons-editor-video",
    "editor-customchar" => "dashicons-editor-customchar",
    "editor-outdent" => "dashicons-editor-outdent",
    "editor-indent" => "dashicons-editor-indent",
    "editor-help" => "dashicons-editor-help",
    "editor-strikethrough" => "dashicons-editor-strikethrough",
    "editor-unlink" => "dashicons-editor-unlink",
    "editor-rtl" => "dashicons-editor-rtl",
    "align-left" => "dashicons-align-left",
    "align-right" => "dashicons-align-right",
    "align-center" => "dashicons-align-center",
    "align-none" => "dashicons-align-none",
    "lock" => "dashicons-lock",
    "calendar" => "dashicons-calendar",
    "visibility" => "dashicons-visibility",
    "post-status" => "dashicons-post-status",
    "edit" => "dashicons-edit",
    "trash" => "dashicons-trash",
    "arrow-up" => "dashicons-arrow-up",
    "arrow-down" => "dashicons-arrow-down",
    "arrow-right" => "dashicons-arrow-right",
    "arrow-left" => "dashicons-arrow-left",
    "arrow-up-alt" => "dashicons-arrow-up-alt",
    "arrow-down-alt" => "dashicons-arrow-down-alt",
    "arrow-right-alt" => "dashicons-arrow-right-alt",
    "arrow-left-alt" => "dashicons-arrow-left-alt",
    "arrow-up-alt2" => "dashicons-arrow-up-alt2",
    "arrow-down-alt2" => "dashicons-arrow-down-alt2",
    "arrow-right-alt2" => "dashicons-arrow-right-alt2",
    "arrow-left-alt2" => "dashicons-arrow-left-alt2",
    "sort" => "dashicons-sort",
    "leftright" => "dashicons-leftright",
    "list-view" => "dashicons-list-view",
    "exerpt-view" => "dashicons-exerpt-view",
    "share" => "dashicons-share",
    "share-alt" => "dashicons-share-alt",
    "share-alt2" => "dashicons-share-alt2",
    "twitter" => "dashicons-twitter",
    "rss" => "dashicons-rss",
    "facebook" => "dashicons-facebook",
    "facebook-alt" => "dashicons-facebook-alt",
    "googleplus" => "dashicons-googleplus",
    "networking" => "dashicons-networking",
    "hammer" => "dashicons-hammer",
    "art" => "dashicons-art",
    "migrate" => "dashicons-migrate",
    "performance" => "dashicons-performance",
    "wordpress" => "dashicons-wordpress",
    "wordpress-alt" => "dashicons-wordpress-alt",
    "pressthis" => "dashicons-pressthis",
    "update" => "dashicons-update",
    "screenoptions" => "dashicons-screenoptions",
    "info" => "dashicons-info",
    "cart" => "dashicons-cart",
    "feedback" => "dashicons-feedback",
    "cloud" => "dashicons-cloud",
    "translation" => "dashicons-translation",
    "tag" => "dashicons-tag",
    "category" => "dashicons-category",
    "yes" => "dashicons-yes",
    "no" => "dashicons-no",
    "no-alt" => "dashicons-no-alt",
    "plus" => "dashicons-plus",
    "minus" => "dashicons-minus",
    "dismiss" => "dashicons-dismiss",
    "marker" => "dashicons-marker",
    "star-filled" => "dashicons-star-filled",
    "star-half" => "dashicons-star-half",
    "star-empty" => "dashicons-star-empty",
    "flag" => "dashicons-flag",
    "location" => "dashicons-location",
    "location-alt" => "dashicons-location-alt",
    "vault" => "dashicons-vault",
    "shield" => "dashicons-shield",
    "shield-alt" => "dashicons-shield-alt",
    "search" => "dashicons-search",
    "slides" => "dashicons-slides",
    "analytics" => "dashicons-analytics",
    "chart-pie" => "dashicons-chart-pie",
    "chart-bar" => "dashicons-chart-bar",
    "chart-line" => "dashicons-chart-line",
    "chart-area" => "dashicons-chart-area",
    "groups" => "dashicons-groups",
    "businessman" => "dashicons-businessman",
    "id" => "dashicons-id",
    "id-alt" => "dashicons-id-alt",
    "products" => "dashicons-products",
    "awards" => "dashicons-awards",
    "forms" => "dashicons-forms",
    "portfolio" => "dashicons-portfolio",
    "book" => "dashicons-book",
    "book-alt" => "dashicons-book-alt",
    "download" => "dashicons-download",
    "upload" => "dashicons-upload",
    "backup" => "dashicons-backup",
    "lightbulb" => "dashicons-lightbulb",
    "smiley" => "dashicons-smiley",
  ];
}
