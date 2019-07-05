<?php

require ( get_stylesheet_directory() . '/src/post-type.php' );

// remove the default post from the menu
add_action('admin_menu','remove_default_post_type');
function remove_default_post_type() {
    remove_menu_page('edit.php');
}

(new PostType([
  'slug' => 'event',
  'name' => 'Event',
  'namePlural' => 'Events'
]))->build();

(new PostType([
  'slug' => 'artist',
  'name' => 'Artist',
  'namePlural' => 'Artists'
]))->build();

