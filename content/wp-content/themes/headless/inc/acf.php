<?php

// Register Options page
if( function_exists('acf_add_options_page') ) {
  acf_add_options_page(array(
    'page_title'  => 'Global Settings',
    'menu_title'  => 'Global Settings',
    'menu_slug'   => 'global-content',
    'capability'  => 'edit_posts',
    'icon_url'    => 'dashicons-dashboard',
    'position'    => 2,
    'redirect'    => false
  ));

  acf_add_options_page(array(
    'page_title'  => 'Global Site Content - Footer',
    'menu_title'  => 'Footer',
    'menu_slug'   => 'global-content__footer',
    'parent_slug'   => 'global-content',
    'capability'  => 'edit_posts'
  ));
}

// ACF Local JSON save/load paths
add_filter('acf/settings/save_json','site_acf_json_save_point');
function site_acf_json_save_point($path) {
  // update path
  $path = get_stylesheet_directory() . '/inc/acf-json';
  // return
  return $path;
}

add_filter('acf/settings/load_json', 'site_acf_json_load_point');
function site_acf_json_load_point( $paths ) {
  // remove original path (optional)
  unset($paths[0]);
  // append path
  $paths[] = get_stylesheet_directory() . '/inc/acf-json';
  // return
  return $paths;

}

// Move Yoast to bottom
function yoasttobottom() {
	return 'low';
}
add_filter( 'wpseo_metabox_prio', 'yoasttobottom');
