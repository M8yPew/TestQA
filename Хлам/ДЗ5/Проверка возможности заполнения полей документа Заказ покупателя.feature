#language: ru

@tree

Функционал: Проверка возможности заполнения полей документа Заказ покупателя

Как менеджер по продажам я хочу
заполнить документ Заказ покупателя 
чтобы зафиксировать заказ в учетной системе 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка возможности заполнения полей шапки документа Заказ покупателя
	* Открытие заказа покупателя
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'

	* Проверка невозможности заполнения контрагента при пустом поле партнер
		И элемент формы с именем "Partner" стал равен ''
		И элемент формы с именем "LegalName" не доступен

	* Проверка возможности заполнения партнера
// Теоретически при разработке могут писать свои обработчики открытия форм подбора или дорабатывать формы подбора.
// Отсюда следует, что удалять ожидания что было открыто окно с нужным заголовком может быть некорректно ( на мой взгляд )
		* Заполнение партнера
			И я нажимаю кнопку выбора у поля с именем "Partner"
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuCopyToClipboard'
			И я нажимаю на кнопку с именем 'FormFind'
			И в поле с именем 'Pattern' я ввожу текст 'Клиент 1 (1 соглашение)'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "List" я выбираю текущую строку
		* Заполнение Контрагента
			И я нажимаю кнопку выбора у поля с именем "LegalName"
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuCopyToClipboard'
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'Клиент 1'
			И я нажимаю на кнопку с именем 'Find'
			И в таблице "List" я выбираю текущую строку
		* Заполнение соглашения 
			// подумал об этом я здесь поэтому здесь и оставил
			И я нажимаю кнопку выбора у поля с именем "Agreement"
			Тогда открылось окно 'Соглашения'
			// И Я запоминаю значение выражения 'ЭтаФорма.ИмяФормы' в переменную "Тест" // ExternalDataProcessor.VanessaAutomation.From.УпрвляемаяФорма - интересно )
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuCopyToClipboard'
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылось окно 'Найти'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Соглашения'
			И в таблице "List" я выбираю текущую строку
			Тогда открылось окно 'Табличная часть товаров будет обновлена'
			И я нажимаю на кнопку с именем 'FormOK'
		* Проверка заполнения Организации
			
			Если элемент формы с именем "Company" стал равен '' Тогда
				И я нажимаю кнопку выбора у поля с именем "Company"
				И в таблице "List" я перехожу к строке:
					| 'Наименование' |
					| 'Собственная компания 2' |
				И в таблице "List" я выбираю текущую строку
				И я запоминаю значение поля с именем "Company" как "Организация"					
			Иначе
				И я запоминаю значение поля с именем "Company" как "Организация"
								
		* Проверка состояния формы
			Тогда элемент формы с именем "DecorationClosingOrder" стал равен 'Этот заказ закрыт:'
			И элемент формы с именем "ClosingOrder" стал равен ''
			И элемент формы с именем "DecorationGroupTitleCollapsedPicture" стал равен 'Сворачиваемая группа формы'
			И элемент формы с именем "DecorationGroupTitleCollapsedLabel" стал равен шаблону 'Date: *   Организация: $Организация$   Партнер: Клиент 1 (1 соглашение)   Контрагент: Клиент 1   Соглашение: Соглашение с клиентами (расчет по документам + кредитный лимит)   Статус: Согласовано   '
			И элемент формы с именем "DecorationGroupTitleUncollapsedPicture" стал равен 'DecorationGroupTitleUncollapsedPicture'
			И элемент формы с именем "DecorationGroupTitleUncollapsedLabel" стал равен шаблону 'Date: *   Организация: $Организация$   Партнер: Клиент 1 (1 соглашение)   Контрагент: Клиент 1   Соглашение: Соглашение с клиентами (расчет по документам + кредитный лимит)   Статус: Согласовано   '
			И элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'
			И элемент формы с именем "LegalName" стал равен 'Клиент 1'
			И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
			И элемент формы с именем "Description" стал равен 'Click to enter description'
			И элемент формы с именем "Status" стал равен 'Согласовано'
			И элемент формы с именем "Company" стал равен '$Организация$'
			И элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'



