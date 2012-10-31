<?php
if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

global $conf, $template;
	$params = array_merge(unserialize($conf['Slim']));
	
	
	
	
if ($params['color_theme'] == 2 )
		{
		$template->block_html_head('', '
<link rel="stylesheet" type="text/css" href="themes/Slim/theme_black.css">

		', $smarty, $repeat);
		};
if ($params['color_theme'] == 3 )
		{
		$template->block_html_head('', '
<link rel="stylesheet" type="text/css" href="themes/Slim/theme_grey.css">

		', $smarty, $repeat);
		};


		
		
?>