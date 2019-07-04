<?php

require ( 'src/custom-post-type-builder.php' );

(new CustomPostType([
  'slug' => 'event',
  'name' => 'Event',
  'namePlural' => 'Events'
]))->build();
