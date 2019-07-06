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
define('ADMIN_DIR', '/wp/wp-admin');
define('CONTENT_DIR', '/wp-content');
define('WP_CONTENT_DIR', dirname(__FILE__) . CONTENT_DIR);
define('WP_CONTENT_URL', WP_HOME . CONTENT_DIR);
define('WP_ADMIN_DIR', dirname(__FILE__) . ADMIN_DIR);

/** Disable WP automatic updates. Updates will be controlled via build/deployment process */
define('WP_AUTO_UPDATE_CORE', false);

/** Disable plugin installation. Plugins will be controlled via build/deployment process */
define('DISALLOW_FILE_MODS', true);

/** Disable file editing */
define('DISALLOW_FILE_EDIT', true);

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
  ini_set('display_errors', 'Off');
  ini_set('error_reporting', E_ALL);
}

define('WP_DEBUG', getenv('WP_DEBUG') === 'true');
define('WP_DEBUG_DISPLAY', getenv('WP_DEBUG_DISPLAY') === 'true');
define('WP_DEBUG_LOG', getenv('WP_DEBUG_LOG') === 'true');

define('GRAPHQL_DEBUG', TRUE);

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
define('AUTH_KEY', 'it03K;Vtrn`gThywp TL3,&A)JtXg?glfq~&_I+%BRI+]=A)6Uk<z{ij~aSo4~S%');
define('SECURE_AUTH_KEY', 'Gei37hv,J~w*&YbSdMz5Bq|nVF~_w>=+Cko|UMVie%fyU&z>Sv04xIzI9I-&GS~7');
define('LOGGED_IN_KEY', '}xL.+ xH$W8 2zyj+hz[uN}e/hj=qxua-<MKR*^1Fj&@-<Rbv=AD=l/D`> ~YjSq');
define('NONCE_KEY', 'zNz|@eY1Bjl.J!hsLgUK~#V693-Mf%q~bFPXf6y:IN4W{%3)MaD.px&*k`x6+aDs');
define('AUTH_SALT', 'b,cY%V8f^[]xKXEKuYcsQcp:FH+1(SeOR/xzxB2mjDvIGgfoK2=-,@-wa-pE5Bdf');
define('SECURE_AUTH_SALT', '~UWjGcH%L&D(gieW&-<_%^U-(+W^sHWvf^]_*e(nfV<C*kF<?qo[8irD,N}/SN`3');
define('LOGGED_IN_SALT', 'Gf]gm3.D%;pTqFy:w=@LVd)e&Tgl(,u#TRml@9,c>X8M<_C?,Db2y]:K)c4NyA+3');
define('NONCE_SALT', 'Ru.tq(YA0Btc)ZFKj-SB2~`E;faKV]R#--J&lg&4hn4_Ta{3eSueZ|^,moFQXoQe');

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
