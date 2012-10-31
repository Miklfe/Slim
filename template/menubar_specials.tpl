	<li class="liSub">

			<span class="dd_wrapper">{'Specials'|@translate}</span>

	<div class="sub">

		<ul>
		{foreach from=$block->data item=link}
			<li>
			<a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a>
			</li>
		{/foreach}
		</ul>

	</div>
	</li>
