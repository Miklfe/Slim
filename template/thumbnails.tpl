{php}
    global $page, $template;
    $template->assign('cat_name', $page['category']['name']);
	
	global $Slim;	$this->assign( 'Slim', $Slim );
{/php}


<div id="carouselthumb">
<div id="wrap">
<ul id="carousel" class="jcarousel-skin-cat">
		{if !empty($category_thumbnails)}
		
		{foreach from=$category_thumbnails item=cat}


			<li>
					<div class="illustration">
						<a href="{$cat.URL}">
							<img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '|@strip_tags:false} - {'display this album'|@translate}" min-width="{$derivative_params->max_width()}" height="{$derivative_params->max_height()}"/>
						</a>
					</div>
					
						
						<div class="CatMPdescription">
							<h3>
								<a href="{$cat.URL}">{$cat.NAME}</a>
							</h3>
							<div>
							{$cat.CAPTION_NB_IMAGES}
							</div>	
						</div>
			</li>
		{/foreach}{/if}


	{foreach from=$thumbnails item=thumbnail}
	{assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
			<li>
				<div class="iIllustration">
					<a href="{if ($Slim.style_slim)!=3}{$thumbnail.path}" class="lytebox" rev="slide:true group:name showNavigation:true navType:1 slideInterval:6000"{else}{$thumbnail.URL}"{/if} title="{$thumbnail.NAME|strip_tags:false|replace:'\'':'&#39;'|replace:'"':'&quot;'}">
					<img class="thumbnail" src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" min-width="{$derivative_params->max_width()}" height="{$derivative_params->max_height()}"/>
						
						{if $SHOW_THUMBNAIL_CAPTION }
							<div class="CatMPdescription">
								<H3>
									{$thumbnail.NAME}
									
									{if !empty($thumbnail.icon_ts)}
										<img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" alt="(!)">
									{/if}
								</h3>
								{if isset($thumbnail.NB_COMMENTS) or isset($thumbnail.NB_HITS)}
								<div>
									{if isset($thumbnail.NB_COMMENTS)}
										<p class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
										{$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
										</p>
									{/if}
									{if isset($thumbnail.NB_HITS)}
										<p class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
										{$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
										</p>
									{/if}
								</div>
								{/if}
							</div>
						{/if}
					</a>	
				</div>	
			</li>
	{/foreach}
</ul>
{footer_script}{literal}
function mycarousel_initCallback(carousel)
{
    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};

jQuery(document).ready(function() {
    jQuery('#carousel').jcarousel({
    	auto: 0,
		wrap: 'circular',
		scroll: 2,
		initCallback: mycarousel_initCallback,
		
    });
});

{/literal}{/footer_script}

</div>
</div>