# DictionarySwiftUI
- [Description in English](#Description-in-English)
  - [About the project](#About-the-project)
  - [Features](#Features)
  - [Dictionary API and API-key](#Dictionary-API-and-API-key)
- [Описание на русском](#Описание-на-русском)
  - [О проекте](#О-проекте)
  - [Особенности](#Особенности)
  - [API словаря и API-ключ](#API-словаря-и-API-ключ)

## Description in English

### About the project
**DictionarySwiftUI** - the project, written in SwiftUI with localization in two languages (Eng, Ru), is a dictionary with capabilities:
- [x] Search for translations of words in different languages.
- [x] Search for word descriptions.
- [x] Add the desired words to favorites.
- [x] Check your knowledge of the added translations.
- [x] Add a widget that will display a random word to remember.
- [x] And others

### Features
The project is written on the new SwiftUI framework with all its features, the MVVM architecture was used, as well as CoreData for local storage + Unit and UI tests were prepared for the project and a trial widget was written.  
**Not all of this was done with "Best practice" since the original goal of the project was to be able to review the new SwiftUI functionality and practice using it.**

### Dictionary API and API-key
The old API key has been deleted, so you will need to create your own.  
This [**API (Eng)**](https://yandex.com/dev/dictionary/) from Yandex company was used for development.  
To check the dictionary performance on a simulator or device, you need:
- [Read the terms of use.](https://yandex.com/legal/dictionary_api/)
- [Get a free API-key.](https://yandex.com/dev/dictionary/keys/get/)
- Insert the key inside *let apiKey = ""* by path: *DictionarySwiftUI/Data/DataService/DataService+Translate*.

## Описание на русском

### О проекте
**DictionarySwiftUI** - проект, написанный на swiftUI с локализацией на двух языках (Eng, Ru), представляет собой словарь с возможностями:
- [x] Искать перевод слов на разных языках.
- [x] Искать описание слов.
- [x] Добавлять нужные слова в избранное.
- [x] Проверять свои знания по добавленым переводам.
- [x] Добавлять виджет, на котором будет отображено рандомное слово для запоминания.
- [x] И некоторые другие

### Особенности
Проект написан на новом фреймворке SwiftUI со всеми его возможностями, использовалась архитектура MVVM, а так же CoreData для локального хранения + для проекта подготовлены Unit и UI тесты и написан пробный виджет.  
**Не все из написанного было сделано с "Best practice" так как первоначальной целью проекта была возможность рассмотреть новый функционал SwiftUI и попрактиковаться в его использовании.**

### API словаря и API-ключ
Старый API-ключ был удален, так что вам нужно будет создать свой.  
Для разработки использовалось [**API (Ru)**](https://yandex.ru/dev/dictionary/) от компании Яндекс.   
Чтобы проверить работоспособность словаря на симуляторе или устройстве необходимо:
- [Прочитать условия использования.](https://yandex.com/legal/dictionary_api/)
- [Получить бесплатный API-ключ.](https://yandex.ru/dev/dictionary/keys/get/?service=dict)
- Вставить ключ внутрь *let apiKey = ""* по пути: *DictionarySwiftUI/Data/DataService/DataService+Translate*.
