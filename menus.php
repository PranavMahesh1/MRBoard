<?php

$headerlinks = array
(
	actionLink('irc') => 'IRC',
	actionLink('calendar') => 'Calendar',
	actionLink('announcements') => 'Announcements',
	actionLink('news') => 'News',
);

$sidelinks = array
(
	Settings::get('menuMainName') => array
	(
		actionLink('home') => 'Home page',
		actionLink('board') => 'Forums',
		actionLink('faq') => 'FAQ',
		actionLink('memberlist') => 'Member list',
		actionLink('ranks') => 'Ranks',
		actionLink('online') => 'Online users',
		actionLink('lastposts') => 'Last posts',
		actionLink('search') => 'Search',
		actionLink('irc') => 'IRC Page',
	),
);

?>
