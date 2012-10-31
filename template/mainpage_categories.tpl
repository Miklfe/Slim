<div id="carouselcat">

<div id="wrap">
	  <ul id="carousel" class="jcarousel-skin-cat">

		{foreach from=$category_thumbnails item=cat}


			<li>
					<div class="illustration">
						<a href="{$cat.URL}">
							<img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '|@strip_tags:false} - {'display this album'|@translate}" min-width="{$derivative_params->max_width()}" height="{$derivative_params->max_height()-22}"/>
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
    	auto: 1,
		wrap: 'circular',
		scroll: 2,
		animation: 2000,
		initCallback: mycarousel_initCallback,
		
    });
});
{/literal}{/footer_script}
</div>
</div>