# Markus Scholtes, DEVK 2017
# Create examples in subdir "Examples"
#****************************************************
# Starinin Andrey (AnSt), 2017
# Адаптация под свои проекты

$SCRIPTPATH = Split-Path $SCRIPT:MyInvocation.MyCommand.Path -Parent
ls "$SCRIPTPATH\Build\*.ps1" | %{
	."$SCRIPTPATH\ps2exe.ps1" "$($_.Fullname)" "$($_.Fullname -replace '.ps1','.exe')" -Verbose -IconFile "$SCRIPTPATH\Build\Broom.ico"
}

Remove-Item -Path "$SCRIPTPATH\Build\Progress.exe*" -Force -ErrorAction SilentlyContinue -Verbose
Remove-Item -Path "$SCRIPTPATH\Build\ScreenBuffer-GUI.exe*" -Force -ErrorAction SilentlyContinue -Verbose

Read-Host "Press enter to exit"