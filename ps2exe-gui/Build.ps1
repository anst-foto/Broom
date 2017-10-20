# Markus Scholtes, DEVK 2017
# Create examples in subdir "Examples"
#****************************************************
# Starinin Andrey (AnSt), 2017
# Адаптация под свои проекты

$SCRIPTPATH = Split-Path $SCRIPT:MyInvocation.MyCommand.Path -parent
ls "$SCRIPTPATH\Build\*.ps1" | %{
	."$SCRIPTPATH\ps2exe.ps1" "$($_.Fullname)" "$($_.Fullname -replace '.ps1','.exe')" -verbose -iconFile "D:\Programming\PowerShell\Broom\Broom.ico"
}

Remove-Item "$SCRIPTPATH\Build\Progress.exe*"
Remove-Item "$SCRIPTPATH\Build\ScreenBuffer-GUI.exe*"

Read-Host "Press enter to exit"