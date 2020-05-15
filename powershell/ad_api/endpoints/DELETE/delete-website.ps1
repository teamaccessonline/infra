
<#
	.DESCRIPTION
		This script deletes an IIS Website
	.EXAMPLES
				.\delete-website.ps1 -Body '{"site_name":"testsite.acme.com"  }'

	.NOTES
       
#>

param(
    $body
    
)

# This Section Parses the body Parameter
# You will need to customize this section to consume the Json correctly for your application
$newbody = $body | ConvertFrom-Json

$site_name = $newbody.site_name
#Write-Host "Sitename: $site_name"



  
 

Remove-WebSite -Name $site_name 
Remove-WebAppPool -Name $site_name 

 #Sets the error message based on success or failure 
 
 if ($?) {
 	$status = "Success"
    $jsonresponse = New-Object -TypeName psobject
	$jsonresponse| Add-Member -MemberType NoteProperty -Name status -Value $status
	$jsonresponse| Add-Member -MemberType NoteProperty -Name site_name -Value $site_name

 
 	$Message = $jsonresponse | Select-Object status, site_name
 
    
 } else {


	$status = "Fail"
	$jsonresponse| Add-Member -MemberType NoteProperty -Name status -Value $status
	$jsonresponse| Add-Member -MemberType NoteProperty -Name site_name -Value $site_name
    
 
 	$Message = $jsonresponse | Select-Object status, site_name
 }
 
 return $message



