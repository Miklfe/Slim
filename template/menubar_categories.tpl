	<span id="menu_start">
		<a href="{$block->data.U_CATEGORIES}">{'Albums'|@translate}</a>
</span>


<li class="liSub" >

	<span class="dd_wrapper">{'Categories'|@translate}</span>
	
		<div class="sub" style="width:700px;">
		{assign var='ref_level' value=0}
			<div id="menu_cat_act">
				<div id="nbImg">
			<p class="totalImages">{$pwg->l10n_dec('%d image', '%d images', $block->data.NB_PICTURE)}</p>
				</div>
				<div id="filter">
					{if isset($U_START_FILTER)}
						<a href="{$U_START_FILTER}" class="pwg-state-default pwg-button menubarFilter" title="{'display only recently posted photos'|@translate}" rel="nofollow">
						<span class="pwg-icon pwg-icon-filter"> </span>
						</a>
					{/if}
					{if isset($U_STOP_FILTER)}
					<a href="{$U_STOP_FILTER}" class="pwg-state-default pwg-button menubarFilter" title="{'return to the display of all photos'|@translate}"><span class="pwg-icon pwg-icon-filter-del"> </span></a>
					{/if}
				</div>

			</div>
			
			

			
{foreach from=$block->data.MENU_CATEGORIES item=cat}
	{if $cat.LEVEL > $ref_level}

		<ul class="mcol">
	{else}
		</li>
			{'</ul></li>'|@str_repeat:$ref_level-$cat.LEVEL}
	{/if}
		   <li {if $cat.SELECTED}class="selected"{/if}class="level{$cat.LEVEL}">
		   <a href="{$cat.URL}" {if $cat.IS_UPPERCAT}rel="up"{/if} title="{$cat.TITLE}" >{$cat.NAME}   [{$cat.count_images}] </a>
		  {assign var='ref_level' value=$cat.LEVEL}
		{/foreach}
	{'</li></ul>'|@str_repeat:$ref_level}	



	
		{if isset($block->data.U_UPLOAD)}
	<ul>
			<li>
				<a href="{$block->data.U_UPLOAD}">{'Upload a picture'|@translate}</a>
			</li>
	</ul>
		
	{/if}
		

		</div>
