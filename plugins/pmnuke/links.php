<?php
//$links[] = actionLinkTag('Ban user', 'banhammer', $id);	
if (HasPermission('admin.pmnuke') && $loguserid != $id)
{
		$links[] = actionLinkTag(__('NUKE', 'nuke', $id);
}

