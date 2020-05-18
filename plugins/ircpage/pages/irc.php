<?php
$title = __("IRC");
MakeCrumbs(array(actionLink("irc") => __('IRC')));
global $loguser;
$rUser = query("select * from {users} where id={0}", $uid);
$user = Fetch($rUser);	
$uname = $loguser['displayname'] ?: $loguser['name'];

if(!$loguserid) //Not logged in?
	Kill(__("You must be logged in to join the IRC."));
CheckPermission('user.irc');
// Below is for the dark theme.
if ($_GET['style'] == 'dark')
{
	echo "<div align=\"center\">";
	echo "<iframe src=\"http://webchat.techtronix.net/?nick=$uname&theme=cli#MarioMansion\"  width=\"800\" height=\"525\"></iframe>";
}
// Below is for the light theme.
if ($_GET['style'] == 'light')
{
echo "<div align=\"center\">";
echo "<iframe src=\"http://webchat.techtronix.net/?nick=$uname#MarioMansion\"  width=\"800\" height=\"525\"></iframe>";
}

// Below is for irc.php
	echo "<div align=\"center\">";
	echo "<br>";
	echo "<u><font size=5>#MarioMansion IRC</font></u>";
	echo "<br>";
	echo "<br>";
	echo "#MarioMansion on irc.techtronix.net";
	echo "<br>";
	echo "<br>";
	echo "This is our official channel. Please read the ";
	echo "<a href=https://tr.im/PKi9P>IRC Rules</a>.";
	echo "<br>";
	echo "There are two IRC layouts to choose from: the light layout or dark layout."; 
	echo "<br>";
	echo "This online IRC page is built by KiwiIRC.";
	echo "<br>";
	echo "<br>";
	echo "<a href=/irc/?style=light>Light Layout</a>";
	echo "<br>";
	echo "<a href=/irc/?style=dark>Dark Layout</a>";
?>
