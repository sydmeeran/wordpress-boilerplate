# WordPress MySQL database migration
#
# Generated: Thursday 4. July 2019 10:11 AEST
# Hostname: db
# Database: `wordpress`
# URL: //boilerplate.test:8080
# Path: /var/www/html
# Tables: wp_commentmeta, wp_comments, wp_gf_draft_submissions, wp_gf_entry, wp_gf_entry_meta, wp_gf_entry_notes, wp_gf_form, wp_gf_form_meta, wp_gf_form_revisions, wp_gf_form_view, wp_links, wp_options, wp_pmxi_files, wp_pmxi_history, wp_pmxi_images, wp_pmxi_imports, wp_pmxi_posts, wp_pmxi_templates, wp_postmeta, wp_posts, wp_relevanssi, wp_relevanssi_log, wp_relevanssi_stopwords, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users, wp_yoast_seo_links, wp_yoast_seo_meta
# Table Prefix: wp_
# Post Types: revision, page, post
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_commentmeta`
#

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-07-04 00:10:18', '2019-07-04 00:10:18', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_draft_submissions`
#

DROP TABLE IF EXISTS `wp_gf_draft_submissions`;


#
# Table structure of table `wp_gf_draft_submissions`
#

CREATE TABLE `wp_gf_draft_submissions` (
  `uuid` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `submission` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_draft_submissions`
#

#
# End of data contents of table `wp_gf_draft_submissions`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry`
#

DROP TABLE IF EXISTS `wp_gf_entry`;


#
# Table structure of table `wp_gf_entry`
#

CREATE TABLE `wp_gf_entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_agent` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `currency` varchar(5) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `form_id_status` (`form_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_entry`
#

#
# End of data contents of table `wp_gf_entry`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry_meta`
#

DROP TABLE IF EXISTS `wp_gf_entry_meta`;


#
# Table structure of table `wp_gf_entry_meta`
#

CREATE TABLE `wp_gf_entry_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `entry_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  `item_index` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `entry_id` (`entry_id`),
  KEY `meta_value` (`meta_value`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_entry_meta`
#

#
# End of data contents of table `wp_gf_entry_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry_notes`
#

DROP TABLE IF EXISTS `wp_gf_entry_notes`;


#
# Table structure of table `wp_gf_entry_notes`
#

CREATE TABLE `wp_gf_entry_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci,
  `note_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `entry_user_key` (`entry_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_entry_notes`
#

#
# End of data contents of table `wp_gf_entry_notes`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form`
#

DROP TABLE IF EXISTS `wp_gf_form`;


#
# Table structure of table `wp_gf_form`
#

CREATE TABLE `wp_gf_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_form`
#

#
# End of data contents of table `wp_gf_form`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form_meta`
#

DROP TABLE IF EXISTS `wp_gf_form_meta`;


#
# Table structure of table `wp_gf_form_meta`
#

CREATE TABLE `wp_gf_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `entries_grid_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `confirmations` longtext COLLATE utf8mb4_unicode_520_ci,
  `notifications` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_form_meta`
#

#
# End of data contents of table `wp_gf_form_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form_revisions`
#

DROP TABLE IF EXISTS `wp_gf_form_revisions`;


#
# Table structure of table `wp_gf_form_revisions`
#

CREATE TABLE `wp_gf_form_revisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_form_revisions`
#

#
# End of data contents of table `wp_gf_form_revisions`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form_view`
#

DROP TABLE IF EXISTS `wp_gf_form_view`;


#
# Table structure of table `wp_gf_form_view`
#

CREATE TABLE `wp_gf_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_gf_form_view`
#

#
# End of data contents of table `wp_gf_form_view`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://boilerplate.test:8080/wp', 'yes'),
(2, 'home', 'http://boilerplate.test:8080/wp', 'yes'),
(3, 'blogname', 'Boilerplate', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'michael@sense.com.au', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:16:{i:0;s:41:"acf-to-rest-api/class-acf-to-rest-api.php";i:1;s:34:"advanced-custom-fields-pro/acf.php";i:2;s:61:"amazon-s3-and-cloudfront-pro/amazon-s3-and-cloudfront-pro.php";i:3;s:43:"amazon-web-services/amazon-web-services.php";i:4;s:33:"classic-editor/classic-editor.php";i:5;s:29:"easy-wp-smtp/easy-wp-smtp.php";i:6;s:59:"force-regenerate-thumbnails/force-regenerate-thumbnails.php";i:7;s:36:"google-sitemap-generator/sitemap.php";i:8;s:30:"gravity-forms/gravityforms.php";i:9;s:25:"relevanssi/relevanssi.php";i:10;s:51:"rest-api-for-relevanssi/rest-api-for-relevanssi.php";i:11;s:41:"wordpress-importer/wordpress-importer.php";i:12;s:24:"wordpress-seo/wp-seo.php";i:13;s:39:"wp-all-import-pro/wp-all-import-pro.php";i:14;s:31:"wp-migrate-db/wp-migrate-db.php";i:15;s:35:"wpai-acf-add-on/wpai-acf-add-on.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'headless', 'yes'),
(41, 'stylesheet', 'headless', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:2:{s:29:"easy-wp-smtp/easy-wp-smtp.php";s:17:"swpsmtp_uninstall";s:33:"classic-editor/classic-editor.php";a:2:{i:0;s:14:"Classic_Editor";i:1;s:9:"uninstall";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:20:"wpseo_manage_options";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:13:"wpseo_manager";a:2:{s:4:"name";s:11:"SEO Manager";s:12:"capabilities";a:37:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;s:28:"wpseo_edit_advanced_metadata";b:1;s:20:"wpseo_manage_options";b:1;}}s:12:"wpseo_editor";a:2:{s:4:"name";s:10:"SEO Editor";s:12:"capabilities";a:36:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;s:28:"wpseo_edit_advanced_metadata";b:1;}}}', 'yes'),
(95, 'fresh_site', '1', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(102, 'cron', 'a:6:{i:1562199023;a:5:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1562199028;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1562199037;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1562199057;a:2:{s:19:"wpseo-reindex-links";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:17:"gravityforms_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1562202657;a:1:{s:13:"sm_ping_daily";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(122, 'can_compress_scripts', '0', 'no'),
(129, 'recently_activated', 'a:0:{}', 'yes'),
(132, 'swpsmtp_options', 'a:5:{s:16:"from_email_field";s:0:"";s:15:"from_name_field";s:0:"";s:23:"force_from_name_replace";i:0;s:13:"smtp_settings";a:6:{s:4:"host";s:16:"smtp.example.com";s:15:"type_encryption";s:4:"none";s:4:"port";i:25;s:13:"autentication";s:3:"yes";s:8:"username";s:0:"";s:8:"password";s:0:"";}s:15:"allowed_domains";s:24:"Ym9pbGVycGxhdGUudGVzdA==";}', 'yes'),
(133, 'sm_rewrite_done', '$Id: sitemap-loader.php 937300 2014-06-23 18:04:11Z arnee $', 'yes'),
(134, 'gf_db_version', '2.4.9.5', 'no'),
(135, 'rg_form_version', '2.4.9.5', 'no'),
(136, 'gform_enable_background_updates', '1', 'yes'),
(137, 'gform_pending_installation', '1', 'yes'),
(138, 'relevanssi_admin_search', 'off', 'yes'),
(139, 'relevanssi_bg_col', '#ffaf75', 'yes'),
(140, 'relevanssi_cat', '0', 'yes'),
(141, 'relevanssi_class', 'relevanssi-query-term', 'yes'),
(142, 'relevanssi_comment_boost', '0.75', 'yes'),
(143, 'relevanssi_content_boost', '1', 'yes'),
(144, 'relevanssi_css', 'text-decoration: underline; text-color: #ff0000', 'yes'),
(145, 'relevanssi_db_version', '5', 'yes'),
(146, 'relevanssi_default_orderby', 'relevance', 'yes'),
(147, 'relevanssi_disable_or_fallback', 'off', 'yes'),
(148, 'relevanssi_exact_match_bonus', 'on', 'yes'),
(149, 'relevanssi_excat', '0', 'yes'),
(150, 'relevanssi_excerpt_allowable_tags', '', 'yes'),
(151, 'relevanssi_excerpt_custom_fields', 'off', 'yes'),
(152, 'relevanssi_excerpt_length', '30', 'yes'),
(153, 'relevanssi_excerpt_type', 'words', 'yes'),
(154, 'relevanssi_excerpts', 'on', 'yes'),
(155, 'relevanssi_exclude_posts', '', 'yes'),
(156, 'relevanssi_expand_shortcodes', 'on', 'yes'),
(157, 'relevanssi_extag', '0', 'yes'),
(158, 'relevanssi_fuzzy', 'sometimes', 'yes'),
(159, 'relevanssi_highlight', 'strong', 'yes'),
(160, 'relevanssi_highlight_comments', 'off', 'yes'),
(161, 'relevanssi_highlight_docs', 'off', 'yes'),
(162, 'relevanssi_hilite_title', '', 'yes'),
(163, 'relevanssi_implicit_operator', 'OR', 'yes'),
(164, 'relevanssi_index_author', '', 'yes'),
(165, 'relevanssi_index_comments', 'none', 'yes'),
(166, 'relevanssi_index_excerpt', 'off', 'yes'),
(167, 'relevanssi_index_fields', '', 'yes'),
(168, 'relevanssi_index_limit', '500', 'yes'),
(169, 'relevanssi_index_post_types', 'a:2:{i:0;s:4:"post";i:1;s:4:"page";}', 'yes'),
(170, 'relevanssi_index_taxonomies_list', 'a:0:{}', 'yes'),
(171, 'relevanssi_indexed', '', 'yes'),
(172, 'relevanssi_log_queries', 'off', 'yes'),
(173, 'relevanssi_log_queries_with_ip', 'off', 'yes'),
(174, 'relevanssi_min_word_length', '3', 'yes'),
(175, 'relevanssi_omit_from_logs', '', 'yes'),
(176, 'relevanssi_polylang_all_languages', 'off', 'yes'),
(177, 'relevanssi_punctuation', 'a:3:{s:6:"quotes";s:7:"replace";s:7:"hyphens";s:7:"replace";s:10:"ampersands";s:7:"replace";}', 'yes'),
(178, 'relevanssi_respect_exclude', 'on', 'yes'),
(179, 'relevanssi_show_matches', '', 'yes'),
(180, 'relevanssi_show_matches_text', '(Search hits: %body% in body, %title% in title, %categories% in categories, %tags% in tags, %taxonomies% in other taxonomies, %comments% in comments. Score: %score%)', 'yes'),
(181, 'relevanssi_synonyms', '', 'yes'),
(182, 'relevanssi_throttle', 'on', 'yes'),
(183, 'relevanssi_throttle_limit', '500', 'yes'),
(184, 'relevanssi_title_boost', '5', 'yes'),
(185, 'relevanssi_txt_col', '#ff0000', 'yes'),
(186, 'relevanssi_word_boundaries', 'on', 'yes'),
(187, 'relevanssi_wpml_only_current', 'on', 'yes'),
(188, 'PMAI_Plugin_Options', 'a:0:{}', 'yes'),
(189, 'PMXI_Plugin_Options', 'a:32:{s:12:"info_api_url";s:26:"http://www.wpallimport.com";s:18:"history_file_count";i:10000;s:16:"history_file_age";i:365;s:15:"highlight_limit";i:10000;s:19:"upload_max_filesize";i:2048;s:13:"post_max_size";i:2048;s:14:"max_input_time";i:-1;s:18:"max_execution_time";i:-1;s:7:"dismiss";i:0;s:16:"dismiss_speed_up";i:0;s:13:"html_entities";i:0;s:11:"utf8_decode";i:0;s:12:"cron_job_key";s:10:"ACPMiq.Pbf";s:10:"chunk_size";i:32;s:9:"pingbacks";i:1;s:33:"legacy_special_character_handling";i:1;s:14:"case_sensitive";i:1;s:12:"session_mode";s:7:"default";s:17:"enable_ftp_import";i:0;s:16:"large_feed_limit";i:1000;s:26:"cron_processing_time_limit";i:120;s:6:"secure";i:1;s:11:"log_storage";i:5;s:10:"cron_sleep";s:0:"";s:4:"port";s:0:"";s:16:"google_client_id";s:0:"";s:16:"google_signature";s:0:"";s:8:"licenses";a:0:{}s:8:"statuses";a:0:{}s:19:"force_stream_reader";i:0;s:18:"scheduling_license";s:0:"";s:25:"scheduling_license_status";s:0:"";}', 'yes'),
(191, 'wpseo', 'a:20:{s:15:"ms_defaults_set";b:0;s:7:"version";s:3:"9.7";s:20:"disableadvanced_meta";b:1;s:19:"onpage_indexability";b:1;s:11:"baiduverify";s:0:"";s:12:"googleverify";s:0:"";s:8:"msverify";s:0:"";s:12:"yandexverify";s:0:"";s:9:"site_type";s:0:"";s:20:"has_multiple_authors";s:0:"";s:16:"environment_type";s:0:"";s:23:"content_analysis_active";b:1;s:23:"keyword_analysis_active";b:1;s:21:"enable_admin_bar_menu";b:1;s:26:"enable_cornerstone_content";b:1;s:18:"enable_xml_sitemap";b:1;s:24:"enable_text_link_counter";b:1;s:22:"show_onboarding_notice";b:1;s:18:"first_activated_on";i:1562199056;s:18:"recalibration_beta";b:0;}', 'yes'),
(192, 'wpseo_titles', 'a:67:{s:10:"title_test";i:0;s:17:"forcerewritetitle";b:0;s:9:"separator";s:7:"sc-dash";s:16:"title-home-wpseo";s:42:"%%sitename%% %%page%% %%sep%% %%sitedesc%%";s:18:"title-author-wpseo";s:41:"%%name%%, Author at %%sitename%% %%page%%";s:19:"title-archive-wpseo";s:38:"%%date%% %%page%% %%sep%% %%sitename%%";s:18:"title-search-wpseo";s:63:"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%";s:15:"title-404-wpseo";s:35:"Page not found %%sep%% %%sitename%%";s:19:"metadesc-home-wpseo";s:0:"";s:21:"metadesc-author-wpseo";s:0:"";s:22:"metadesc-archive-wpseo";s:0:"";s:9:"rssbefore";s:0:"";s:8:"rssafter";s:53:"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.";s:20:"noindex-author-wpseo";b:0;s:28:"noindex-author-noposts-wpseo";b:1;s:21:"noindex-archive-wpseo";b:1;s:14:"disable-author";b:0;s:12:"disable-date";b:0;s:19:"disable-post_format";b:0;s:18:"disable-attachment";b:1;s:23:"is-media-purge-relevant";b:0;s:20:"breadcrumbs-404crumb";s:25:"Error 404: Page not found";s:29:"breadcrumbs-display-blog-page";b:1;s:20:"breadcrumbs-boldlast";b:0;s:25:"breadcrumbs-archiveprefix";s:12:"Archives for";s:18:"breadcrumbs-enable";b:0;s:16:"breadcrumbs-home";s:4:"Home";s:18:"breadcrumbs-prefix";s:0:"";s:24:"breadcrumbs-searchprefix";s:16:"You searched for";s:15:"breadcrumbs-sep";s:7:"&raquo;";s:12:"website_name";s:0:"";s:11:"person_name";s:0:"";s:22:"alternate_website_name";s:0:"";s:12:"company_logo";s:0:"";s:12:"company_name";s:0:"";s:17:"company_or_person";s:0:"";s:17:"stripcategorybase";b:0;s:10:"title-post";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-post";s:0:"";s:12:"noindex-post";b:0;s:13:"showdate-post";b:0;s:23:"display-metabox-pt-post";b:1;s:23:"post_types-post-maintax";i:0;s:10:"title-page";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-page";s:0:"";s:12:"noindex-page";b:0;s:13:"showdate-page";b:0;s:23:"display-metabox-pt-page";b:1;s:23:"post_types-page-maintax";i:0;s:16:"title-attachment";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-attachment";s:0:"";s:18:"noindex-attachment";b:0;s:19:"showdate-attachment";b:0;s:29:"display-metabox-pt-attachment";b:1;s:29:"post_types-attachment-maintax";i:0;s:18:"title-tax-category";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-category";s:0:"";s:28:"display-metabox-tax-category";b:1;s:20:"noindex-tax-category";b:0;s:18:"title-tax-post_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-post_tag";s:0:"";s:28:"display-metabox-tax-post_tag";b:1;s:20:"noindex-tax-post_tag";b:0;s:21:"title-tax-post_format";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-post_format";s:0:"";s:31:"display-metabox-tax-post_format";b:1;s:23:"noindex-tax-post_format";b:1;}', 'yes'),
(193, 'wpseo_social', 'a:20:{s:13:"facebook_site";s:0:"";s:13:"instagram_url";s:0:"";s:12:"linkedin_url";s:0:"";s:11:"myspace_url";s:0:"";s:16:"og_default_image";s:0:"";s:19:"og_default_image_id";s:0:"";s:18:"og_frontpage_title";s:0:"";s:17:"og_frontpage_desc";s:0:"";s:18:"og_frontpage_image";s:0:"";s:21:"og_frontpage_image_id";s:0:"";s:9:"opengraph";b:1;s:13:"pinterest_url";s:0:"";s:15:"pinterestverify";s:0:"";s:14:"plus-publisher";s:0:"";s:7:"twitter";b:1;s:12:"twitter_site";s:0:"";s:17:"twitter_card_type";s:19:"summary_large_image";s:11:"youtube_url";s:0:"";s:15:"google_plus_url";s:0:"";s:10:"fbadminapp";s:0:"";}', 'yes'),
(194, 'wpseo_flush_rewrite', '1', 'yes'),
(200, 'widget_gform_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(201, 'gravityformsaddon_gravityformswebapi_version', '1.0', 'yes'),
(202, 'gform_version_info', 'a:6:{s:12:"is_valid_key";s:1:"0";s:15:"expiration_time";i:0;s:7:"version";s:5:"1.7.9";s:3:"url";s:0:"";s:9:"offerings";a:0:{}s:9:"timestamp";i:1562199060;}', 'yes'),
(203, 'acf_version', '5.7.10', 'yes'),
(213, 'pmxi_is_migrated', '4.5.5', 'yes'),
(214, 'wp_all_import_db_version', '4.5.5', 'yes'),
(218, 'wp-all-import-pro_85b8495febade7a221f67b0bca7d59d9', 'O:8:"stdClass":16:{s:11:"new_version";s:5:"4.5.6";s:14:"stable_version";s:5:"4.5.6";s:4:"name";s:13:"WP All Import";s:4:"slug";s:17:"wp-all-import-pro";s:3:"url";s:67:"http://www.wpallimport.com/downloads/wp-all-import-pro/?changelog=1";s:12:"last_updated";s:19:"2018-05-23 19:56:07";s:8:"homepage";s:55:"http://www.wpallimport.com/downloads/wp-all-import-pro/";s:7:"package";s:0:"";s:13:"download_link";s:0:"";s:8:"sections";a:2:{s:11:"description";s:129:"<p>Learn more about WP All Import at <a href="https://www.wpallimport.com/" target="_blank">https://www.wpallimport.com/</a></p>\n";s:9:"changelog";s:21015:"<p>4.5.6</p>\n<ul>\n<li>improvement: add support for .tsv format</li>\n<li>improvement: load WP All Import only on admin dashboard on cron calls</li>\n<li>API: add new action pmxi_before_delete_post</li>\n<li>API: add new filter wp_all_import_use_wp_set_object_terms</li>\n<li>API: add new filter wp_all_import_copy_uploaded_file_into_files_folder</li>\n<li>API: add new filter wp_all_import_is_php_allowed</li>\n<li>API: add current XML variable to pmxi_article_data filter</li>\n<li>API: add articleData argument to wp_all_import_images_uploads_dir filter</li>\n<li>bug fix: search for existing images doesn\'t work properly when rename images option in use</li>\n<li>bug fix: post terms incorrect after import complete, must be recounted</li>\n<li>bug fix: empty attachments created when attachment import fails</li>\n<li>bug fix: page template for some posts is overwritten in some cases</li>\n<li>bug fix: pmxi_update_post_meta action not firing in some cases</li>\n<li>bug fix: unable to import featured image from content section</li>\n<li>bug fix: matching posts by ID matches and imports into attachments with the same ID</li>\n<li>bug fix: matching taxonomy terms by term ID matches and imports into posts and attachments with the same ID</li>\n<li>bug fix: remove deprecated function pmxi_convert_encoding from API</li>\n</ul>\n<p>4.5.5</p>\n<ul>\n<li>improvement: do not keep trigger log items in history</li>\n<li>improvement: added new filter wp_all_import_search_image_by_wp_attached_file</li>\n<li>improvement: added new filter wp_all_import_get_existing_image</li>\n<li>improvement: added pmxi_import_failed action</li>\n<li>improvement: search for existing attachments in /files folder</li>\n<li>improvement: set featured image from img tags when importing content</li>\n<li>bug fix: don\'t delete records from pmxi_posts for existing users and taxonomy terms</li>\n<li>bug fix: skipping empty lines during csv to xml convertation</li>\n<li>bug fix: skip post when custom field data is unchanged</li>\n<li>bug fix: import custom field name via XPath</li>\n<li>bug fix: trigger delete_post action when imported posts are deleting</li>\n<li>bug fix: imports that are scheduled to run at 12am/pm</li>\n<li>bug fix: fixed updating custom fields with quotes</li>\n</ul>\n<p>4.5.4</p>\n<ul>\n<li>bug fix: import using stream reader</li>\n<li>bug fix: generation temporary files in system temporary folder</li>\n</ul>\n<p>4.5.3</p>\n<ul>\n<li>improvement: add support for Toolset Types</li>\n<li>bug fix: trigger deleted_user action when import deleting a user</li>\n<li>bug fix: add-ons api - searching for existing images in pmxi_images table</li>\n<li>bug fix: php error on array push alias</li>\n</ul>\n<p>4.5.2</p>\n<ul>\n<li>new feature: Automatic Scheduling - run imports on a schedule</li>\n<li>improvement: search for existing images based on remote image URL</li>\n<li>improvement: various backend improvements to image imports</li>\n<li>improvement: various import speed optimizations</li>\n<li>bug fix: remove deprecated function calls for PHP 7.2 compatibility</li>\n<li>bug fix: delete db tables when mu blog deleted</li>\n<li>bug fix: remove BOM from import templates</li>\n<li>bug fix: saving CSV delimiter when changing import file</li>\n</ul>\n<p>4.5.1</p>\n<ul>\n<li>improvement: import images from dropbox</li>\n<li>improvement: skips import process to the first specific record</li>\n<li>improvement: added new filter wp_all_import_is_render_whole_xml_tree</li>\n<li>improvement: added wp_all_import_images_uploads_dir filter into add-ons api</li>\n<li>bug fix: conflict with InfiniteWP</li>\n<li>bug fix: oddity update notification for Link cloaking add-on</li>\n<li>bug fix: load functions before pmxi_before_xml_import</li>\n<li>bug fix: do not re-count category terms when post imported as draft</li>\n<li>bug fix: import base64 encoded images in add-ons</li>\n<li>bug fix: woo order custom fields auto-detection</li>\n<li>security fix - XSS exploit (Special thanks to Mardan Muhidin for reporting)</li>\n<li>security fix - XSS exploit (Special thanks to Yuji Tounai for reporting)</li>\n</ul>\n<p>4.5.0</p>\n<ul>\n<li>improvement: Make the WooCo Short Description expandable</li>\n<li>improvement: show notice when function editor is not saved</li>\n<li>improvement: added timestamp to import log lines</li>\n<li>improvement: added support for bmp images</li>\n<li>improvement: added new action pmxi_before_post_import_{$addon}</li>\n<li>security fix: patch XSS exploit</li>\n<li>bug fix: import pages hierarchy</li>\n<li>bug fix: error in pclzip.lib.php with php 7.1</li>\n<li>bug fix: import taxonomies hierarchy</li>\n<li>bug fix: json to xml convertation</li>\n<li>bug fix: import password protected feeds with port defined</li>\n</ul>\n<p>4.4.9</p>\n<ul>\n<li>improvement: custom fields detection</li>\n<li>improvement: new action wp_all_import_post_skipped</li>\n<li>improvement: updated history page title</li>\n<li>improvement: optimize large imports deletion</li>\n<li>improvement: added import friendly name to confirm screen</li>\n<li>improvement: sql query optimization on manage imports screen</li>\n<li>improvement: added wp_all_import_shard_delay filter</li>\n<li>improvement: added wp_all_import_images_uploads_dir filter</li>\n<li>bug fix: compatibility with WPML</li>\n<li>bug fix: generation image filename</li>\n<li>bug fix: wp_all_import_specified_records filter</li>\n</ul>\n<p>4.4.8</p>\n<ul>\n<li>improvement: added hungarian translation</li>\n<li>bug fix: csv headers generation</li>\n<li>bug fix: import template from Import Settings works again</li>\n<li>bug fix: users no longer logged out when user is update via import</li>\n<li>bug fix: images with encoded quotes</li>\n</ul>\n<p>4.4.7</p>\n<ul>\n<li>bug fix: cron job completed early for imports with xpath</li>\n<li>bug fix: csv headers with non latin characters</li>\n</ul>\n<p>4.4.6</p>\n<ul>\n<li>bug fix: cron job un-triggered on timeout error</li>\n</ul>\n<p>4.4.5</p>\n<ul>\n<li>bug fix: import xls from dropbox</li>\n<li>bug fix: template preview</li>\n</ul>\n<p>4.4.4</p>\n<ul>\n<li>improvement: new filter \'wp_all_import_phpexcel_delimiter\'</li>\n<li>improvement: new filter \'wp_all_import_is_trim_parsed_data\'</li>\n<li>improvement: added new \'filter wp_all_import_skip_x_csv_rows\'</li>\n<li>improvement: added csv delimiter setting to import options screen</li>\n<li>bug fix: taxonomies dropdown list</li>\n<li>bug fix: cron job was never untriggered when calling to undefined function</li>\n<li>bug fix: taxonomies preview</li>\n<li>bug fix: import duplicate tags</li>\n<li>bug fix: importing taxonomy terms that already exist in a different taxonomies</li>\n</ul>\n<p>4.4.3</p>\n<ul>\n<li>bug fix: parsing images for newly added records</li>\n<li>bug fix: the event calendar conflict</li>\n</ul>\n<p>4.4.2</p>\n<ul>\n<li>improvement: added new filter wp_all_import_phpexcel_object to modify excel data before import</li>\n<li>bug fix: search for images ending with underscores in media</li>\n<li>bug fix: import hierarchical posts and pages</li>\n<li>bug fix: import custom post type page templates</li>\n<li>bug fix: matching taxonomies by name</li>\n<li>bug fix: custom fields validation</li>\n</ul>\n<p>4.4.1</p>\n<ul>\n<li>improvement: compatibility with PHP 7.x</li>\n<li>improvement: search for existing attachments option</li>\n<li>improvement: new filter for file path of functions.php file</li>\n<li>bug fix: images preview</li>\n<li>bug fix: improved matching for images similar to image.com.png</li>\n</ul>\n<p>4.4.0</p>\n<ul>\n<li>new feature: added import taxonomies feature</li>\n<li>bug fix: hierarchy taxonomies preview</li>\n<li>bug fix: empty logs folder generation</li>\n<li>bug fix: \'Keep images currently in Media Library\' option for add-ons</li>\n<li>bug fix: import bundles with gz files</li>\n<li>bug fix: custom functions for attachments</li>\n</ul>\n<p>4.3.2</p>\n<ul>\n<li>improvement: \'Force Stream Reader\' setting</li>\n<li>improvement: tar + gz compression support for remote feeds</li>\n<li>improvement: new filter \'wp_all_import_auto_create_csv_headers\'</li>\n<li>improvement: new filter \'wp_all_import_is_base64_images_allowed\'</li>\n<li>improvement: new filter \'wp_all_import_set_post_terms\' to leave a specific category alone when a post is being updated</li>\n<li>bug fix: cron import timeout when set missing outofstock option is enabled</li>\n<li>bug fix: nodes navigation for xpath like /news/item</li>\n<li>bug fix: frozen import template screen for cyrillic XML feeds</li>\n<li>bug fix: conflict between taxonomies & user import</li>\n<li>bug fix: creating users with the same email</li>\n<li>bug fix: enable keep line breaks option by default</li>\n<li>bug fix: composer namespace conflict</li>\n<li>bug fix: images preview when wp is in subdirectory</li>\n<li>bug fix: \'Instead of deletion, set Custom Field\' option for users import</li>\n</ul>\n<p>4.3.1</p>\n<ul>\n<li>fixed issue with libxml 2.9.3</li>\n<li>execute \'pmxi_article_data\' filter for all posts ( new & existing )</li>\n</ul>\n<p>4.3.0</p>\n<ul>\n<li>added de_CH translation</li>\n<li>added support for .svg images</li>\n<li>added possibility for import excerpts for pages</li>\n<li>added new filter \'wp_all_import_specified_records\'</li>\n<li>added new filter \'wp_all_import_is_post_to_delete\'</li>\n<li>fixed saving function editor</li>\n<li>fixed custom fields mapping rules with \'0\' value</li>\n<li>fixed termination of the import if the "Delete source XML file after importing" is checked</li>\n<li>disable XMLReader stream filter for HHVM</li>\n<li>improve search for existing images in media gallery</li>\n</ul>\n<p>4.2.9</p>\n<ul>\n<li>fixed error messages on step 4</li>\n<li>fixed renaming image files</li>\n<li>fixed delete missing records option</li>\n<li>fixed csv to xml convertation in case when there are some equal titles in csv file</li>\n<li>stop using $HTTP_RAW_POST_DATA for PHP 7.x compatibility</li>\n<li>added new action \'pmxi_missing_post\'</li>\n</ul>\n<p>4.2.8</p>\n<ul>\n<li>update required database tables</li>\n</ul>\n<p>4.2.7</p>\n<ul>\n<li>fixed detecting root nodes with colons in names</li>\n<li>fixed php notice "Undefined variable: existing_meta_keys"</li>\n<li>fixed rendering special chars in function editor</li>\n<li>fixed css for WordPress 4.4</li>\n<li>added feature to delete only posts not import</li>\n<li>added feature to download template/bundle from import settings</li>\n<li>added new option for importing images "Use images currently in Media Library"</li>\n<li>remove periods to hyphens convertation in image name</li>\n<li>auto detect dropbox URLs and change to dl=1</li>\n<li>changed comma delimiting behavior/UI in image meta</li>\n</ul>\n<p>4.2.6</p>\n<ul>\n<li>fixed preview prices</li>\n<li>fixed counting XML nodes</li>\n</ul>\n<p>4.2.5</p>\n<ul>\n<li>fixed \'Delete source XML file after importing\' option</li>\n<li>fixed ‘Instead of deletion, change post status to Draft’ option</li>\n<li>fixed reading XML files with NS in element names</li>\n<li>added ‘WooCommerce Order’ to post type list on step 1</li>\n</ul>\n<p>4.2.4</p>\n<ul>\n<li>fixed duplicate matching by custom field</li>\n<li>fixed error messages on step1 in case when server throws fatal error e.q. time limit exception</li>\n<li>fixed option "Delete posts that are no longer present in your file", now it works with empty CSV files which has only one header row</li>\n<li>fixed importing custom fields with the same name</li>\n<li>fixed custom functions in images preview</li>\n<li>added es_ES translation</li>\n<li>added de_DE translation</li>\n<li>added iterative ajax delete process ( deleting associated posts )</li>\n</ul>\n<p>4.2.3</p>\n<ul>\n<li>Fixed removing uploaded XML source file on re-run process</li>\n</ul>\n<p>4.2.2</p>\n<ul>\n<li>Fixed saving function editor</li>\n</ul>\n<p>4.2.1</p>\n<ul>\n<li>fixed duplicate matching by custom field ( cron )</li>\n<li>fixed converting image filenames to lowercase</li>\n<li>fixed import html to image description</li>\n<li>fixed import _wp_old_slug</li>\n<li>added Post ID to manual record matching</li>\n<li>added \'Comment status\' to \'Choose data to update\' section</li>\n<li>added \'cancel\' to cron API /wp-cron.php?import_key=Kt&amp;import_id=407&amp;action=cancel</li>\n<li>added function editor</li>\n</ul>\n<p>4.2.0</p>\n<ul>\n<li>fixed parsing CSV with empty lines</li>\n<li>fixed parsing multiple IF statements</li>\n<li>fixed preview in case when ‘Disable the visual editor when writing’ is enabled</li>\n<li>fixed conflict with WooCommerce - Store Exporter Deluxe</li>\n<li>added possibility to start synchronized cron requests &amp;sync=1</li>\n<li>added notifications for required addons</li>\n<li>added support for wp all export bundle</li>\n<li>added support for manual import bundle</li>\n<li>added feature \'click to download import file\'</li>\n<li>added validation for excerpt and images sections</li>\n<li>added auto-detect a broken Unique ID notification</li>\n<li>added import template notifications</li>\n<li>removed support for importing WooCommerce Orders</li>\n<li>changed absolute paths to relative in db</li>\n<li>updated cron response messages</li>\n<li>moved uploaded files to \'Use existing\' dropdown</li>\n</ul>\n<p>4.1.7</p>\n<ul>\n<li>added support for Excel files ( .xls, .xlsx )</li>\n<li>added new option \'Do not remove images from media gallery\' on import<br />\nsettings screen</li>\n<li>added new options to taxonomies import \'Try to match terms to<br />\nexisting child Product Categories\' &amp; \'Only assign Products to the<br />\nimported Product Category, not the entire hierarchy\'</li>\n<li>fixed excessive update requests</li>\n<li>added options to \'Delete associated posts</li>\n</ul>\n<p>4.1.6</p>\n<ul>\n<li>load ini_set only on plugins pages</li>\n<li>fixed saving import template</li>\n<li>added import post format via XPath</li>\n</ul>\n<p>4.1.5</p>\n<ul>\n<li>fixed import page template</li>\n<li>added a second argument to pmxi_saved_post action ( SimpleXML object ) of current record</li>\n</ul>\n<p>4.1.4</p>\n<ul>\n<li>fixed Apply mapping rules before splitting via separator symbol for manual hierarchy</li>\n<li>fixed path equal or less than</li>\n<li>fixed changing unique key when moving back from confirm screen</li>\n<li>fixed override page template</li>\n<li>fixed unlink images on deleting missing posts</li>\n<li>updated wp_all_import_is_post_to_update filter with second argument XML node as array</li>\n<li>updated compatibility with WP All Export</li>\n<li>added filter wp_all_import_feed_type</li>\n<li>added possibility to use php to calculate URL on first step [add_to_url("https://google.com/")]</li>\n</ul>\n<p>4.1.3</p>\n<ul>\n<li>fixed un triggering issue on cron jobs for empty files</li>\n<li>changed updater priority from 10 to 20</li>\n<li>added post parent option for all hierarchical CPT</li>\n</ul>\n<p>4.1.2</p>\n<ul>\n<li>Important security fixes - additional hardening, prevention of blind SQL injection and reflected XSS attacks</li>\n</ul>\n<p>4.1.1</p>\n<ul>\n<li>critical security fix - stopping non-logged in users from accessing adminInit https://www.wpallimport.com/2015/02/wp-import-4-1-1-mandatory-security-update/</li>\n<li>added new filter wp_all_import_is_post_to_update to skip needed posts add_filter(\'wp_all_import_is_post_to_update\', \'is_post_to_update\', 10, 1);</li>\n<li>added new option Search for existing attachments to prevent duplicates in media library</li>\n<li>fixed imports pagination</li>\n<li>fixed preview taxonomies</li>\n<li>fixed upload folder creation when \'upload_dir\' filter defined</li>\n<li>fixed db schema for wpmu when new site added</li>\n</ul>\n<p>4.1.0</p>\n<ul>\n<li>fixed cron execution when titles are not defined</li>\n<li>added an option to separate hierarchy groups via symbol</li>\n<li>added separator symbol for manually nested taxonomies</li>\n</ul>\n<p>4.0.9</p>\n<ul>\n<li>added license key setting for automatic update</li>\n<li>added option search images through attachments</li>\n<li>added option assign term to the bottom level term in the hierarchy</li>\n</ul>\n<p>4.0.8</p>\n<ul>\n<li>fixed taxonomies preview</li>\n<li>fixed import meta description for images</li>\n<li>added feature to assign posts to needed terms</li>\n<li>added new option for taxonomies Apply mapping rules before splitting via separator symbol</li>\n<li>added set with XPath option for comment status, ping status, page parent, page template</li>\n</ul>\n<p>4.0.7</p>\n<ul>\n<li>fixed feed detection for rss chanels</li>\n<li>fixed parsing json data</li>\n<li>fixed add only new images option</li>\n<li>fixed delete missing records option</li>\n<li>added ability to import custom fields with the same name</li>\n<li>added port setting</li>\n</ul>\n<p>4.0.6</p>\n<ul>\n<li>fixed encoding for taxonomies mapping</li>\n<li>optimization for delete missing records option</li>\n<li>fixed feed type auto-detection</li>\n<li>fixed changes that related to _wp_page_template meta data</li>\n</ul>\n<p>4.0.5</p>\n<ul>\n<li>fixed template parsing when php function arguments contains an array()</li>\n<li>fixed error msg when feed is html page e.g. page 404</li>\n<li>fixed xpath building</li>\n<li>update hierarchy taxonomies options</li>\n</ul>\n<p>4.0.4</p>\n<ul>\n<li>changed main file name to wp-all-import-pro.php</li>\n<li>fixed feed type auto-detection</li>\n<li>fixed bug with empty unique keys</li>\n</ul>\n<p>4.0.3</p>\n<ul>\n<li>fixed re-count record when a file has been changed at an import setting screen</li>\n<li>fixed database schema auto-update</li>\n<li>fixed uploading large files</li>\n<li>fixed auto-detecting root element</li>\n<li>fixed log storage in database</li>\n<li>fixed cron execution when "do not create new records" option is enabled</li>\n<li>fixed feed type detection</li>\n<li>fixed unlink attachment source when posts updated/deleted</li>\n<li>fixed specialchars in taxnomies/categories mapping</li>\n<li>updated taxonomies hierarchy settings</li>\n<li>added a limit 10 to the existing meta values</li>\n</ul>\n<p>4.0.2</p>\n<ul>\n<li>speed up the import of taxonomies/categories</li>\n<li>added taxonomies/categories mapping feature</li>\n<li>added custom fields auto-detection feature</li>\n<li>added custom fields mapping feature</li>\n<li>added images/taxonomies preview feature</li>\n<li>added unofficial support for more file formats - json &amp; sql</li>\n<li>added new setting (secure mode) to protect your files</li>\n<li>better import logs</li>\n<li>updated design</li>\n</ul>\n<p>3.4.2</p>\n<ul>\n<li>fixed navigation bug</li>\n<li>fixed search duplicates</li>\n<li>fixed duplicate categories</li>\n<li>fixed path builder for element attributes</li>\n<li>fixed cron processing for already uploaded files (XML)</li>\n<li>added taxonomies for pages</li>\n</ul>\n<p>3.4.1</p>\n<ul>\n<li>fixed pmxi_delete_post action: this action was executed after posts were deleted</li>\n<li>fixed import menu order &amp; post parent for pages</li>\n<li>fixed import log for continue import feature</li>\n<li>added is update author option</li>\n<li>fixed post formats</li>\n<li>fixed cron processing: WP_Error object was not initialized</li>\n<li>fixed cron processing for import where XPath filtering is defined</li>\n<li>fixed UTC dates on manage imports page</li>\n</ul>\n<p>3.4.0</p>\n<ul>\n<li>fixed: import empty content</li>\n<li>fixed: log files</li>\n<li>fixed: detect image extension</li>\n<li>fixed: terms hierarchy on cron job execution</li>\n</ul>\n<p>3.3.9</p>\n<ul>\n<li>added: feature to do not escape shortcodes</li>\n<li>fixed: pre-processing logic</li>\n<li>fixed: downloading images with unicode url</li>\n<li>fixed: clear non ASCII/invalid symbols in CSV files</li>\n<li>fixed: import option \'Instead of using original image file name, set file name(s)\'</li>\n</ul>\n<p>3.3.8</p>\n<ul>\n<li>fixed: admin notices</li>\n<li>fixed: creation duplicates draft post via cron</li>\n<li>fixed: images with encoded symbols</li>\n<li>fixed: upload file via URL</li>\n<li>fixed: php notices</li>\n<li>added: compatibility with WP 3.9</li>\n</ul>\n<p>3.3.7</p>\n<ul>\n<li>updated convertation CSV to XML with XMLWriter</li>\n<li>fixed import *.zip files</li>\n<li>fixed xpath helper on step 2</li>\n<li>fixed showing zeros in XML tree</li>\n<li>allow post content to be empty on step 3</li>\n<li>added autodetect session mode</li>\n<li>delete deprecated settings my csv contain html code and case sensitivity</li>\n<li>fixed deleting history files</li>\n<li>fixed autodetect image extensions</li>\n<li>fixed increasing SQL query length</li>\n<li>added error messages</li>\n<li>fixed "High Speed Small File Processing" option</li>\n</ul>\n<p>3.3.6</p>\n<ul>\n<li>fixed: multiple cron execution</li>\n<li>fixed: load options template</li>\n<li>fixed: session initialization</li>\n<li>fixed: import search</li>\n<li>fixed: attachment author on cron execution</li>\n<li>fixed: download images option</li>\n<li>added: errors messages to the log</li>\n<li>added: "not contains" filter to step 2</li>\n<li>added: compatibility with categories mapping addon</li>\n<li>updated: cpt navigation on step 4</li>\n</ul>\n<p>3.3.5</p>\n<ul>\n<li>fixed bug with cron processing</li>\n<li>fixed bug with saving wrong image name</li>\n<li>added serialized custom fields feature</li>\n<li>added compatibility with user import add-on</li>\n<li>added compatibility with 3rd party developers</li>\n<li>added new setting \'Cron processing time limit\'</li>\n</ul>\n";}s:7:"banners";a:2:{s:4:"high";s:55:"http://ps.w.org/wp-all-import/assets/banner-772x250.png";s:3:"low";s:0:"";}s:5:"icons";s:6:"a:0:{}";s:8:"requires";s:5:"3.6.1";s:6:"tested";s:3:"5.2";s:6:"author";s:6:"Soflyy";s:12:"contributors";O:8:"stdClass":2:{s:6:"soflyy";s:38:"https://profiles.wordpress.org/soflyy/";s:11:"wpallimport";s:43:"https://profiles.wordpress.org/wpallimport/";}}', 'no'),
(219, 'wp-all-import-pro_timeout_85b8495febade7a221f67b0bca7d59d9', '1562202667', 'yes'),
(221, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1562199117;}', 'no') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_files`
#

DROP TABLE IF EXISTS `wp_pmxi_files`;


#
# Table structure of table `wp_pmxi_files`
#

CREATE TABLE `wp_pmxi_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `path` text COLLATE utf8mb4_unicode_520_ci,
  `registered_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_files`
#

#
# End of data contents of table `wp_pmxi_files`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_history`
#

DROP TABLE IF EXISTS `wp_pmxi_history`;


#
# Table structure of table `wp_pmxi_history`
#

CREATE TABLE `wp_pmxi_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) unsigned NOT NULL,
  `type` enum('manual','processing','trigger','continue','') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `time_run` text COLLATE utf8mb4_unicode_520_ci,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `summary` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_history`
#

#
# End of data contents of table `wp_pmxi_history`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_images`
#

DROP TABLE IF EXISTS `wp_pmxi_images`;


#
# Table structure of table `wp_pmxi_images`
#

CREATE TABLE `wp_pmxi_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attachment_id` bigint(20) unsigned NOT NULL,
  `image_url` varchar(600) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image_filename` varchar(600) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_images`
#

#
# End of data contents of table `wp_pmxi_images`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_imports`
#

DROP TABLE IF EXISTS `wp_pmxi_imports`;


#
# Table structure of table `wp_pmxi_imports`
#

CREATE TABLE `wp_pmxi_imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_import_id` bigint(20) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_520_ci,
  `friendly_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `feed_type` enum('xml','csv','zip','gz','') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8mb4_unicode_520_ci,
  `xpath` text COLLATE utf8mb4_unicode_520_ci,
  `options` longtext COLLATE utf8mb4_unicode_520_ci,
  `registered_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `root_element` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `processing` tinyint(1) NOT NULL DEFAULT '0',
  `executing` tinyint(1) NOT NULL DEFAULT '0',
  `triggered` tinyint(1) NOT NULL DEFAULT '0',
  `queue_chunk_number` bigint(20) NOT NULL DEFAULT '0',
  `first_import` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` bigint(20) NOT NULL DEFAULT '0',
  `imported` bigint(20) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `updated` bigint(20) NOT NULL DEFAULT '0',
  `skipped` bigint(20) NOT NULL DEFAULT '0',
  `deleted` bigint(20) NOT NULL DEFAULT '0',
  `canceled` tinyint(1) NOT NULL DEFAULT '0',
  `canceled_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `failed` tinyint(1) NOT NULL DEFAULT '0',
  `failed_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `settings_update_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_activity` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iteration` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_imports`
#

#
# End of data contents of table `wp_pmxi_imports`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_posts`
#

DROP TABLE IF EXISTS `wp_pmxi_posts`;


#
# Table structure of table `wp_pmxi_posts`
#

CREATE TABLE `wp_pmxi_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `import_id` bigint(20) unsigned NOT NULL,
  `unique_key` text COLLATE utf8mb4_unicode_520_ci,
  `product_key` text COLLATE utf8mb4_unicode_520_ci,
  `iteration` bigint(20) NOT NULL DEFAULT '0',
  `specified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `import_id` (`import_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_posts`
#

#
# End of data contents of table `wp_pmxi_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_pmxi_templates`
#

DROP TABLE IF EXISTS `wp_pmxi_templates`;


#
# Table structure of table `wp_pmxi_templates`
#

CREATE TABLE `wp_pmxi_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `options` longtext COLLATE utf8mb4_unicode_520_ci,
  `scheduled` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `content` longtext COLLATE utf8mb4_unicode_520_ci,
  `is_keep_linebreaks` tinyint(1) NOT NULL DEFAULT '0',
  `is_leave_html` tinyint(1) NOT NULL DEFAULT '0',
  `fix_characters` tinyint(1) NOT NULL DEFAULT '0',
  `meta` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_pmxi_templates`
#

#
# End of data contents of table `wp_pmxi_templates`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-07-04 00:10:18', '2019-07-04 00:10:18', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2019-07-04 00:10:18', '2019-07-04 00:10:18', '', 0, 'http://boilerplate.test:8080/?p=1', 0, 'post', '', 1),
(2, 1, '2019-07-04 00:10:18', '2019-07-04 00:10:18', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://boilerplate.test:8080/wp/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2019-07-04 00:10:18', '2019-07-04 00:10:18', '', 0, 'http://boilerplate.test:8080/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-07-04 00:10:18', '2019-07-04 00:10:18', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://boilerplate.test:8080.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-07-04 00:10:18', '2019-07-04 00:10:18', '', 0, 'http://boilerplate.test:8080/?page_id=3', 0, 'page', '', 0),
(4, 1, '2019-07-04 00:10:37', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-07-04 00:10:37', '0000-00-00 00:00:00', '', 0, 'http://boilerplate.test:8080/?p=4', 0, 'post', '', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_relevanssi`
#

DROP TABLE IF EXISTS `wp_relevanssi`;


#
# Table structure of table `wp_relevanssi`
#

CREATE TABLE `wp_relevanssi` (
  `doc` bigint(20) NOT NULL DEFAULT '0',
  `term` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `term_reverse` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `content` mediumint(9) NOT NULL DEFAULT '0',
  `title` mediumint(9) NOT NULL DEFAULT '0',
  `comment` mediumint(9) NOT NULL DEFAULT '0',
  `tag` mediumint(9) NOT NULL DEFAULT '0',
  `link` mediumint(9) NOT NULL DEFAULT '0',
  `author` mediumint(9) NOT NULL DEFAULT '0',
  `category` mediumint(9) NOT NULL DEFAULT '0',
  `excerpt` mediumint(9) NOT NULL DEFAULT '0',
  `taxonomy` mediumint(9) NOT NULL DEFAULT '0',
  `customfield` mediumint(9) NOT NULL DEFAULT '0',
  `mysqlcolumn` mediumint(9) NOT NULL DEFAULT '0',
  `taxonomy_detail` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customfield_detail` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mysqlcolumn_detail` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(210) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `item` bigint(20) NOT NULL DEFAULT '0',
  UNIQUE KEY `doctermitem` (`doc`,`term`,`item`),
  KEY `terms` (`term`(20)),
  KEY `relevanssi_term_reverse_idx` (`term_reverse`(10)),
  KEY `docs` (`doc`),
  KEY `typeitem` (`type`(190),`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_relevanssi`
#

#
# End of data contents of table `wp_relevanssi`
# --------------------------------------------------------



#
# Delete any existing table `wp_relevanssi_log`
#

DROP TABLE IF EXISTS `wp_relevanssi_log`;


#
# Table structure of table `wp_relevanssi_log`
#

CREATE TABLE `wp_relevanssi_log` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT,
  `query` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hits` mediumint(9) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  KEY `query` (`query`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_relevanssi_log`
#

#
# End of data contents of table `wp_relevanssi_log`
# --------------------------------------------------------



#
# Delete any existing table `wp_relevanssi_stopwords`
#

DROP TABLE IF EXISTS `wp_relevanssi_stopwords`;


#
# Table structure of table `wp_relevanssi_stopwords`
#

CREATE TABLE `wp_relevanssi_stopwords` (
  `stopword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `stopword` (`stopword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_relevanssi_stopwords`
#
INSERT INTO `wp_relevanssi_stopwords` ( `stopword`) VALUES
('a'),
('about'),
('above'),
('across'),
('after'),
('afterwards'),
('again'),
('against'),
('all'),
('almost'),
('alone'),
('along'),
('already'),
('also'),
('although'),
('always'),
('am'),
('among'),
('amongst'),
('amoungst'),
('amount'),
('an'),
('and'),
('another'),
('any'),
('anyhow'),
('anyone'),
('anything'),
('anyway'),
('anywhere'),
('are'),
('around'),
('as'),
('at'),
('back'),
('be'),
('became'),
('because'),
('become'),
('becomes'),
('becoming'),
('been'),
('before'),
('beforehand'),
('behind'),
('being'),
('below'),
('beside'),
('besides'),
('between'),
('beyond'),
('bill'),
('both'),
('bottom'),
('but'),
('by'),
('call'),
('can'),
('cannot'),
('cant'),
('co'),
('con'),
('could'),
('couldnt'),
('cry'),
('de'),
('describe'),
('detail'),
('do'),
('done'),
('down'),
('due'),
('during'),
('each'),
('eg'),
('eight'),
('either'),
('eleven'),
('else'),
('elsewhere'),
('empty'),
('enough'),
('etc'),
('even'),
('ever'),
('every'),
('everyone'),
('everything'),
('everywhere'),
('except'),
('few'),
('fifteen'),
('fifty'),
('fill'),
('find'),
('fire'),
('first'),
('five'),
('for'),
('former') ;
INSERT INTO `wp_relevanssi_stopwords` ( `stopword`) VALUES
('formerly'),
('forty'),
('found'),
('four'),
('from'),
('front'),
('full'),
('further'),
('get'),
('give'),
('go'),
('had'),
('has'),
('hasnt'),
('have'),
('he'),
('hence'),
('her'),
('here'),
('hereafter'),
('hereby'),
('herein'),
('hereupon'),
('hers'),
('herself'),
('him'),
('himself'),
('his'),
('how'),
('however'),
('hundred'),
('ie'),
('if'),
('in'),
('inc'),
('indeed'),
('interest'),
('into'),
('is'),
('it'),
('its'),
('itself'),
('keep'),
('last'),
('latter'),
('latterly'),
('least'),
('less'),
('ltd'),
('made'),
('many'),
('may'),
('me'),
('meanwhile'),
('might'),
('mill'),
('mine'),
('more'),
('moreover'),
('most'),
('mostly'),
('move'),
('much'),
('must'),
('my'),
('myself'),
('name'),
('namely'),
('neither'),
('never'),
('nevertheless'),
('next'),
('nine'),
('no'),
('nobody'),
('none'),
('noone'),
('nor'),
('not'),
('nothing'),
('now'),
('nowhere'),
('of'),
('off'),
('often'),
('on'),
('once'),
('one'),
('only'),
('onto'),
('or'),
('other'),
('others'),
('otherwise'),
('our'),
('ours'),
('ourselves'),
('out'),
('over'),
('own') ;
INSERT INTO `wp_relevanssi_stopwords` ( `stopword`) VALUES
('part'),
('per'),
('perhaps'),
('please'),
('put'),
('rather'),
('re'),
('same'),
('see'),
('seem'),
('seemed'),
('seeming'),
('seems'),
('serious'),
('several'),
('she'),
('should'),
('show'),
('side'),
('since'),
('sincere'),
('six'),
('sixty'),
('so'),
('some'),
('somehow'),
('someone'),
('something'),
('sometime'),
('sometimes'),
('somewhere'),
('still'),
('such'),
('system'),
('take'),
('ten'),
('than'),
('that'),
('the'),
('their'),
('them'),
('themselves'),
('then'),
('thence'),
('there'),
('thereafter'),
('thereby'),
('therefore'),
('therein'),
('thereupon'),
('these'),
('they'),
('thickv'),
('thin'),
('third'),
('this'),
('those'),
('though'),
('three'),
('through'),
('throughout'),
('thru'),
('thus'),
('to'),
('together'),
('too'),
('top'),
('toward'),
('towards'),
('twelve'),
('twenty'),
('two'),
('un'),
('under'),
('until'),
('up'),
('upon'),
('us'),
('very'),
('via'),
('was'),
('we'),
('well'),
('were'),
('what'),
('whatever'),
('when'),
('whence'),
('whenever'),
('where'),
('whereafter'),
('whereas'),
('whereby'),
('wherein'),
('whereupon'),
('wherever'),
('whether'),
('which'),
('while'),
('whither') ;
INSERT INTO `wp_relevanssi_stopwords` ( `stopword`) VALUES
('who'),
('whoever'),
('whole'),
('whom'),
('whose'),
('why'),
('will'),
('with'),
('within'),
('without'),
('would'),
('yet'),
('you'),
('your'),
('yours'),
('yourself'),
('yourselves') ;

#
# End of data contents of table `wp_relevanssi_stopwords`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_termmeta`
#

DROP TABLE IF EXISTS `wp_termmeta`;


#
# Table structure of table `wp_termmeta`
#

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_termmeta`
#

#
# End of data contents of table `wp_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'sense'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:"6c79cc21e886be45c84c1102a43b4f316db544b4f96a4d6438b891a7be7c6f20";a:4:{s:10:"expiration";i:1562371828;s:2:"ip";s:10:"172.21.0.2";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1562199028;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:10:"172.21.0.0";}'),
(19, 1, 'wp_yoast_notifications', 'a:5:{i:0;a:2:{s:7:"message";s:623:"<p>The <em>Google XML Sitemaps</em> plugin might cause issues when used in conjunction with Yoast SEO.</p><p>Both Yoast SEO and Google XML Sitemaps can create XML sitemaps. Having two XML sitemaps is not beneficial for search engines and might slow down your site.<br/><br/><a class="button" href="http://boilerplate.test:8080/wp/wp-admin/admin.php?page=wpseo_dashboard#top#features">Toggle Yoast SEO\'s XML Sitemap</a></p><a class="button button-primary" href="plugins.php?action=deactivate&amp;plugin=google-sitemap-generator%2Fsitemap.php&amp;plugin_status=all&amp;_wpnonce=d19c30f318">Deactivate Google XML Sitemaps</a> ";s:7:"options";a:9:{s:4:"type";s:5:"error";s:2:"id";s:47:"wpseo-conflict-d3e7311d20ccd459ef1ade2a522ccfe6";s:5:"nonce";N;s:8:"priority";d:0.5;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";a:1:{i:0;s:20:"wpseo_manage_options";}s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}i:1;a:2:{s:7:"message";s:174:"Don\'t miss your crawl errors: <a href="http://boilerplate.test:8080/wp/wp-admin/admin.php?page=wpseo_search_console&tab=settings">connect with Google Search Console here</a>.";s:7:"options";a:9:{s:4:"type";s:7:"warning";s:2:"id";s:17:"wpseo-dismiss-gsc";s:5:"nonce";N;s:8:"priority";d:0.5;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";s:20:"wpseo_manage_options";s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}i:2;a:2:{s:7:"message";s:223:"You still have the default WordPress tagline, even an empty one is probably better. <a href="http://boilerplate.test:8080/wp/wp-admin/customize.php?autofocus[control]=blogdescription">You can fix this in the customizer</a>.";s:7:"options";a:9:{s:4:"type";s:5:"error";s:2:"id";s:28:"wpseo-dismiss-tagline-notice";s:5:"nonce";N;s:8:"priority";d:0.5;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";s:20:"wpseo_manage_options";s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}i:3;a:2:{s:7:"message";s:228:"<strong>Huge SEO Issue: You\'re blocking access to robots.</strong> You must <a href="http://boilerplate.test:8080/wp/wp-admin/options-reading.php">go to your Reading Settings</a> and uncheck the box for Search Engine Visibility.";s:7:"options";a:9:{s:4:"type";s:5:"error";s:2:"id";s:32:"wpseo-dismiss-blog-public-notice";s:5:"nonce";N;s:8:"priority";i:1;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";s:20:"wpseo_manage_options";s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}i:4;a:2:{s:7:"message";s:309:"You do not have your postname in the URL of your posts and pages, it is highly recommended that you do. Consider setting your permalink structure to <strong>/%postname%/</strong>.<br/>You can fix this on the <a href="http://boilerplate.test:8080/wp/wp-admin/options-permalink.php">Permalink settings page</a>.";s:7:"options";a:9:{s:4:"type";s:7:"warning";s:2:"id";s:30:"wpseo-dismiss-permalink-notice";s:5:"nonce";N;s:8:"priority";d:0.80000000000000004;s:9:"data_json";a:0:{}s:13:"dismissal_key";N;s:12:"capabilities";s:20:"wpseo_manage_options";s:16:"capability_check";s:3:"all";s:14:"yoast_branding";b:0;}}}') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'sense', '$P$Ba4hXHB1aTrJnJ9tOsK3Xpg4WBe54s0', 'sense', 'wordpress@senseadvertising.com.au', '', '2019-07-04 00:10:17', '', 0, 'Sense') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------



#
# Delete any existing table `wp_yoast_seo_links`
#

DROP TABLE IF EXISTS `wp_yoast_seo_links`;


#
# Table structure of table `wp_yoast_seo_links`
#

CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_yoast_seo_links`
#

#
# End of data contents of table `wp_yoast_seo_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_yoast_seo_meta`
#

DROP TABLE IF EXISTS `wp_yoast_seo_meta`;


#
# Table structure of table `wp_yoast_seo_meta`
#

CREATE TABLE `wp_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_yoast_seo_meta`
#

#
# End of data contents of table `wp_yoast_seo_meta`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

