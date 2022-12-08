﻿#language: ru

@tree

Функционал: 050 Проверка прав доступа пользователя Продавец

Как тестировщик я хочу
проверить что пользователь Продавец имеет корректную настройку прав 
чтобы Продавец не наделал дел 

Контекст:	
	 Дано Я открыл сеанс TestClient от имени "Продавец" с паролем "" или подключаю уже существующий	

Сценарий: Закрытие клиента тестирования
	И я закрываю сеанс текущего клиента тестирования	

Сценарий: Начальное заполнение
	И Создание объектов для тестирования прав пользователя Продавец

Сценарий: Проверка доступности документа Продажа
	* Создание документа Продажа
		И В командном интерфейсе я выбираю 'Продажи' 'Продажа'
	* Перепроведение/Запись созданного документа
		И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b70fb06ebfcd704f11ed76f2f4c8aa42"
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я закрываю все окна клиентского приложения					

Сценарий: Проверка доступности документа Заказ (Продажи)
	* Открытие документа Заказ
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройкиДинамическогоСписка'
		И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
		Тогда открылось окно 'Настройка списка'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я перехожу к строке:
			| 'Доступные поля' |
			| 'Организация'    |
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я активизирую поле с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение"
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение" я выбираю точное значение 'ООО "1000 мелочей"'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я завершаю редактирование строки
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я перехожу к строке:
			| 'Доступные поля' |
			| 'Номер'          |
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '000000001'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
		Тогда открылось окно 'Заказы товаров'
		И в таблице "Список" я перехожу к строке:
			| 'Номер'     | 'Организация'        |
			| '000000001' | 'ООО "1000 мелочей"' |
		И в таблице "Список" я активизирую поле с именем "Организация"
		И в таблице "Список" я выбираю текущую строку
				
Сценарий: Проверка невозможности проведения/Создания документа Заказ (Продажи)
	И я закрываю все окна клиентского приложения
	* Отсутствие команды создать на форме списка заказов
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		И элемент формы с именем "СписокКонтекстноеМенюСоздать" отсутствует на форме
	* Открытие Заказа
		И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройкиДинамическогоСписка'
		И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
		Тогда открылось окно 'Настройка списка'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я перехожу к строке:
			| 'Доступные поля' |
			| 'Организация'    |
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я активизирую поле с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение"
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение" я выбираю точное значение 'ООО "1000 мелочей"'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я завершаю редактирование строки
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я перехожу к строке:
			| 'Доступные поля' |
			| 'Номер'          |
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '000000001'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
		Тогда открылось окно 'Заказы товаров'
		И в таблице "Список" я перехожу к строке:
			| 'Номер'     | 'Организация'        |
			| '000000001' | 'ООО "1000 мелочей"' |
		И в таблице "Список" я активизирую поле с именем "Организация"
		И в таблице "Список" я выбираю текущую строку	
	* Отсутствие команды провести и закрыть
		И элемент формы с именем "ФормаПровестиИЗакрыть" отсутствует на форме

Сценарий: Закрытие клиента тестирования
	И я закрываю сеанс текущего клиента тестирования