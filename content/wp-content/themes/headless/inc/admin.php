<?php

add_action('admin_head', 'hide_order_attribution');
function hide_order_attribution() {
  ?>

  <style>
    label[for="menu_order"],
    input[name="menu_order"],
    input[name="menu_order"] + p {
      display:none;
    }

    .post-attributes-label-wrapper,
    select[name="parent_id"] {
      display:inline-block;
      width: auto;
    }
  </style>

  <?php
}