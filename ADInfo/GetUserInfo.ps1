Import-Module ActiveDirectory
Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName Microsoft.VisualBasic
$ButtonType = [System.Windows.Forms.MessageBoxButtons]::OK
$MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Information
$MessageTitle = 'Retrieve UserName'
$title = 'Retrieve UserName'
$msg   = 'Enter email address (firstname.lastname@domain.com) Press Ctrl-C to exit:'
$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
$User = $text
$MessageBody = Get-AdUser -Filter "mail -eq '$User'" | Select-Object -ExpandProperty SamAccountName
$Result = [System.Windows.Forms.MessageBox]::Show("$Messagebody",$MessageTitle,$ButtonType,$MessageIcon)