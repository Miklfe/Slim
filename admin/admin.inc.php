<?php
load_language('theme.lang', PHPWG_THEMES_PATH.'Slim/');


if (isset($_POST['submit']))
{
  $params  = array(	
					'style_slim'		=> $_POST['style_slim'],
					'color_theme'		=> $_POST['color_theme']
					);
  
  conf_update_param('Slim', pwg_db_real_escape_string(serialize($params)));

  array_push($page['infos'], l10n('Your configuration settings are saved'));

  load_conf_from_db();
}



$params = array_merge(unserialize($conf['Slim']));

$template->assign(array(
						'selected_style_slim'	=> $params['style_slim'],
						'selected_color_theme'	=> $params['color_theme']
						));



$template->set_filenames(array('theme_admin_content' => dirname(__FILE__) . '/admin.tpl'));
$template->assign('options', unserialize($conf['Slim']));
$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
 ?>