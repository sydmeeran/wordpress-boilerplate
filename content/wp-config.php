<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

require_once dirname(__FILE__) . '/vendor/autoload.php';

$dotenv = new Dotenv\Dotenv(dirname(__FILE__));
if (file_exists(dirname(__FILE__) . '/.env')) {
  $dotenv->load();
  $dotenv->required(['DB_NAME', 'DB_USER', 'DB_PASSWORD', 'DB_HOST', 'WP_HOME', 'WP_SITEURL']);
}

if (function_exists('flush_rewrite_rules')) {
  flush_rewrite_rules();
}

if (getenv('WP_THEME')) {
  define('WP_DEFAULT_THEME', getenv('WP_THEME'));
}

// fix for too many redirects
if (getenv('ENABLE_HTTPS')) {
  $_SERVER['HTTPS'] = 'on';
}

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('DB_NAME'));

/** MySQL database username */
define('DB_USER', getenv('DB_USER'));

/** MySQL database password */
define('DB_PASSWORD', getenv('DB_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', getenv('DB_HOST'));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/** Custom WP site paths */
define('WP_HOME', getenv('WP_HOME'));
define('WP_SITEURL', getenv('WP_SITEURL'));

/** Custom WP directories */
// define('ADMIN_DIR', '/wp/wp-admin');
define('CONTENT_DIR', '/wp-content');
define('WP_CONTENT_DIR', dirname(__FILE__) . CONTENT_DIR);
define('WP_CONTENT_URL', WP_HOME . CONTENT_DIR);
define('WP_THEME_DIR', WP_CONTENT_DIR . '/' . 'themes' . '/' . getenv('WP_THEME'));

// define('WP_ADMIN_DIR', dirname(__FILE__) . ADMIN_DIR);

/** Disable WP automatic updates. Updates will be controlled via build/deployment process */
define('WP_AUTO_UPDATE_CORE', false);

/** Disable plugin installation. Plugins will be controlled via build/deployment process */
define('DISALLOW_FILE_MODS', true);

/** Disable file editing */
define('DISALLOW_FILE_EDIT', true);

define('WP_TRANSIENTS', true);

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */

if (!getenv('WP_DEBUG')) {
  ini_set('display_errors', 'on');
  ini_set('error_reporting', E_ALL);
}

define('WP_DEBUG', getenv('WP_DEBUG') === 'true');
define('WP_DEBUG_DISPLAY', getenv('WP_DEBUG_DISPLAY') === 'true');
define('WP_DEBUG_LOG', getenv('WP_DEBUG_LOG') === 'true');

define('GRAPHQL_DEBUG', true);

// frontend url for headless
define('FRONTEND_URL', getenv('FRONTEND_URL'));

// debug command to include / exclude google tag manager.
define('INCLUDE_GTM', getenv('INCLUDE_GTM') === 'true');

define('GOOGLE_MAPS_API_KEY', getenv('GOOGLE_MAPS_API_KEY'));

define('AS3CF_SETTINGS', serialize(array(
  'provider' => 'aws',
  'access-key-id' => getenv('AWS_ACCESS_KEY_ID'),
  'secret-access-key' => getenv('AWS_SECRET_ACCESS_KEY'),
)));

define('DBI_AWS_ACCESS_KEY_ID', getenv('AWS_ACCESS_KEY_ID'));
define('DBI_AWS_SECRET_ACCESS_KEY', getenv('AWS_SECRET_ACCESS_KEY'));

define('COM_AWS_CF_DISTRIBUTION_ID_BACKEND', getenv('MFW_CF_BACKEND'));
define('COM_AWS_CF_DISTRIBUTION_ID_FRONTEND', getenv('MFW_CF_FRONTEND'));

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY', '=p;00*gdSEX;CZS;ihdJ+:YO:JZvnv;^Nb1{91~q,P*;+d#Uaq)Be:di+*{2x95l');
define('SECURE_AUTH_KEY', 'fMMp=h0%6<+q,?[^u-(b0@u)5t>ebXO>IFr_sCt3NOL,+$nT2H$RjbwXh,3xqI]7');
define('LOGGED_IN_KEY', '&%,/z.<pV:;7?]zeB(AiH&u1Zo#SL~5jycws$!3q.tAjma*C8cJcA8+mWyOg},qk');
define('NONCE_KEY', ')4t?P3qVBoP:tI^*D/<.)H4#Wll>|rsABs@A;w$jd=g;?W]=KrWEm&CYp,JRaB^o');
define('AUTH_SALT', 'O4zBT>**NBf&@c3q@[%L31Ip({aFpu/gjA#Z{2{ 0XGA[.WQ.9*^@f]$YKJfYM0a');
define('SECURE_AUTH_SALT', 'gL<p_m}ZU~f^P$^7y]*3Xl3fCYcI/?wQ;H5;JmKS#:mgb:e)V~~0,_jAL^qRlrsG');
define('LOGGED_IN_SALT', '@jnammMETvqI/qD;Ce.RLBfZk+i ]8s;Zm4BWNGG8WQ2+o5Vr|afz^Jz*zPiqEQ)');
define('NONCE_SALT', 'w~_sd~9$Pjbg?cH.0[C!Q2t(B9u8(!Xm)p>9ZDz~%txC=(qjj78z5xA ,8;o^M_m');
define('WP_CACHE_KEY_SALT', 'ODJP|, pn(e3~B,cGmk4(7vT7<T|(h8ufQdiaB$f_Xi$Z].96+0QjqtXTPrF2ly?');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH')) {
  define('ABSPATH', dirname(__FILE__) . '/');
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
