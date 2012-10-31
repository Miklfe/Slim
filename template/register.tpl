{php}	global $Slim;	$this->assign( 'Slim', $Slim );{/php}

{if ($Slim.style_slim)==1}
{php}
header("Refresh: 2; index.php" );
{/php}

<div>
<h3>{'You are not authorized to access the requested page'|@translate}</h3>
</div>
{else}
<div id="registerPage">

{$MENUBAR}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
<div id="infoBlock">
<div class="titrePage">
	<ul class="categoryActions">
	</ul>
	<h2><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}{'Registration'|@translate}</h2>
</div>
</div>

{include file='infos_errors.tpl'}

<form method="post" action="{$F_ACTION}" class="properties" name="register_form">
  <fieldset>
    <div class="fielTit"><h2>{'Enter your personnal informations'|@translate}</div></h2>

    <ul>
      <li>
        <span class="property">
          <label for="login">* {'Username'|@translate}</label>
        </span>
        <input type="text" name="login" id="login" value="{$F_LOGIN}" >
      </li>
      <li>
        <span class="property">
          <label for="password">* {'Password'|@translate}</label>
        </span>
        <input type="password" name="password" id="password" >
      </li>
      <li>
        <span class="property">
          <label for="password_conf">* {'Confirm Password'|@translate}</label>
        </span>
        <input type="password" name="password_conf" id="password_conf" >
      </li>
      <li>
        <span class="property">
          <label for="mail_address">{if $obligatory_user_mail_address}* {/if}{'Email address'|@translate}</label>
        </span>
        <input type="text" name="mail_address" id="mail_address" value="{$F_EMAIL}" >
      {if not $obligatory_user_mail_address}
        ({'useful when password forgotten'|@translate})
      {/if}
      </li>
      <li>
        <span class="property">
          <label for="send_password_by_mail">{'Send my connection settings by email'|@translate}</label>
        </span>
        <input type="checkbox" name="send_password_by_mail" id="send_password_by_mail" value="1" checked="checked">
      </li>
    </ul>

  </fieldset>

  <p class="bottomButtons">
		<input type="hidden" name="key" value="{$F_KEY}" >
    <input class="submit" type="submit" name="submit" value="{'Register'|@translate}">
    <input class="submit" type="reset" value="{'Reset'|@translate}">
  </p>

</form>

<script type="text/javascript"><!--
document.register_form.login.focus();
//--></script>

</div> <!-- content -->
</div> <!-- registerPage -->
{/if}