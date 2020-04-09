$folder_path = "\\test-dc1\share"
$save = "C:\users\support\desktop\filepermissions4.txt"
$folders = Get-ChildItem $folder_path\* | Where-Object{$_.psiscontainer -eq $true}
foreach ($folder in $folders){
    $gets_acl = GET-ACL $folder.FullName | ForEach-Object{$_.Access} |fomrat-table $folder.Fullname, IdentityReference, FileSystemRights | Out-File $save -append
}