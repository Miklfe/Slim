
		<li class="liSub">
		<span class="dd_wrapper">{'Menu'|@translate}</span>
<div class="sub">



	<ul>
	{foreach from=$block->data item=link}
		{if is_array($link)}
			<li><a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a></li>
		{/if}
	{/foreach}
	</ul>
</div>
</li>

