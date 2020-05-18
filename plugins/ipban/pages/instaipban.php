<?php
MakeCrumbs(array(actionLink("admin") => __("Admin"), actionLink("instaipban") => __("Insta-IP-Ban")));
CheckPermission('admin.manageipbans');

$uid = (int)$_GET["id"];

$user = fetch(query("select * from {users} where id={0}", $uid));

if(!$user)
	kill("User not found");

if($uid == 1)
	kill("No.");

if($user["primarygroup"] > 0)
	kill("You can't insta-IP-ban a staff member. Demote him/her first.");

$passwordFailed = false;

if(isset($_POST["currpassword"]))
{
	$sha = doHash($_POST['currpassword'].SALT.$loguser['pss']);
	if($loguser['password'] == $sha)
	{
		//and then IP BAN THE USER
		query("insert into {ipbans} (ip, reason, date) 
				values ({0}, {1}, 0)
				on duplicate key update ip=ip", $user["lastip"], $user["name"]);
				
		echo "User insta-IP-banned!<br/>";
		Report($loguser['name'].' insta-IP-banned '.$user["name"].'.');
		throw new KillException();

	}
	else
		$passwordFailed = true;
}
if($passwordFailed)
	Alert("Invalid password. Please try again.");
echo "
<form name=\"confirmform\" action=\"".actionLink("instaipban", $uid)."\" method=\"post\">
	<table class=\"outline margin width50\">
		<tr class=\"header0\">
			<th colspan=\"2\">
				".__("Insta-IP-Ban!")."
			</th>
		</tr>
		<tr>
			<td class=\"cell2\">
			</td>
			<td class=\"cell0\">
				".__("WARNING: This will IP-ban the user.")."
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
				<input type=\"submit\" name=\"actionlogin\" value=\"".__("Insta-IP-Ban")."\" />
			</td>
		</tr>
	</table>
</form>";

