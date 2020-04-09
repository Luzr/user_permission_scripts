$ad_groups = "hr","engineering","quality","it"
$result = @()

 foreach ($ad_group in $ad_groups) {
    $users = get-ADGroupMember -Identity $ad_group
    foreach($user in $users){
    $user_list = [PSCustomObject]@{
        Group = $ad_group
        Users = $user.name
    }
        $result += $user_list
    } 
}
$result | Sort-Object -Property Group | export-csv c:\ad-user-group.csv  -NoTypeInformation