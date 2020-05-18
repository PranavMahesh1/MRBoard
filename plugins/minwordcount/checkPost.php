<?php

if(str_word_count($_POST["text"]) < Settings::pluginGet("minwords"))
{
	Alert(__("Please increase your post quality by elaborating on your post."), __("Your post is too short."));
	$rejected = true;
}
