<?php
if ($loguserid != 1) { require('pages/404.php'); return; }

$key = hash('sha256', "{$loguserid},{$loguser['pss']},".SALT.",sdi65fdsg4fd65g4fdg65g");

CheckPermission('admin.pmnuke');

$uid = (int)$_GET["id"];

$user = fetch(query("select * from {users} where id={0}", $uid));

if(!$user)
	kill("User not found");

if($uid == 1)
	kill("No.");

if($user["primarygroup"] > 0)
	kill("Don't delete all the PM's of a staff member.");

$passwordFailed = false;

if(isset($_POST["currpassword"]))
{
	$sha = doHash($_POST['currpassword'].SALT.$loguser['pss']);
	if($loguser['password'] == $sha)
	{
				
		//Delete privmsgs
		query("delete from {pmsgs}
				where userto={0}", $uid);
		query("delete from {pmsgs}
				where userfrom={0}", $uid);
		query("delete from {pmsgs}
				where userto=-1");
				
		//Delete notifications
		query("delete from {notifications}");
				
		echo "Private Messages for this user are nuked!<br/>";

		throw new KillException();
	}
	else
		$passwordFailed = true;
}

if($passwordFailed)
	Alert("Invalid password. Please try again.");
echo "
<form name=\"confirmform\" action=\"".actionLink("pmnuke", $uid)."\" method=\"post\">
	<table class=\"outline margin width50\">
		<tr class=\"header0\">
			<th colspan=\"2\">
				".__("PM NUKE!!")."
			</th>
		</tr>
		<tr>
			<td class=\"cell2\">
			</td>
			<td class=\"cell0\">
				".__("WARNING: This will delete all the private messages of a user.")."
				<br/><br/>
				".__("Please enter your password to confirm.")."
			</td>
		</tr>
		<tr>
			<td class=\"cell2\">
				<label for=\"currpassword\">".__("Password")."</label>
			</td>
			<td class=\"cell1\">
				<input type=\"password\" id=\"currpassword\" name=\"currpassword\" size=\"13\" maxlength=\"32\" />
			</td>
		</tr>
		<tr class=\"cell2\">
			<td></td>
			<td>
				<input type=\"submit\" name=\"actionlogin\" value=\"".__("PM NUKE!!")."\" />
			</td>
		</tr>
	</table>
</form>";

