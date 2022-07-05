
Set-Location ./vagrant;
Get-ChildItem;
Expand-Archive ./Debug.zip -DestinationPath ./;
Set-Location ./Debug;
Get-ChildItem;
$env:WEBRTC_FAKE_MEDIA = 'true';
.\medea_jason_example.exe -wait | ForEach-Object { Write-Output $_; 
    if ($_ -match "All tests passed!") {
        exit 0
    }
    elseif ($_ -match "Some tests failed.") {
        exit 1
    } } 

    