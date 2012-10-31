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
{if $display_mode == 'letters'}
		<li><a href="{$U_CLOUD}" title="{'show tag cloud'|@translate}" class="pwg-state-default pwg-button">
			<span class="pwg-icon pwg-icon-cloud">&nbsp;</span><span class="pwg-button-text">{'cloud'|@translate}</span>
		</a></li>
{/if}
{if $display_mode == 'cloud'}
		<li><a href="{$U_LETTERS}" title="{'group by letters'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
			<span class="pwg-icon pwg-icon-letters">&nbsp;</span><span class="pwg-button-text">{'letters'|@translate}</span>
		</a></li>
{/if}
	</ul>
	<h2><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}{'Tags'|@translate}</h2>
</div>
</div>
{include file='infos_errors.tpl'}

{if isset($tags)}
	{if $display_mode == 'cloud'}
	<div id="fullTagCloud">
		{foreach from=$tags item=tag}
		<span><a href="{$tag.URL}" class="tagLevel{$tag.level}" title="{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}">{$tag.name}</a></span>
		{/foreach}
	</div>
	{/if}

  {if $display_mode == 'letters'}
  <table>
    <tr>
      <td valign="top">
    {foreach from=$letters item=letter}
  <fieldset class="tagLetter">
    <div class="fielTit"><h2>{$letter.TITLE}</div></h2>
    <table class="tagLetterContent">
      {foreach from=$letter.tags item=tag}
      <tr class="tagLine">
        <td><a href="{$tag.URL}" title="{$tag.name}">{$tag.name}</a></td>
        <td class="nbEntries">{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}</td>
      </tr>
      {/foreach}
    </table>
  </fieldset>
      {if isset($letter.CHANGE_COLUMN) }
      </td>
      <td valign="top">
      {/if}
    {/foreach}
      </td>
    </tr>
  </table>
  {/if}
{/if}

</div> <!-- content -->
{/if}
