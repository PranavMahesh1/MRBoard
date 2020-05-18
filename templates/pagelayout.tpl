<table id="main" class="layout-table">
<tr>
<td id="main-header" colspan="2">
	<table id="header" class="outline">
		<tr class="cell0 center">
			<td>
				<a href="{actionLink page='home'}"><img id="theme_banner" src="http://mariomansion.net/img/logo.png" alt="{$boardname}" title="{$boardname}"></a><br>
				{$numnotifs=count($notifications)}
				{if $numnotifs}
					<div id="notifMenuContainer" class="dropdownContainer hasNotifs">
						<div id="notifMenuButton" class="navButton">
							You have <span id="notifCount">{$numnotifs}</span> new message(s)!
						</div>
						<ul id="notifList" class="dropdownMenu">
						{foreach $notifications as $notif}
							<li>{$notif.text}<br><small>{$notif.formattedDate}</small>
						{/foreach}
						</ul>
					</div>
				{/if}
			</td>
		</tr>
		<tr class="cell2">
			<td class="smallFonts center">
				{$layout_onlineusers}{if $layout_birthdays}{$layout_birthdays}{/if}
			</td>
		</tr>
	</table>
</td>
</tr>

<tr>
<td id="main-sidebar">

	<table id="sidebar" class="outline">

		<tr>
			<td class="cell1">
				<table class="outline margin">
					<tr class="header1"><th>User panel</th></tr>
					{if $loguserid}
					<tr class="cell0"><td>{$loguserlink}</td></tr>
					{if HasPermission('user.editprofile')}<tr class="cell1"><td><a href="{actionLink page='editprofile'}">Edit profile</a></td></tr>{/if}
					{if HasPermission('user.editavatars')}<tr class="cell1"><td><a href="{actionLink page='editavatars'}">Mood avatars</a></td></tr>{/if}
					<tr class="cell1"><td><a href="{actionLink page='private'}">Private messages</a></td></tr>
					<tr class="cell1"><td><a href="{actionLink page='favorites'}">Favorites</a></td></tr>
					{if HasPermission('admin.viewadminpanel')}<tr class="cell1"><td><a href="{actionLink page='admin'}">Admin Dashboard</a></td></tr>{/if}
					<tr class="cell1"><td><a href="#" onclick="$('#logout').submit(); return false;">Log out</a></td></tr>
					{else}
					<tr class="cell0"><td><a href="{actionLink page='register'}">Register</a></td></tr>
					<tr class="cell1"><td><a href="{actionLink page='login'}">Log in</a></td></tr>
					{/if}
				</table>
				<table class="outline margin">
					<tr class="header1"><th>Navigation</th></tr>
					<tr class="cell0"><td><a href="{actionLink page='home'}">Home</a></td></tr>
					<tr class="cell1"><td><a href="{actionLink page='board'}">Forums</a></td></tr>
					<tr class="cell1"><td><a href="{actionLink page='faq'}">Rules</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='memberlist'}">Member List</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='irc'}">IRC Chat</a></td></tr>	
					<tr class="cell1"><td><a href="{actionLink page='ranks'}">Ranks</a></td></tr>
					{if $loguserid}
					<tr class="cell1"><td><a href="{actionLink page='online'}">Online users</a></td></tr>
					{/if}
					<tr class="cell0"><td><a href="{actionLink page='search'}">Search</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='lastposts'}">Latest posts</a></td></tr>
				</table>
				
				<table class="outline margin">
					<tr class="header1"><th>Important Links</th></tr>
					<tr class="cell0"><td><a href="{actionLink page='downloads'}">Downloads</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='announcements'}">Announcements</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='news'}">News</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='calendar'}">Calendar</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='records'}">Board Records</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='links'}">Links</a></td></tr>
				</table>
				
<table class="outline margin">
					<tr class="header1"><th>Important Modding Tools</th></tr>
					<tr class="cell0"><td><a href="http://mariomansion.net/uploads/SMBUtil_ENG.rar">SMB Utility</a></td></tr>
					<tr class="cell0"><td><a href="http://mariomansion.net/uploads/SMB2TRANS.zip">SMB2 Transmogrificator</a></td></tr>
					<tr class="cell0"><td><a href="http://mariomansion.net/uploads/SMB3_Workshop.zip">SMB3 Workshop</a></td></tr>
					<tr class="cell0"><td><a href="http://mariomansion.net/uploads/FloatingIPS.zip">Floating IPS</a></td></tr>
					<tr class="cell0"><td><a href="{actionLink page='downloads'}">Other Tools</a></td></tr>
				</table>
				
				<table class="outline margin">
					<tr class="header1"><th>{$poratitle}</th></tr>
					
					<tr class="cell{if $poratext}1{else}0{/if}"><td><center>{$layout_time}</center></td></tr>
					<tr class="cell{if $poratext}0{else}1{/if}"><td><center>{$layout_views}</center></td></tr>
				</table>
				<table class="outline margin">
					<tr class="header1"><th>Links</th></tr>
					<tr class="cell0"><td><center><a href="http://btri.x10.bz/" target="_blank"><img src="http://i.imgur.com/TBBvc3F.gif" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://engine.wohlnet.ru/" target="_blank"><img src="http://engine.wohlnet.ru/images/logos/pge_banner_88x31.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://privana-network.net/board/" target="_blank"><img src="http://i.imgur.com/jWZexj3.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://themarioforums.com/" target="_blank"><img src="http://z4.ifrm.com/30066/105/0/f5257310/JAAET.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://s1.zetaboards.com/The_Coffee_House/index" target="_blank"><img src="http://i11.photobucket.com/albums/a166/kingsindian/coffeehouse/chaffiliate.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://thenforumsite.forumotion.com/" target="_blank"><img src="http://z3.ifrm.com/28111/194/0/p492600/tnfs_affiliate_banner.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://clouds-observatory.boards.net/"><img src="http://i.imgur.com/GFe6uf2.png" /></a> </center></td></tr>
					<tr class="cell0"><td><center><a href="http://www.superluigibros.com/"><img src="http://i.imgur.com/hoFZ3Fy.png"/></a> </center></td></tr>
					<tr class="cell0"><td><center><a href="http://www.mariowiki.com/" alt="Super Mario Wiki" title="Super Mario Wiki"><img src="http://i.imgur.com/L2jJ8uv.png" /></a></center></td></tr>
					<tr class="cell0"><td><center><a href="http://mariomansion.net/links/">Click here for more!</a></td></tr>
					<tr class="cell0"><td><center><a href="http://mariomansion.net/thread/672/">Would you like to affiliate with Mario Modding Mansion?</a></td></tr>
				
				</table>
				
			</td>
		</tr>
		</table>
		</td>



{capture "breadcrumbs"}
{if $layout_crumbs || $layout_actionlinks}
		<table class="outline breadcrumbs"><tr class="header1">
			<th>
				{if $layout_actionlinks && count($layout_actionlinks)}
				<div class="actionlinks" style="float:right;">
					<ul class="pipemenu smallFonts">
					{foreach $layout_actionlinks as $alink}
						<li>{$alink}
					{/foreach}
					</ul>
				</div>
				{/if}
				{if $layout_crumbs && count($layout_crumbs)}
				<ul class="crumbLinks">
				{foreach $layout_crumbs as $url=>$text}
					<li><a href="{$url|escape}">{$text}</a>
				{/foreach}
				</ul>
				{/if}
			</th>
		</tr></table>
{else}
<table class="outline breadcrumbs"><tr class="header1"><th>&nbsp;</th></tr></table>
{/if}
{/capture}

<td id="main-page">
	<table id="page-container" class="layout-table">
	<tr><td class="crumb-container">
		{$smarty.capture.breadcrumbs}
	</td></tr>
	<tr><td class="contents-container">
		{$layout_contents}
	</td></tr>
	<tr><td class="crumb-container">
		{$smarty.capture.breadcrumbs}
	</td></tr>
	</table>
</td>
</tr>

<tr>
<td id="main-footer" colspan="2">

	<table id="footer" class="outline">
	<tr>
	<td class="cell2">
		<table class="layout-table" style="line-height: 1.4em;">
			<tr>
			<td style="text-align: left;">
				{$layout_credits}
				<!-- {$perfdata} -->
			</td>
			<td style="text-align: right;">
				{$mobileswitch}
			</td>
		</table>
	</td>
	</tr>
	</table>

</td>
</tr>
</table>