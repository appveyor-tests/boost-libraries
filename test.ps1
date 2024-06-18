param (
    [string]$image
)
Write-Host "Image parameter: $image"
$BoostVersions = @()
$Binary32 = "lib32-msvc-14.2"
$Binary64 = "lib64-msvc-14.2"

if (($image -eq "vs2019-master") -or ($image -eq "vs2019-master-gce-us-central1")) {
    $BoostVersions += @("boost_1_83_0", "boost_1_84_0", "boost_1_85_0")

}
elseif (($image -eq "vs2022-master") -or ($image -eq "vs2022-master-gce-us-central1")){
    $BoostVersions += @("boost_1_78_0","boost_1_83_0", "boost_1_84_0", "boost_1_85_0")
    $Binary32 = "lib32-msvc-14.3"
    $Binary64 = "lib64-msvc-14.3"
}
else {
    $BoostVersions += @("boost_1_83_0")
}

foreach ($ver in $BoostVersions) {
    Write-host "C:\Libraries\$ver\$Binary32"
    Write-host "C:\Libraries\$ver\$Binary32"
    if ((Test-Path -Path "C:\Libraries\$ver\$Binary32") -and (Test-Path -Path "C:\Libraries\$ver\$Binary64")) {
        Write-Host "Boost version installed"  -ForegroundColor Green
    } else {
        throw "Boost version missing"
    }

}
