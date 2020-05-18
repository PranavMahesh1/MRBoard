{$numnotifs=count($notifications)}
<div id="realbody">
	
	<div id="mobile-sidebar-container" style="display:none;">
	<div id="mobile-sidebar-deactivate"></div>
	<div id="mobile-sidebar">
		<table class="outline opaque">
			<tr class="header1"><th>{$boardname}</th></tr>
			
			<tr><td class="cell{cycle values='1,2'} center">{$layout_time}</td></tr>
			
			{if $poratext}<tr><td class="cell{cycle values='1,2'} center">{$layout_views}</td></tr>{/if}
			
			{if $loguserid && $numnotifs}
				<tr class="header1"><th>Notifications</th></tr>
				{foreach $notifications as $notif}
				<tr><td class="cell{cycle values='1,2'} mobileNotif">
					<div>{$notif.text}<br><small>{$notif.formattedDate}</small></div>
				</td></tr>
				{/foreach}
			{/if}

			{if $layout_actionlinks}
				{foreach $layout_actionlinks as $link}
					<tr><td class="cell{cycle values='1,2'} link">{$link}</td></tr>
				{/foreach}
				
			{/if}
			
			<tr class="header1"><th style="height:5px;">User panel</th></tr>
			{if $loguserid}
			<tr><td class="cell{cycle values='1,2'} link">{$loguserlink}</td></tr>
			{if HasPermission('user.editprofile')}<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='editprofile'}">Edit profile</a></td></tr>{/if}
			{if HasPermission('user.editavatars')}<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='editavatars'}">Mood avatars</a></td></tr>{/if}
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='private'}">Private Messages</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='favorites'}">Favorites</a></td></tr>
			{if HasPermission('admin.viewadminpanel')}<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='admin'}">Admin Dashboard</a></td></tr>{/if}
			{/if}
			{if !$loguserid}
				<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='register'}">Register</a></td></tr>
				<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='login'}">Log in</a></td></tr>
			{/if}
			{if $loguserid}
			<tr><td class="cell{cycle values='1,2'} link"><a href="#" onclick="$('#logout').submit(); return false;">Log out</a></td></tr>
			{/if}
			<tr class="header1"><th style="height:5px;">Navigation</th></tr>
			{* these are the forum links *}
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='home'}">Home</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='board'}">Forums</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='faq'}">Rules</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='memberlist'}">Member List</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='irc'}">IRC Chat</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='ranks'}">Ranks</a></td></tr>
			{if $loguserid} <tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='online'}">Online Users</a></td></tr>{/if}
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='search'}">Search</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='lastposts'}">Latest posts</a></td></tr>
			
			<tr class="header1"><th style="height:5px;">Important Links</th></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='downloads'}">Downloads</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='announcements'}">Announcements</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='news'}">News</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='calendar'}">Calendar</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='wiki'}">Wiki</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='records'}">Board Records</a></td></tr>
			<tr><td class="cell{cycle values='1,2'} link"><a href="{actionLink page='links'}">Links</a></td></tr>
			
		</table>
	</div>
	</div>

	<div id="main" style="padding:0px;">
	
	<table class="outline" id="mobile-crumbs">
	<tr class="header0"><th>
		<span style="float:right;">
			<button onclick="openSidebar();"{if !$numnotifs}>...{else} class="notifs">{$numnotifs}{/if}</button>
		</span>
		
		{if count($layout_crumbs)>1}
		{$crumburls=array_keys($layout_crumbs)}
		{$prevcrumb=$crumburls[count($crumburls)-2]}
		{$thiscrumb=$crumburls[count($crumburls)-1]}
		<button onclick="window.location='{$prevcrumb|escape}';">&lt;</button> {$layout_crumbs[$thiscrumb]}
		{/if}
		
	</th></tr>
	</table>

	{$layout_contents}

	</div>
	<div class="footer" style="clear:both; margin-bottom:1.2em;">
		{$mobileswitch}
	</div>
</div>
