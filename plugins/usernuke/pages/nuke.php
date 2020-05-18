<?php
if ($loguserid != 1) { require('pages/404.php'); return; }

$key = hash('sha256', "{$loguserid},{$loguser['pss']},".SALT.",sdi65fdsg4fd65g4fdg65g");
CheckPermission('admin.usernuke');

$uid = (int)$_GET["id"];

$user = fetch(query("select * from {users} where id={0}", $uid));

if(!$user)
	kill("User not found");

if($uid == 1)
	kill("User not found");

if($user["primarygroup"] > 0)
	kill("User not found");

$passwordFailed = false;

if(isset($_POST["currpassword"]))
{
	$sha = doHash($_POST['currpassword'].SALT.$loguser['pss']);
	if($loguser['password'] == $sha)
	{
		
		//Delete posts from threads by user
		query("delete pt from {posts_text} pt
				left join {posts} p on pt.pid = p.id
				left join {threads} t on p.thread = t.id
				where t.user={0}", $uid);
		query("delete p from {posts} p
				left join {threads} t on p.thread = t.id
				where t.user={0}", $uid); 

		//Delete posts by user			
		query("delete pt from {posts_text} pt
				left join {posts} p on pt.pid = p.id
				where p.user={0}", $uid);
		query("delete p from {posts} p
				where p.user={0}", $uid);
		query("delete from {posts}
				where user={0}", $uid);
		
		//Delete threads by user
		query("delete from {threads}
				where user={0}", $uid);
				
		//Delete secondary groups by user
		query("delete from {secondarygroups}
				where userid={0}", $uid);
		//Delete usercomments by user or to user
		query("delete from {usercomments}
				where uid={0}", $uid);
		query("delete from {usercomments}
				where cid={0}", $uid);
				
		//Delete privmsgs
		query("delete from {pmsgs}
				where userto={0} or userfrom={0}", $uid);
		query("delete from {pmsgs}
				where userto=-1");
				
		//Delete notifications
		query("delete from {notifications}");

		//Delete THE USER ITSELF
		query("delete from {users}
				where id={0}", $uid);
		
		//Delete ignored forums
		query("delete from {ignoredforums}
				where uid={0}", $uid);
		
		//Delete mood avatars
		query("delete from {moodavatars}
				where uid={0}", $uid);
				
		//Delete poll votes
		query("delete from {pollvotes}
				where user={0}", $uid);
				
		//Delete read threads
		query("delete from {threadsread}
				where id={0}", $uid);
				
	/*	//Delete uploaded files
		query("delete from {uploadedfiles}
				where user={0}", $uid);
				
		//Delete wiki stuff
		query("delete from {wiki_pages_text}}
				where user={0}", $uid); */
				
		//Delete badges
		query("delete from {badges}
				where owner={0}", $uid);
				
		//Delete blocked layouts
		query("delete from {blockedlayouts}
				where blockee={0}", $uid); 
				
		//Delete blocked layouts
		query("delete from {blockedlayouts}
				where user={0}", $uid); 
				
		//Delete permissions
		query("delete from {permissions}
				where id={0}", $uid); 

		//and then IP BAN THE USER
		query("insert into {ipbans} (ip, reason, date) 
				values ({0}, {1}, 0)
				on duplicate key update ip=ip", $user["lastip"], "Nuked ".$user["name"]);
				
		echo "User nuked!<br/>";
		echo "You will need to ", actionLinkTag("Recalculate statistics now", "recalc");

		throw new KillException();
	}
	else
		$passwordFailed = true;
}

if($passwordFailed)
	Alert("Invalid password. Please try again.");
echo "
<form name=\"confirmform\" action=\"".actionLink("nuke", $uid)."\" method=\"post\">
	<table class=\"outline margin width50\">
		<tr class=\"header0\">
			<th colspan=\"2\">
				".__("NUKE!!")."
			</th>
		</tr>
		<tr>
			<td class=\"cell2\">
			</td>
			<td class=\"cell0\">
				".__("WARNING: This will IP-ban the user, and permanently and irreversibly delete the user itself and all his posts, threads, and profile comments, PM's, etc. This user will be gone forever, as if he/she never existed.")."
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
				<input type=\"submit\" name=\"actionlogin\" value=\"".__("NUKE!!")."\" />
			</td>
		</tr>
	</table>
</form>";

