{html_head}
	<script type="text/javascript" src="themes/default/js/ui/minified/jquery.ui.slider.min.js"></script>
    <link rel="stylesheet" href="themes/Slim/admin/theme.css" />

<style media="screen" type="text/css">
	{literal}
		H3.ima{	color:#000;	font-size:15px;}	
		H3.imanoir{	color:#fff; font-size:15px;}
		tr.ton{	margin:10px;}	
		td.check{text-align:center;}	
		td.imag{text-align:right; width:100px; height:25px;	vertical-align:bottom; line-height: 1px;}
	{/literal}
</style>
{/html_head}
	
	
	
<div class="titrePage">
<h2>Slim</h2>
</div>

<form action="" method="post">



<fieldset>
<legend>{'Slim Color'|@translate}</legend>

<div id="option">
	<div class="switcher">
	<div class="opt">
	Slim
	</div>
	<div class="opt">
	Slim_L
	</div>
	<div class="opt">
	Slim_XL
	</div>
	
            <div>
                <input type="text" class="range min-1 max-3" name="style_slim" value="{$selected_style_slim}" />
            </div>
	</div>

	<div class="switcher">
	<div class="opt">
	Whith
	</div>
	<div class="opt">
	Black
	</div>
	<div class="opt">
	Grey
	</div>
	
			<div>
                <input type="text" class="range min-1 max-3" name="color_theme" value="{$selected_color_theme}" />
            </div>
</div>

{footer_script}{literal}
jQuery(function($){
    
    $('.range').each(function(){
       var cls      = $(this).attr('class');  
       var matches  = cls.split(/([a-zA-Z]+)\-([0-9]+)/g);
       var elem     = $(this).parent(); 
       var options  = {}; 
       var input    = elem.find('input'); 
       elem.append('<div class="uirange"></div>');
       
       for(i in matches){
           i = i * 1; 
           if(matches[i] == 'min'){
               options.min  = matches[i+1]*1;
           } 
           if(matches[i] == 'max'){
               options.max  = matches[i+1]*1;
           } 
       }
       
       options.slide = function(event, ui){
           elem.find('label span').empty().append(ui.value);
           input.val(ui.value);
       }
       options.value = input.val(); 
       options.range = 'min';
       elem.find('.uirange').slider(options); 
       
       elem.find('label span').empty().append(input.val()); 
       input.hide(); 
    });
    
});

{/literal}{/footer_script}

</fieldset>
<p><input type="submit" name="submit" value="{'Submit'|@translate}" {$TAG_INPUT_ENABLED}>
</form>

