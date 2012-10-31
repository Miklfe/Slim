{php}	global $Slim;	$this->assign( 'Slim', $Slim );{/php}

{html_head} 
<link rel="alternate" type="application/rss+xml" title="{'Photos only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}"> 
<link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed (photos, comments)'|@translate}" href="{$U_FEED}"> 
{/html_head} 

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
    
    <h2>{'Notification'|@translate}</h2>
  </div>
</div>
  <div class="notification">
  <p>{'The RSS notification feed provides notification on news from this website : new photos, updated albums, new comments. Use a RSS feed reader.'|@translate}</p>

  <dl>
    <dt>
      <a href="{$U_FEED_IMAGE_ONLY}">{'Photos only RSS feed'|@translate}</a><br><br>
    </dt>
    <dt>
      <a href="{$U_FEED}">{'Complete RSS feed (photos, comments)'|@translate}</a>
    </dt>
  </dl>
  </div>
</div>
{/if}