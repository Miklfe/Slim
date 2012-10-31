	<li class="liSub">

<span class="dd_wrapper">{'Links'|@translate}</span>
	<div class="sub">
	<ul>
		{foreach from=$block->data item=link}
			<li>
				<a href="{$link.URL}" class="external" 
					{if isset($link.new_window) } onclick="window.open(this.href, '{$link.new_window.NAME}','{$link.new_window.FEATURES}'); return false;"{/if}
				>
				{$link.LABEL}
				</a>
			</li>
		{/foreach}
	</ul>
</div>
</li>





