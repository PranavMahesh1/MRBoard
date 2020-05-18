<?php
//  AcmlmBoard XD - 404
//  Access: all
if (!defined('BLARG')) die();
MakeCrumbs(array(actionLink("404") => __('404 - Not Found')));
// Some servers use one response, some use another. For safety, use both.
header('HTTP/1.1 404 Not Found');
header('Status: 404 Not Found');

$title = __("404 - Not found");

//echo $_SERVER['REQUEST_URI'].' -- '.$_SERVER['SCRIPT_NAME'].'?'.$_SERVER['QUERY_STRING'];

Kill(__('The page you are looking for was not found.').'<br /><br />
	<a href="/board/">'.__('Return to the board index').'</a>', __("404 - Not found"));
?>
