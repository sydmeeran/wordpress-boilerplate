<?php

// cors


class CustomRestBuilder {
  private $_namespace;
  private $_version;

  function __construct($namespace = 'site', $version = 'v1') {
    $this->_namespace = $namespace;
    $this->_version = $version;
  }

  function registerGet($endpoint, $callback) {
    register_rest_route( $namespace, '/search' , [
      'methods'  => ['GET', 'OPTIONS'],
      'callback' => $callback,
    ]);
  }
}
