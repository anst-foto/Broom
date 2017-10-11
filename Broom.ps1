<#PSScriptInfo

.VERSION 0.20

.GUID 1b158786-70ac-433f-b3f3-87b9e1baac75

.AUTHOR An.St.

.COPYRIGHT © Starinin Andrey (AnSt), 2017

.LICENSEURI https://github.com/anst-foto/Broom/blob/master/LICENSE

.PROJECTURI https://github.com/anst-foto/Broom

.RELEASENOTES
v0.20:	Отказ от alias cmdlet
v0.19:	Изменение выводимой информации
v0.18:	Добавлено логирование сообщений в файл
v0.17:  Компиляция в EXE-файл PS2EXE-GUI v0.5.0.6 by Ingo Karstein, reworked and GUI support by Markus Scholtes
v0.16:  Добавление PSScriptInfo
v0.15:	Переработана выводимая информация для пользователя
v0.14:	Переработка алгоритма удаления Корзины
v0.13:	Переименование проекта, изменение иконки
v0.12:	Добавление информации о лицензии (MIT License)
v0.11:	Очистка Корзины на старых системах
v0.10:	Добавление меню режимов очистки
v0.9:	Добавление удаления файла со списком пользователей
v0.8:	Переделана функция по очистке Корзины
v0.7:	Добавлена очистка Яндекс.Браузер, Opera
v0.6:	Предупреждение о закрытие браузеров
v0.5:	Использование функций
v0.4:	Очистка Корзины на старых системах
v0.3:	Ожидание нажатия пользователя
v0.2:	Очистка временных файлов пользователя
v0.1:	Создание скрипта
#>

<#
.DESCRIPTION 
 Очистка кэша и Корзины, удаление временных файлов 
#> 

Clear-Host

Write-Host -ForegroundColor Yellow "*******************************************************"
""
Write-Host -ForegroundColor Yellow "Broom (Метла)"
Write-Host -ForegroundColor Yellow "Очистка кэша и Корзины, удаление временных файлов"
Write-Host -ForegroundColor Yellow "(c) Starinin Andrey (AnSt). 2017"
Write-Host -ForegroundColor Yellow "MIT License"
Write-Host -ForegroundColor Yellow "Версия: 0.20 (Октябрь 2017)"
""
Write-Host -ForegroundColor Gray "GitHub - https://github.com/anst-foto/Broom"
Write-Host -ForegroundColor Gray "Gallery TechNet - https://gallery.technet.microsoft.com/PowerShell-f24f32cb"
Write-Host -ForegroundColor Gray "PowerShellGallery - https://www.powershellgallery.com/packages/Broom"
""
Write-Host -ForegroundColor Gray "***"
Write-Host -ForegroundColor Gray "Основано на коде - https://github.com/lemtek/Powershell"
Write-Host -ForegroundColor Gray "By Lee Bhogal, Paradise Computing Ltd - June 2014"
Write-Host -ForegroundColor Gray "***"
""
Write-Host -ForegroundColor Yellow "*******************************************************"
""

Write-Host -ForegroundColor Gray "*******************************************************"
""
Write-Host -ForegroundColor Gray "MIT License

Copyright (c) 2017 Starinin Andrey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the `'Software`'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED `'AS IS`', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."
""
Write-Host -ForegroundColor Gray "*******************************************************"
""

Write-Host -ForegroundColor Green "Изменения:
v0.20:	Отказ от alias cmdlet
v0.19:	Изменение выводимой информации
v0.18:	Добавлено логирование сообщений в файл
v0.17:  Компиляция в EXE-файл PS2EXE-GUI v0.5.0.6 by Ingo Karstein, reworked and GUI support by Markus Scholtes
v0.16:  Добавление PSScriptInfo
v0.15:	Переработана выводимая информация для пользователя
v0.14:	Переработка алгоритма удаления Корзины
v0.13:	Переименование проекта, изменение иконки
v0.12:	Добавление информации о лицензии (MIT License)
v0.11:	Очистка Корзины на старых системах
v0.10:	Добавление меню режимов очистки
v0.9:	Добавление удаления файла со списком пользователей
v0.8:	Переделана функция по очистке Корзины
v0.7:	Добавлена очистка Яндекс.Браузер, Opera
v0.6:	Предупреждение о закрытие браузеров
v0.5:	Использование функций
v0.4:	Очистка Корзины на старых системах
v0.3:	Ожидание нажатия пользователя
v0.2:	Очистка временных файлов пользователя
v0.1:	Создание скрипта"
""
Write-Host -ForegroundColor Yellow "*******************************************************"
""
#*******************************************************

$PathLog = "C:\users\$env:USERNAME\broom.log"
$DateLog = Get-Date -Format "dd MMMM yyyy HH:mm:ss"
$Head1Log = "------------------------------"
$Head2Log = "---------------"
$Head3Log = "-------"
$Title1 = "Очищение только кэша браузеров"
$Title2 = "Очищение только Корзины и удаление временных файлов (RecycleBin & Temp)"
$Title3 = "Очищение кэша браузеров и Корзины с удалением временных файлов (RecycleBin & Temp)"
$Title4 = "Отказ от очистки"
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

#########################
# Функции #
#########################

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
###

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
###

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
###

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
###

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
###

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
###

# Clear RecileBin & Temp
Function Clear_RecileBin_Temp ($a) {
	#Добавление информации в log-файл
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $TitleRecileBinTemp -Append -Encoding Unicode
	Out-File -FilePath $PathLog -InputObject $Head3Log -Append -Encoding Unicode
	
	#Очистка Корзины на всех дисках
	$Drives = Get-PSDrive -PSProvider FileSystem
	ForEach-Object ($Drive in $Drives)
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

#########################

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
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Mozilla ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "--------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Chrome ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "---------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Chromium ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
	
		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "---------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Yandex ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
	
		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Opera ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_IE ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
		
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей
		
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

###

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
    	Write-Host -ForegroundColor Magenta "Очистка RecycleBin & Temp..."
        ""
    	Clear_RecileBin_Temp ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей
    	Write-Host -ForegroundColor Magenta "Очистка завершена!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
    } Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

###

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
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Mozilla ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Google Chrome 
    	Write-Host -ForegroundColor Green "Очистка кэша Google Chrome"
    	Write-Host -ForegroundColor Green "--------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Chrome ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Chromium
    	Write-Host -ForegroundColor Green "Очистка кэша Chromium"
    	Write-Host -ForegroundColor Green "---------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Chromium ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
	
		# Yandex
    	Write-Host -ForegroundColor Green "Очистка кэша Яндекс.Браузер"
    	Write-Host -ForegroundColor Green "---------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Yandex ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
	
		# Opera
    	Write-Host -ForegroundColor Green "Очистка кэша Opera"
    	Write-Host -ForegroundColor Green "------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_Opera ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""

    	# Internet Explorer
    	Write-Host -ForegroundColor Green "Очистка кэша Internet Explorer"
    	Write-Host -ForegroundColor Green "------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Кэш очищается..."
        ""
    	Clear_IE ($Path)
    	Write-Host -ForegroundColor Magenta "Кэш очищен!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""
		
		# RecileBin & Temp
        Write-Host -ForegroundColor Green "Очистка Корзины и удаление временных файлов"
    	Write-Host -ForegroundColor Green "-------------------------------------------"
    	""
    	Write-Host -ForegroundColor Magenta "Очистка RecycleBin & Temp..."
        ""
    	Clear_RecileBin_Temp ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose 4>&1 | Out-File $PathLog -Append -Encoding Unicode # удаление файла со списком пользователей
    	Write-Host -ForegroundColor Magenta "Очистка завершена!"
    	""
        Write-Host -ForegroundColor Magenta "#####"
        ""	
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

#*******************************************************

#########################

Write-Host -ForegroundColor Red "Закройте все браузеры!"
""
Write-Host -ForegroundColor Gray "*******************************************************"
""
Write-Host -ForegroundColor Yellow "Выберите режим очистки:"
Write-Host -ForegroundColor Yellow "1. Очистить только кэши браузеров"
Write-Host -ForegroundColor Yellow "2. Очитстить только Корзину и временные файлы (RecycleBin & Temp)"
Write-Host -ForegroundColor Yellow "3. Очитстить кэши браузеров и Корзину с временными файлами (RecycleBin & Temp)"
Write-Host -ForegroundColor Yellow "4. Выход"
""
Write-Host -ForegroundColor Gray "*******************************************************"
""
$Choice = Read-Host "Для продолжения введите номер режима очистки"

#########################

Switch ($Choice)
{
	1{ ClearBrowser }
	2{ ClearRecycleBinTemp }
	3{ ClearFull }
	4{
		#Добавление информации в log-файл
		Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
		Out-File -FilePath $PathLog -InputObject $Title4 -Append -Encoding Unicode
		Out-File -FilePath $PathLog -InputObject $Head2Log -Append -Encoding Unicode
		
		Write-Host -ForegroundColor Red "Выход..."
		Exit
	}
	Default { Write-Host -ForegroundColor Red "Не правильно выбран режим" }
}

#########################

#*******************************************************
""
Write-Host -ForegroundColor Red "*******************************************************"
""
Write-Host -ForegroundColor Red "Все задачи выполнены!"
""
Write-Host -ForegroundColor Red "*******************************************************"
""

Read-Host "Для выхода нажмите Enter"

#*******************************************************