<#PSScriptInfo

.VERSION 0.22

.GUID 1b158786-70ac-433f-b3f3-87b9e1baac75

.AUTHOR An.St.

.COPYRIGHT © Starinin Andrey (AnSt), 2017

.LICENSE MIT License

.LICENSEURI https://github.com/anst-foto/Broom/blob/master/LICENSE

.PROJECTURI https://github.com/anst-foto/Broom

.RELEASENOTES

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
Write-Host -ForegroundColor Yellow "Версия: 0.22 (Октябрь 2017)"
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

Import-Module 'Broom_Module'

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