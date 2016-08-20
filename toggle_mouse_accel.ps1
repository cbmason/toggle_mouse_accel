#Toggles mouse acceleration: if it is ON this switches acceleration off and if it's OFF it switches on
#Values are calibrated only for my home PC + mouse, adjust for other PCs as needed

$registryPath = "HKCU:\Control Panel\Mouse"
$accelOnSensVal = 4
$accelOnSpeedVal = 1        #Default: 1
$accelOnThresh1Val = 20     #Default: 6
$accelOnThresh2Val = 0      #Default: 10
$accelOffSensVal = 4
$accelOffSpeedVal = 0       #Default: 0
$accelOffThresh1Val = 0     #Default: 0
$accelOffThresh2Val = 0     #Default: 0

Push-Location

Set-Location $registryPath

$currAccel = Get-ItemProperty "HKCU:\Control Panel\Mouse" -Name  MouseSpeed
if( $currAccel.MouseSpeed -eq 0 ) { $MouseSpeed = $accelOnSpeedVal; $MouseThreshold1 = $accelOnThresh1Val; $MouseThreshold2 = $accelOnThresh2Val } `
    ELSE { $MouseSpeed = $accelOffSpeedVal; $MouseThreshold1 = $accelOffThresh1Val; $MouseThreshold2 = $accelOffThresh2Val }

Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed $MouseSpeed
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseThreshold1 $MouseThreshold1
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseThreshold2 $MouseThreshold2

Pop-Location