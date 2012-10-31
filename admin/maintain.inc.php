<?php

function theme_activate($id, $version, &$errors)
	{
	global $conf;

	if (!isset($conf['Slim']))
		{
		$config = array(
						'style_slim'		=> '1',
						'color_theme'   	=> '1'
						);
		  
		$query = "
	INSERT INTO " . CONFIG_TABLE . " (param,value,comment)
	VALUES ('Slim' , '".pwg_db_real_escape_string(serialize($config))."' , 'Slim theme parameters');";

		pwg_query($query);
		}
	}

function theme_deactivate()
	{
    $query = "DELETE FROM " . CONFIG_TABLE . " WHERE param='Slim';";
	pwg_query($query);
	}

?>