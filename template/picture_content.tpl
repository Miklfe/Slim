<div id="imgContent">
	

	<img src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()} alt="{$ALT_IMG}" id="theMainImage"  title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE|@replace:'"':' '} - {$ALT_IMG}{/if}">

	

{if $DISPLAY_NAV_THUMB}
	<div class="navThumbs">
		
			<a class="navThumb" id="thumbPrevHov" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">
		{if isset($previous)}
		<img class="linkPrev" src="{$previous.derivatives.square->get_url()}" alt="{$previous.TITLE}">
		
			</a>
		{/if}
		{if isset($next)}
			<a class="navThumb" id="thumbNextHov" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next">
				<img class="linkNext" src="{$next.derivatives.square->get_url()}" alt="{$next.TITLE}">
			</a>
		{/if}
	</div>

{else}
	<div id="imgHoverNav">
		{if isset($previous)}
		<a id="imgPrevHov" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" alt="{$previous.TITLE}">
		</a>
		{/if}

		{if isset($next)}
		<a id="imgNextHov" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" alt="{$next.TITLE}">
		</a>
		{/if}
	</div>

{/if}

</div>