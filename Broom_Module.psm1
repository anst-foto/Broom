
#*******************************************************
#
#						Broom_Module
#				Очистка кэша и Корзины, удаление временных файлов
#				(c) Starinin Andrey (AnSt). 2017
#				(c) Автономное учреждение Воронежской области 'Многофункциональный центр предоставления государственных и муниципальных услуг', 2017
#				MIT License
#				Версия: 0.1 (Октябрь 2017)
#
#				GitHub - https://github.com/anst-foto/Broom
#				Gallery TechNet - https://gallery.technet.microsoft.com/PowerShell-f24f32cb
#				PowerShellGallery - https://www.powershellgallery.com/packages/Broom
#
#						***
#				Основано на коде - https://github.com/lemtek/Powershell
#				By Lee Bhogal, Paradise Computing Ltd - June 2014
#
#*******************************************************
#
#			MIT License
#
#	Copyright (c) 2017 Starinin Andrey, Автономное учреждение Воронежской области 'Многофункциональный центр предоставления государственных и муниципальных услуг'
#
#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the `'Software`'), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:
#
#	The above copyright notice and this permission notice shall be included in all
#	copies or substantial portions of the Software.
#
#	THE SOFTWARE IS PROVIDED `'AS IS`', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#	SOFTWARE.
#
#*******************************************************

$PathLog = "C:\users\$env:USERNAME\broom.log"
$DateLog = Get-Date -Format "dd MMMM yyyy HH:mm:ss"
$Head1Log = "------------------------------"
$Head2Log = "---------------"
$Head3Log = "-------"
$Title1 = "Очищение только кэша браузеров"
$Title2 = "Очищение только Корзины и удаление временных файлов (RecycleBin & Temp)"
$Title3 = "Очищение кэша браузеров и Корзины с удалением временных файлов (RecycleBin & Temp)"
$TitleMozilla = "Mozilla"
$TitleChrome = "Chrome"
$TitleChromium = "Chromium"
$TitleYandex = "Yandex"
$TitleOpera = "Opera"
$TitleIE = "Internet Explorer"
$TitleRecileBinTemp = "RecileBin & Temp"

New-Item -Path $PathLog -ItemType File -ErrorAction SilentlyContinue -Verbose
Out-File -FilePath $PathLog -InputObject $Head1Log -Append -Encoding Unicode
Out-File -FilePath $PathLog -InputObject $DateLog -Append -Encoding Unicode
Out-File -FilePath $PathLog -InputObject $Head1Log -Append -Encoding Unicode

#*******************************************************

# Mozilla Firefox
Function Clear_Mozilla ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleMozilla -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
    Import-CSV -Path $a -Header Name | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Google Chrome
Function Clear_Chrome ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleChrome -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
    Import-CSV -Path $a -Header Name | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Chromium
Function Clear_Chromium ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleChromium -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode

    Import-CSV -Path $a -Header Name | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Yandex
Function Clear_Yandex ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleYandex -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode

	Import-CSV -Path $a -Header Name | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Opera
Function Clear_Opera ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleOpera -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
	Import-CSV -Path $a -Header Name | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Opera Software\Opera Stable\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Internet Explorer
Function Clear_IE ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleIE -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
    Import-CSV -Path $a | ForEach-Object {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WebCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
            }
}

# Clear RecileBin & Temp
Function Clear_RecileBin_Temp ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleRecileBinTemp -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
	#Очистка Корзины на всех дисках
	$Drives = Get-PSDrive -PSProvider FileSystem
	ForEach ($Drive in $Drives)
	{
		$Path_RecicleBin = "$Drive" + ':\$Recycle.Bin'
		Remove-Item -Path $Path_RecicleBin -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
	}
	
	#Удаление temp-файлов
	Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
	Import-Csv -Path $a | ForEach-Object {
		Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
		Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\AppCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode
	}
}

# ClearBrowser
Function ClearBrowser {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Title1 -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode

	Write-Host -ForegroundColor DarkGreen "Выполняется скрипт по очистке кэша браузеров"
	Write-Host -ForegroundColor DarkGreen "____________________________________________"
	""
	
	$Path = "C:\users\$env:USERNAME\users.csv"

	Get-ChildItem C:\Users | Select-Object Name | Export-Csv -Path $Path -NoTypeInformation
	$List = Test-Path $Path
	""
	#*******************************************************
	""
	If ($List) {
    	# Mozilla Firefox
    	Write-Host -ForegroundColor Green "Очистка кэша Mozilla Firefox"
    	Write-Host -ForegroundColor Green "----------------------------"
    	""    	
    	Clear_Mozilla ($Path)        

    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "--------------------------"
    	""    	
    	Clear_Chrome ($Path)
    	
    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "---------------------"
    	""    	
    	Clear_Chromium ($Path)
    	
		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "---------------------------"
    	""    	
    	Clear_Yandex ($Path)
    	
		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "------------------"
    	""    	
    	Clear_Opera ($Path)
    	
    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "------------------------------"
    	""
    	Clear_IE ($Path)
    	
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей
		
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# ClearRecileBinTemp
Function ClearRecycleBinTemp {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Title2 -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode

	Write-Host -ForegroundColor DarkGreen "Выполняется скрипт по очистке Корзины и удалению временных файлов..."
	Write-Host -ForegroundColor DarkGreen "____________________________________________________________________"
	""

	$Path = "C:\users\$env:USERNAME\users.csv"
	Get-ChildItem C:\Users | Select-Object Name | Export-Csv -Path $Path -NoTypeInformation
	$List = Test-Path $Path
	""
	#*******************************************************
	""
	
	If ($List) {
		# RecileBin & Temp
    	Write-Host -ForegroundColor Green "Очистка Корзины и удаление временных файлов"
    	Write-Host -ForegroundColor Green "-------------------------------------------"
    	""
    	Clear_RecileBin_Temp ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей    	
    } Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# ClearFull
Function ClearFull {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Title3 -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
	
	Write-Host -ForegroundColor DarkGreen "Выполняется скрипт по очистке кэша браузеров и Корзины, удалению временных файлов..."
	Write-Host -ForegroundColor DarkGreen "____________________________________________________________________________________"
	""
	$Path = "C:\users\$env:USERNAME\users.csv"
	Get-ChildItem C:\Users | Select-Object Name | Export-Csv -Path $Path -NoTypeInformation
	$List = Test-Path $Path
	""
	If ($List) {
    	""
    	# Mozilla Firefox
    	Write-Host -ForegroundColor Green "Очистка кэша Mozilla Firefox"
    	Write-Host -ForegroundColor Green "----------------------------"
    	""
    	Clear_Mozilla ($Path)
    	
    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "--------------------------"
    	""
    	Clear_Chrome ($Path)
    	
    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "---------------------"
    	""
    	Clear_Chromium ($Path)
    	
		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "---------------------------"
    	""
    	Clear_Yandex ($Path)
    	
		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "------------------"
    	""
    	Clear_Opera ($Path)
    	
    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "------------------------------"
    	""
    	Clear_IE ($Path)
    	
		# RecileBin & Temp
        Write-Host -ForegroundColor Green "Очистка Корзины и удаление временных файлов"
    	Write-Host -ForegroundColor Green "-------------------------------------------"
    	""
    	Clear_RecileBin_Temp ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей    	
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}


Export-ModuleMember -Function Clear_Mozilla,
					Clear_Chrome,
					Clear_Chromium,
					Clear_Yandex,
					Clear_Opera,
					Clear_IE,
					Clear_RecileBin_Temp,
					ClearBrowser,
					ClearRecycleBinTemp,
					ClearFull