<?php

require ( WP_THEME_DIR . '/src/custom-post-type-builder.php' );

(new CustomPostType([
  'slug' => 'event',
  'name' => 'Event',
  'namePlural' => 'Events'
]))->build();
