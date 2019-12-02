[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/anst-foto/Broom/blob/master/LICENSE)  
![Language: PowerShell](https://img.shields.io/badge/language-PowerShell-blue.svg)
[![CodeFactor](https://www.codefactor.io/repository/github/anst-foto/broom/badge/show-procedure)](https://www.codefactor.io/repository/github/anst-foto/broom/overview/show-procedure)

[![GitHub: Broom](https://img.shields.io/badge/GitHub-Broom-orange.svg)](https://github.com/anst-foto/Broom)  
[![Gallery TechNet: Broom](https://img.shields.io/badge/Gallery%20TechNet-Broom-orange.svg)](https://gallery.technet.microsoft.com/PowerShell-f24f32cb)  
[![PowerShell Gallery: Broom](https://img.shields.io/badge/PowerShell%20Gallery-Broom-orange.svg)](https://www.powershellgallery.com/packages/Broom)

# Broom \(Метла\)

PowerShell-скрипт по очистке кэша браузеров и Корзины, удалению временных файлов.

---

* **Очистка кэша и Корзины, удаление временных файлов \(PowerShell\)**
* **© Starinin Andrey \(AnSt\), 2017**
* **© Автономное учреждение Воронежской области 'Многофункциональный центр предоставления государственных и муниципальных услуг', 2017**
* [**MIT License**](/LICENSE)
* **Версия: 0.29.3 \(Декабрь 2019\)**
* [**GitHub**](https://github.com/anst-foto/Broom) \| [**Gallery TechNet**](https://gallery.technet.microsoft.com/PowerShell-f24f32cb) \| [**PowerShell Gallery**](https://www.powershellgallery.com/packages/Broom)
* **Основано на коде -** [**Lee Bhogal**](https://github.com/lemtek/Powershell) \| **By Lee Bhogal, Paradise Computing Ltd - June 2014**
* **Добавлен** [**PS2EXE-GUI**](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5) **для компиляции в EXE-файл** \| **PS2EXE-GUI v0.5.0.13 by Ingo Karstein, reworked and GUI support by Markus Scholtes**

---

## Изменения:

[CHANGELOG.md](/CHANGELOG.md)

---

## Что делает?

* Очищает кэши основных браузеров \(поддерживаемые браузеры указаны в разделе _Браузеры_\) у всех пользователей компьютера
* Очищает Корзину Windows
* Удаляет временные файлы пользователя и системы
* Удаляет папк Загрузки \(Downloads\)
* Выводит на экран информацию об удалённых файлах

## Браузеры:

* Mozilla Firefox
* Google Chrome
* Chromium
* Яндекс.Браузер
* Opera
* Internet Explorer

## Установка:

Установка не требуется  
1. Скачавайте с репозитория GitHub zip-архив - [https://github.com/anst-foto/Broom/archive/master.zip](https://github.com/anst-foto/Broom/archive/master.zip) _Доступен EXE-файл и PS-скрипт_  
2. Сохраняете скрипт из PowerShell Gallery - `Save-Script -Name Broom -Path <path>`. _Доступен только PS-скрипт_
3. Выбирайте релиз и скачивайте - [https://github.com/anst-foto/Broom/releases](https://github.com/anst-foto/Broom/releases) _Доступен EXE-файл и PS-скрипт_

## Меню:

1. Очистить только кэши браузеров
2. Очитстить только Корзину и временные файлы \(RecycleBin & Temp\)
3. Очитстить только папку Загрузки \(Downloads\)
4. Очитстить кэши браузеров и Корзину с временными файлами \(RecycleBin & Temp\) и папкой Загрузки
5. Выход

---

## Версии:

* PowerShell-скрипт \(разработка в **PowerGUI Script Editor v3.8.0.129** и **Visual Studio 2017**\)
* Скомпилированный EXE-файл \(компиляцция в **PS2EXE-GUI v0.5.0.6 by Ingo Karstein, reworked and GUI support by Markus Scholtes**\). Компиляция EXE-файла _PS2EXE-GUI_ уменьшило запуск программы в несколько раз, по сравнению с запуском EXE-файла скомпилированного _PowerGUI Script Editor v3.8.0.129_

---

### PS2EXE-GUI

Добавлен [**PS2EXE-GUI**](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5) для компиляции в EXE-файл

License: MS-LPL  
PS2EXE-GUI vv0.5.0.13 by Ingo Karstein, reworked and GUI support by Markus Scholtes

Overworking of the great script of Igor Karstein with GUI support by Markus Scholtes.
The GUI output and input is activated with one switch, real windows executables are generated.

Добавлен **ConvertPS2EXE.ps1** для автоматической компиляции в EXE-файл