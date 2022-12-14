#language: ru

@tree

Функционал: 03 Проверка создания клиента

Как Оператор я хочу
создать клиента 
чтобы вести клиентскую базу

Сценарий: 03.01 Проверка создания клиента
	* Открытие формы создания клиента
		И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
		Тогда открылось окно 'Контрагенты'
		И я нажимаю на кнопку с именем 'ФормаСоздать'		
	* Заполнение реквизитов клиента
		Когда открылось окно 'Контрагент (создание)'
		И в поле с именем 'Наименование' я ввожу текст '_Тестовый контрагент'
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'		
	* Заполнение контактной информации клиента
		Когда открылось окно 'Контрагент (создание) *'
		И в поле с именем 'Страна' я ввожу текст 'Россия'
		И в поле с именем 'Город' я ввожу текст 'Уфа'
		И в поле с именем 'Улица' я ввожу текст 'Пушкина'
		И в поле с именем 'Дом' я ввожу текст 'Колотушкина'
		И в поле с именем 'ЭлектроннаяПочта' я ввожу текст 'цацуацау@mail.ru'
		И я нажимаю кнопку выбора у поля с именем "Регион"
		Тогда открылось окно 'Регионы РФ'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И в поле с именем 'Pattern' я ввожу текст 'Москва'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Регионы РФ'
		И в таблице "Список" я выбираю текущую строку		
	* Запись элемента в базу
		Когда открылось окно 'Контрагент (создание) *'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я запоминаю значение поля "Код" как "КодКонтрагента"
		Когда открылось окно '_Тестовый контрагент (Контрагент)'
		И я закрываю все окна клиентского приложения					
	* Проверка записи элемента
		И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
		Тогда открылось окно 'Контрагенты'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Код'
		И в поле с именем 'Pattern' я ввожу значение переменной "КодКонтрагента" 
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Контрагенты'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно '_Тестовый контрагент (Контрагент)'
		И Я закрываю окно '_Тестовый контрагент (Контрагент)'
		Тогда открылось окно 'Контрагенты'
		И Я закрываю окно 'Контрагенты'
				
	