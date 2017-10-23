$PathBuild = "$PSScriptRoot\ps2exe-gui\Build"

$PathPS1 = "$PSScriptRoot\Broom.ps1"
$PathBuildPS1 = "$PathBuild\Broom.ps1"

$PathBuildEXE = "$PathBuild\Broom.exe"
$PathEXE = "$PSScriptRoot\Broom.exe"

$PathBuildEXEConfig = "$PathBuild\Broom.exe.config"
$PathEXEConfig = "$PSScriptRoot\Broom.exe.config"

Copy-Item -Path $PathPS1 -Destination $PathBuildPS1 -Force -ErrorAction SilentlyContinue -Verbose

iex "$PSScriptRoot\ps2exe-gui\Build.ps1"

Copy-Item -Path $PathBuildEXE -Destination $PathEXE -Force -ErrorAction SilentlyContinue -Verbose
Remove-Item -Path $PathBuildEXE -Force -ErrorAction SilentlyContinue -Verbose
Copy-Item -Path $PathBuildEXEConfig -Destination $PathEXEConfig -Force -ErrorAction SilentlyContinue -Verbose
Remove-Item -Path $PathBuildEXEConfig -Force -ErrorAction SilentlyContinue -Verbose
Remove-Item -Path $PathBuildPS1 -Force -ErrorAction SilentlyContinue -Verbose