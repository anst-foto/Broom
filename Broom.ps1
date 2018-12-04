<#PSScriptInfo

.VERSION 0.28.1

.GUID 1b158786-70ac-433f-b3f3-87b9e1baac75

.AUTHOR An.St.

.COPYRIGHT © Starinin Andrey (AnSt), 2017

.LICENSE MIT License

.LICENSEURI https://github.com/anst-foto/Broom/blob/master/LICENSE

.PROJECTURI https://github.com/anst-foto/Broom

.RELEASENOTES

v0.28.1:	Удаление внешнего модуля (Broom_Module.psm1), корректировка меню
v0.27.1:	Добавление очистки папки "Загрузки"
v0.26.1:	Изменения в очистке кэша браузеров
v0.25.1:	Отказ от логгирования
v0.25:	Добавление обработки ошибок (Try/Catch/Finally)
v0.24:	Добавление выбора способа вывода информации: на экран или в файл
v0.23:	Отказ от модульной структуры (из-за проблем с запуском EXE-файла)
v0.22:	Изменение выводимой информации
v0.21:	Перенос функций во внешний модуль (Broom_Module.psm1)
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
Write-Host -ForegroundColor Yellow "Версия: 0.27.1 (Ноябрь 2018)"
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
Write-Host -ForegroundColor Gray "***"
Write-Host -ForegroundColor Gray "PS2EXE-GUI - https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5"
Write-Host -ForegroundColor Gray "License: MS-LPL"
Write-Host -ForegroundColor Gray ""
Write-Host -ForegroundColor Gray "PS2EXE-GUI v0.5.0.6 by Ingo Karstein, reworked and GUI support by Markus Scholtes

Overworking of the great script of Igor Karstein with GUI support by Markus Scholtes. 
The GUI output and input is activated with one switch, real windows executables are generated."
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
v0.28.1:	Удаление внешнего модуля (Broom_Module.psm1), корректировка меню
v0.27.1:	Добавление очистки папки Загрузки
v0.26.1:	Изменения в очистке кэша браузеров
v0.25.1:	Отказ от логгирования
v0.25:	Добавление обработки ошибок (Try/Catch/Finally)
v0.24:	Добавление выбора способа вывода информации: на экран или в файл
v0.23:	Отказ от модульной структуры (из-за проблем с запуском EXE-файла)
v0.22:	Изменение выводимой информации
v0.21:	Перенос функций во внешний модуль (Broom_Module.psm1)
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



#*******************************************************

# Mozilla Firefox
Function Clear_Mozilla ($a) {	
    Import-CSV -Path $a -Header Name | ForEach-Object {
        Try {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\OfflineCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
        Catch {
            Write-Host -ForegroundColor Red "ОШИБКА удаления кеша Firefox"
            }
            
        }
}

# Google Chrome
Function Clear_Chrome ($a) {	
    Import-CSV -Path $a -Header Name | ForEach-Object {
		Try {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            #Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления кеша Chrome"
			}
		}
}

# Chromium
Function Clear_Chromium ($a) {
	Import-CSV -Path $a -Header Name | ForEach-Object {
		Try {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            #Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            #Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Cookies" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Chromium\User Data\Default\Cookies-Journal" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления кеша Chromium"
			}
		}
}

# Yandex
Function Clear_Yandex ($a) {	
	Import-CSV -Path $a -Header Name | ForEach-Object {
		Try{
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Media Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Pepper Data\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cookies" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cookies-Journal" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			}
        Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления кеша Yandex"
			}
        }
}

# Opera
Function Clear_Opera ($a) {	
	Import-CSV -Path $a -Header Name | ForEach-Object {
		Try {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Opera Software\Opera Stable\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления кеша Opera"
			}
		}
}

# Internet Explorer
Function Clear_IE ($a) {	
    Import-CSV -Path $a | ForEach-Object {
		Try {
            Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
	        Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WebCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
            }
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления кеша IE"
			}
		}
}

# Clear RecileBin & Temp
Function Clear_RecileBin_Temp ($a) {	
	#Очистка Корзины на всех дисках
	Try {
		$Drives = Get-PSDrive -PSProvider FileSystem
		}
	Catch {
		Write-Host -ForegroundColor Red "ОШИБКА подключения к дискам"
		}
	ForEach ($Drive in $Drives)
	{
		Try {
			$Path_RecicleBin = "$Drive" + ':\$Recycle.Bin'
			Remove-Item -Path $Path_RecicleBin -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			}
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления Recycle.Bin"
			}
	}
	
	#Удаление temp-файлов
	Try {
		Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
		}
	Catch {
		Write-Host -ForegroundColor Red "ОШИБКА удаления Temp1"
		}
	Import-Csv -Path $a | ForEach-Object {
		Try {
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			Remove-Item -Path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\AppCache\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
			}
		Catch {
			Write-Host -ForegroundColor Red "ОШИБКА удаления Temp2"
			}
	}
}

# Downloads
Function Clear_Download ($a) {
	Import-CSV -Path $a | ForEach-Object {
    	Try {
        	Remove-Item -Path "C:\Users\$($_.Name)\Downloads\*" -Recurse -Force -ErrorAction SilentlyContinue -Verbose
    	}
    	Catch {
        	Write-Host -ForegroundColor Red "ОШИБКА удаления файлов из папки Загрузка"
    	}
	}
}

####

# ClearBrowser
Function ClearBrowser {	
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
    	
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей
		
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# ClearRecileBinTemp
Function ClearRecycleBinTemp {
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
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей    	
    } Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# ClearDownloads
Function ClearDownloads () {
    Write-Host -ForegroundColor DarkGreen "Выполняется скрипт по очистке папки Загрузки (Downloads)..."
	Write-Host -ForegroundColor DarkGreen "____________________________________________________________________"
	""
    
    $Path = "C:\users\$env:USERNAME\users.csv"
	Get-ChildItem C:\Users | Select-Object Name | Export-Csv -Path $Path -NoTypeInformation
	$List = Test-Path $Path
	""
	#*******************************************************
	""
	
	If ($List) {
		# Downloads
    	Write-Host -ForegroundColor Green "Очистка папки Загрузки (Downloads)"
    	Write-Host -ForegroundColor Green "-------------------------------------------"
    	""
    	Clear_Download ($Path)
		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей    	
    } Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# ClearFull
Function ClearFull {	
	Write-Host -ForegroundColor DarkGreen "Выполняется скрипт по очистке кэша браузеров и Корзины, удалению временных файлов  и папки Загрузки..."
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
        
        # Downloads
    	Write-Host -ForegroundColor Green "Очистка папки Загрузки (Downloads)"
    	Write-Host -ForegroundColor Green "-------------------------------------------"
    	""
    	Clear_Download ($Path)

		Remove-Item -Path $Path -Recurse -Force -ErrorAction SilentlyContinue -Verbose # удаление файла со списком пользователей    	
	} Else {
		Write-Host -ForegroundColor Red "Ошибка!"
		Exit
    }
}

# Choise
Function Choise_Screen {
	""
	Write-Host -ForegroundColor Yellow "Выберите режим очистки:"
	Write-Host -ForegroundColor Yellow "1. Очистить только кэши браузеров"
	Write-Host -ForegroundColor Yellow "2. Очитстить только Корзину и временные файлы (RecycleBin & Temp)"
    Write-Host -ForegroundColor Yellow "3. Очитстить только папку Загрузки (Downloads)"
	Write-Host -ForegroundColor Yellow "4. Очитстить кэши браузеров и Корзину с временными файлами (RecycleBin & Temp) и папкой Загрузки"
	Write-Host -ForegroundColor Yellow "5. Выход"
	""
	Write-Host -ForegroundColor Gray "*******************************************************"
	""
	$Choice = Read-Host "Для продолжения введите номер режима очистки"
	Switch ($Choice)
	{
		1 { ClearBrowser }
		2 { ClearRecycleBinTemp }
        3 { ClearDownloads }
		4 { ClearFull }
		5 {		
			Write-Host -ForegroundColor Red "Выход..."
			Exit
		}
		Default { Write-Host -ForegroundColor Red "Не правильно выбран режим" }
	}
}

#########################

""
Write-Host -ForegroundColor Red "Закройте все браузеры!"
""
Write-Host -ForegroundColor Gray "*******************************************************"
""

Choise_Screen

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