{php}	global $Slim;	$this->assign( 'Slim', $Slim );{/php}

{if ($Slim.style_slim)==1}
{php}
header("Refresh: 2; index.php" );
{/php}

<div>
<h3>{'You are not authorized to access the requested page'|@translate}</h3>
</div>
{else}
{$MENUBAR}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
<div id="infoBlock">
<div class="titrePage">
	<ul class="categoryActions">
	</ul>
	<h2><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}{'Profile'|@translate}</h2>
</div>
</div>
{include file='infos_errors.tpl'}

{$PROFILE_CONTENT}
</div> <!-- content -->
{/if}