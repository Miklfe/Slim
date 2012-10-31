{php}	global $Slim;	$this->assign( 'Slim', $Slim );{/php}
{if ($Slim.style_slim)!=1}

{if !empty($blocks) }
<div id=nav_wrapper>	

		
	<div id="menu" >
		<ul id="topnav">	
				{foreach from=$blocks key=id item=block}
					<span id="{$id}">
						{if not empty($block->template)}
						{include file=$block->template|@get_extent:$id }
						{else}
						{$block->raw_content}
						{/if}
					</span>
				{/foreach}
		</ul>
		
				<div id="search">
					<form action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
						<p style="margin:0;padding:0"{*this <p> is for html validation only - does not affect positioning*}>
							<input type="text" name="q" id="qsearchInput" onfocus="if (value==qsearch_prompt) value='';" onblur="if (value=='') value=qsearch_prompt;" />
							<input type="submit" value="" id="go"/>	
						</p>
					</form>
				<script type="text/javascript">var qsearch_prompt="{'Quick search'|@translate|@escape:'javascript'}"; document.getElementById('qsearchInput').value=qsearch_prompt;</script>
				</div>
			</div>
		</div>
{/if}
{/if}


