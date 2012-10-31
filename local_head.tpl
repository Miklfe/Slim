{php}
	global $Slim;
	$this->assign( 'Slim', $Slim );
{/php}

	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/default/fix-ie5-ie6.css">
	<![endif]-->
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="{$ROOT_URL}themes/default/fix-ie7.css">
	<![endif]-->
	{combine_css path="themes/default/print.css" order=-10}


{if (($Slim.style_slim)!=3)}
{combine_script id='lytebox' load='header' require='jquery' path='themes/Slim/js/lytebox.js'}
{/if}

{if (($Slim.style_slim)!=1)}
{combine_script id='menu' load='header' require='jquery' path='themes/Slim/js/menu.js'}
{combine_script id='hoverIntent' load='header' require='jquery' path='themes/Slim/js/jquery.hoverIntent.minified.js'}
{combine_script id='columnizer' load='header' require='jquery' path='themes/Slim/js/columnizer.js'}
{/if}