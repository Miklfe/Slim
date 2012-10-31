{* Example of resizeable *}
{*
{include file='include/autosize.inc.tpl'}
*}


{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" {if isset($MENUBAR)}class="contentWithMenu"{/if}>

{if isset($errors)}
<div class="errors">
  <ul>
    {foreach from=$errors item=error}
    <li>{$error}</li>
    {/foreach}
  </ul>
</div>
{/if}



{if isset($infos)}
<div class="infos">
  <ul>
    {foreach from=$infos item=info}
    <li>{$info}</li>
    {/foreach}
  </ul>
</div>
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

<div id="imageHeaderBar">
  <div class="browsePath">
  <h2>
    {$SECTION_TITLE}
    {$LEVEL_SEPARATOR}{$current.TITLE}
</h2>
  </div>
  <div class="imageNumber"> &nbsp{$PHOTO}</div>

</div>



<div id="theImage">


	<div id="imgContainer">

{$ELEMENT_CONTENT}
	

	{if !empty($navbar)}{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
	
	{include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}

</div>
	
{if isset($COMMENT_COUNT)}
<div id="comments" {if (!isset($comment_add) && ($COMMENT_COUNT == 0))}class="noCommentContent"{else}class="commentContent"{/if}><div id="commentsSwitcher"></div>
	<h3>{$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</h3>

	<div id="pictureComments">
		{if isset($comment_add)}
		<div id="commentAdd">
			<h4>{'Add a comment'|@translate}</h4>
			<form method="post" action="{$comment_add.F_ACTION}" id="addComment">
				{if $comment_add.SHOW_AUTHOR}
					<p><label for="author">{'Author'|@translate} :</label></p>
					<p><input type="text" name="author" id="author" value="{$comment_add.AUTHOR}"></p>
					<p><label for="contentid">{'Comment'|@translate} :</label></p>
				{/if}
				<p><textarea name="content" id="contentid" rows="8" cols="100">{$comment_add.CONTENT}</textarea></p>
				<p><input type="hidden" name="key" value="{$comment_add.KEY}">
					<input type="submit" value="{'Submit'|@translate}"></p>
			</form>
		</div>
		{/if}
		{if isset($comments)}
		<div id="pictureCommentList">
			{if (($COMMENT_COUNT > 2) || !empty($navbar))}
				<div id="pictureCommentNavBar">
					{if $COMMENT_COUNT > 2}
						<a href="{$COMMENTS_ORDER_URL}#comments" rel="nofollow" class="commentsOrder">{$COMMENTS_ORDER_TITLE}</a>
					{/if}
					{if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
				</div>
			{/if}
			{include file='comment_list.tpl'}
		</div>
		{/if}
		<div style="clear:both"></div>
	</div>

</div>
{/if}{*comments*}


<!--slideshow-->
{if isset($U_SLIDESHOW_STOP) }
<p>
  [ <a href="{$U_SLIDESHOW_STOP}">{'stop the slideshow'|@translate}</a> ]
</p>
{/if}








<div class="panel">

<div id="imageToolBar">
<div class="actionButtons">
{if count($current.unique_derivatives)>1}
{footer_script require='jquery'}{literal}
function changeImgSrc(url,typeSave,typeMap)
{
	var theImg = document.getElementById("theMainImage");
	if (theImg)
	{
		theImg.removeAttribute("width");theImg.removeAttribute("height");
		theImg.src = url;
		theImg.useMap = "#map"+typeMap;
	}
	jQuery('#derivativeSwitchBox .switchCheck').css('visibility','hidden');
	jQuery('#derivativeChecked'+typeSave).css('visibility','visible');
	document.cookie = 'picture_deriv='+typeSave+';path={/literal}{$COOKIE_PATH}{literal}';
}
jQuery("#derivativeSwitchLink").click(function() {
	var elt = jQuery("#derivativeSwitchBox");
	elt.css("left", Math.min( jQuery(this).offset().left, jQuery(window).width() - elt.outerWidth(true) - 5))
		.toggle();
});
jQuery("#derivativeSwitchBox").on("mouseleave click", function() {
	jQuery(this).hide();
});
{/literal}{/footer_script}
{strip}<a id="derivativeSwitchLink" title="{'Photo sizes'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
  <span class="pwg-icon pwg-icon-sizes">&nbsp;</span><span class="pwg-button-text">{'Photo sizes'|@translate}</span>
</a>
<div id="derivativeSwitchBox" class="switchBox">
  <div class="switchBoxTitle">{'Photo sizes'|@translate}</div>
  {foreach from=$current.unique_derivatives item=derivative key=derivative_type}
  <span class="switchCheck" id="derivativeChecked{$derivative_type}"{if $derivative->get_type() ne $current.selected_derivative->get_type()} style="visibility:hidden"{/if}>&#x2714; </span>
  <a href="javascript:changeImgSrc('{$derivative->get_url()|@escape:javascript}','{$derivative_type}','{$derivative->get_type()}')">
    {$derivative->get_type()|@translate}<span class="derivativeSizeDetails"> ({$derivative->get_size_hr()})</span>
  </a><br>
  {/foreach}
  {if isset($U_ORIGINAL)}
  <a href="javascript:phpWGOpenWindow('{$U_ORIGINAL}','xxx','scrollbars=yes,toolbar=no,status=no,resizable=yes')" rel="nofollow">{'Original'|@translate}</a>
  {/if}
</div>
{/strip}
{/if}
{strip}{if isset($U_SLIDESHOW_START)}
	<a href="{$U_SLIDESHOW_START}" title="{'slideshow'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-slideshow"> </span><span class="pwg-button-text">{'slideshow'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_METADATA)}
	<a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-camera-info"> </span><span class="pwg-button-text">{'Show file metadata'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($current.U_DOWNLOAD)}
	<a href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-save"> </span><span class="pwg-button-text">{'Download'|@translate}</span>
	</a>
{/if}{/strip}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
{strip}{if isset($favorite)}
	<a href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-favorite-{if $favorite.IS_FAVORITE}del{else}add{/if}"> </span><span class="pwg-button-text">{'Favorites'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_SET_AS_REPRESENTATIVE)}
	<a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-representative"> </span><span class="pwg-button-text">{'representative'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_ADMIN)}
	<a href="{$U_ADMIN}" title="{'Modify information'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-edit"> </span><span class="pwg-button-text">{'Edit'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_CADDIE)}{*caddie management BEGIN*}
{footer_script}
{literal}function addToCadie(aElement, rootUrl, id)
{
if (aElement.disabled) return;
aElement.disabled=true;
var y = new PwgWS(rootUrl);
y.callService(
	"pwg.caddie.add", {image_id: id} ,
	{
		onFailure: function(num, text) { alert(num + " " + text); document.location=aElement.href; },
		onSuccess: function(result) { aElement.disabled = false; }
	}
	);
}{/literal}
{/footer_script}
	<a href="{$U_CADDIE}" onclick="addToCadie(this, '{$ROOT_URL}', {$current.id}); return false;" title="{'Add to caddie'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-caddie-add"> </span><span class="pwg-button-text">{'Caddie'|@translate}</span>
	</a>
{/if}{/strip}{*caddie management END*}
</div>
</div>{*<!-- imageToolBar -->*}


<table id="standard" class="infoTable" summary="{'Some info about this picture'|@translate}">
{if $display_info.author}
  <tr>
    <td class="label">{'Author'|@translate}</td>
    <td class="value">{if isset($INFO_AUTHOR)}{$INFO_AUTHOR}{else}{'N/A'|@translate}{/if}</td>
{/if}
{if $display_info.created_on}
    <td class="label">{'Created on'|@translate}</td>
    <td class="value">{if isset($INFO_CREATION_DATE)}{$INFO_CREATION_DATE}{else}{'N/A'|@translate}{/if}</td>
  </tr>
{/if}
  
{if $display_info.posted_on}
  <tr >
    <td class="label">{'Posted on'|@translate}</td>
    <td class="value">{$INFO_POSTED_DATE}</td>
{/if}
{if $display_info.dimensions}
    <td class="label">{'Dimensions'|@translate}</td>
    <td class="value">{if isset($INFO_DIMENSIONS)}{$INFO_DIMENSIONS}{else}{'N/A'|@translate}{/if}</td>
  </tr>
{/if}

{if $display_info.file}
  <tr>
    <td class="label">{'File'|@translate}</td>
    <td class="value">{$INFO_FILE}</td>
{/if}
{if $display_info.filesize}
    <td class="label">{'Filesize'|@translate}</td>
    <td class="value">{if isset($INFO_FILESIZE)}{$INFO_FILESIZE}{else}{'N/A'|@translate}{/if}</td>
  </tr>
{/if}
  
{if $display_info.tags}
  <tr>
    <td class="label">{'Tags'|@translate}</td>
    <td class="value">
      {if isset($related_tags)}
        {foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}
        <a href="{$tag.URL}">{$tag.name}</a>{/foreach}
      {/if}
    </td>
{/if}
{if $display_info.categories}
    <td class="label">{'Categories'|@translate}</td>
    <td class="value">
      {if isset($related_categories)}
      <ul>
        {foreach from=$related_categories item=cat}
        <li>{$cat}</li>
        {/foreach}
      </ul>
      {/if}
    </td>
  </tr>
{/if}
  
{if $display_info.visits}
  <tr>
    <td class="label">{'Visits'|@translate}</td>
    <td class="value">{$INFO_VISITS}</td>
 
{/if}

{if $display_info.rating_score and isset($rate_summary)}
	
		<td class="label">{'Rating score'|@translate}</td>
		<td class="value" id="ratingSummary">
		{if $rate_summary.count}
			{$rate_summary.score}({assign var='rate_text' value='%d rates'|@translate}{$pwg->sprintf($rate_text, $rate_summary.count)})
			{else}
			{'no rate'|@translate}
		{/if}
		</td> 
	</tr>
{/if}
<tr height="24px">
{if isset($rating)}
		<td colspan="2" class="label" >
			<span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span>
		</td>
		<td colspan="2" class="value">
			<form action="{$rating.F_ACTION}" method="post" id="rateForm" style="margin:0;">
			<div>&nbsp;
			{foreach from=$rating.marks item=mark name=rate_loop}
			{if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
			  <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}">
			{else}
			  <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}">
			{/if}
			{/foreach}
			{strip}{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
			{combine_script id='rating' load='async' require='core.scripts' path='themes/default/js/rating.js'}
			{footer_script}
				var _pwgRatingAutoQueue = _pwgRatingAutoQueue||[];
				_pwgRatingAutoQueue.push( {ldelim}rootUrl: '{$ROOT_URL}', image_id: {$current.id},
					onSuccess : function(rating) {ldelim}
						var e = document.getElementById("updateRate");
						if (e) e.innerHTML = "{'Update your rating'|@translate|@escape:'javascript'}";
						e = document.getElementById("ratingScore");
						if (e) e.innerHTML = rating.score;
						e = document.getElementById("ratingCount");
						if (e) e.innerHTML = "({'%d rates'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
					{rdelim}{rdelim} );
			{/footer_script}
			{/strip}
			</div>
			</form>
		</td>
	</tr>
{/if}

{if $display_info.privacy_level and isset($available_permission_levels) }
	<tr id="Privacy">
		<td colspan="2" class="label">{'Who can see this photo?'|@translate}</td>
		<td colspan="2" class="value"> 
<script type="text/javascript">
{literal}function setPrivacyLevel(selectElement, rootUrl, id, level)
{
selectElement.disabled = true;
var y = new PwgWS(rootUrl);
y.callService(
	"pwg.images.setPrivacyLevel", {image_id: id, level:level} ,
	{
		method: "POST",
		onFailure: function(num, text) { selectElement.disabled = false; alert(num + " " + text); },
		onSuccess: function(result) { selectElement.disabled = false; }
	}
	);
}{/literal}
</script>
	<select onchange="setPrivacyLevel(this, '{$ROOT_URL|@escape:'javascript'}', {$current.id}, this.options[selectedIndex].value)">
		{foreach from=$available_permission_levels item=label key=level}
		<option label="{$label}" value="{$level}"{if $level == $current.level} selected="selected"{/if}>{$label}</option>
		{/foreach}
	</select>
	</td></tr>
{/if}

</table>

{if isset($metadata)}
<table id="Metadata" class="infoTable2" summary="{'Some more (technical) info about this picture'|@translate}">
{foreach from=$metadata item=meta}
  <tr>
    <th colspan="2">{$meta.TITLE}</th>
  </tr>
  {foreach from=$meta.lines item=value key=label}
  <tr>
    <td class="label">{$label}</td>
    <td class="value">{$value}</td>
  </tr>
  {/foreach}
{/foreach}
</table>
{/if}

</div> <!-- PANEL -->
<a class="trigger" href="#">infos</a>

{footer_script}{literal}
$(document).ready(function(){
	$(".trigger").click(function(){
		$(".panel").toggle("fast");
		$(this).toggleClass("active");
		return false;
	});
});
{/literal}{/footer_script}

</div>{*image*}



{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}



</div>