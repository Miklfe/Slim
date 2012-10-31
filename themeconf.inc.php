<?php
/*
Theme Name: Slim
Version: 1.0.2
Description: Slim.
Theme URI: http://fr.piwigo.org/ext/extension_view.php?eid=643
Author: Miklfe
Author URI: 
*/


	global $conf, $user, $Slim;

$themeconf = array(
	'name'  		=> 'Slim',
	'parent' 		=> 'default',
	'local_head'	=> 'local_head.tpl',


);



$Slim = array_merge( unserialize( $conf['Slim'] ), (array)$Slim );



add_event_handler('loc_begin_index', 'modify_nb_thumbnail_page');
function modify_nb_thumbnail_page()
{
global $user, $page;
	$user['nb_image_page']=999;
	$page['nb_image_page']=999;

}

add_event_handler('get_categories_menu_sql_where', 'mic_get_categories_menu_sql_where', EVENT_HANDLER_PRIORITY_NEUTRAL, 3 );
function mic_get_categories_menu_sql_where($where){	
	global $page;
		$where = '1';
	return $where;
}

if($user['theme']=='Slim'){
add_event_handler('loc_end_page_header', 'load_Slim' );

function load_Slim()
{
global $user, $page; 
if($page['body_id']=='theAdminPage' )
{}
else{
if($user['theme']=='Slim')
		{include('Slim.php');}
		
	}
}


if($Slim['style_slim']=='2')
{
   add_event_handler('blockmanager_apply', 'sans_comm' );
   function sans_comm( $menu_ref_arr )
{
    $menu = & $menu_ref_arr[0];
	$block = $menu->get_block( 'mbMenu' );
	unset( $block->data['comments'] );
}
}
}
?>