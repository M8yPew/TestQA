#language: ru
@ДвиженияДокументов
@tree

Функционал: Проверка движения документа поступление товаров

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 Подготовительный сценарий (проверка движения документа поступления товаров)
	* Загрузка данных
		Когда экспорт основных данных
		Когда Экспорт документов поступления товаров услуг 
	* Проведение загруженного документа
		И Я открываю навигационную ссылку "e1cib/data/Document.PurchaseInvoice?ref=b70cb06ebfcd704f11ed6a5eda6c7e38"
		И я нажимаю на кнопку с именем 'FormPost'	
		И я закрываю все окна клиентского приложения
		
Сценарий: _0502 Создание документа поступление товаров
	* Создание документа
		И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров и услуг'
		И я нажимаю на кнопку с именем 'FormCreate'

	* Заполнение шапки документа
		Когда открылось окно 'Поступление товаров и услуг (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование' |
			| '4'   | 'Поставщик 2'  |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
			
	* Заполнение табличной части документа
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
		Тогда открылось окно 'Номенклатура'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            | 'Ссылка'                  |
			| 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
		И в таблице "List" я перехожу к строке:
			| 'Наименование' | 'Ссылка' |
			| 'Услуга'       | 'Услуга' |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| 'N' | 'Вид цены'          | 'Ед. изм.' | 'Используется приходная товарная накладная' | 'Количество' | 'НДС' | 'Не рассчитывать строки' | 'Номенклатура'            | 'Склад'                         | 'Характеристика'          |
			| '1' | 'Цена поставщика 2' | 'шт'       | 'Да'                                        | '1,000'      | '20%' | 'Нет'                    | 'Товар без характеристик' | 'Склад 1 (с контролем остатка)' | 'Товар без характеристик' |
		И в таблице "ItemList" я активизирую поле с именем "ItemListQuantity"
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле с именем 'ItemListQuantity' я ввожу текст '2,000'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я активизирую поле с именем "ItemListPrice"
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле с именем 'ItemListPrice' я ввожу текст '100,00'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| 'N' | 'Вид цены'          | 'Ед. изм.' | 'Используется приходная товарная накладная' | 'Количество' | 'НДС' | 'Не рассчитывать строки' | 'Номенклатура' | 'Склад'                         | 'Характеристика' |
			| '2' | 'Цена поставщика 2' | 'шт'       | 'Нет'                                       | '1,000'      | '20%' | 'Нет'                    | 'Услуга'       | 'Склад 1 (с контролем остатка)' | 'Услуга'         |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле с именем 'ItemListPrice' я ввожу текст '200,00'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я активизирую поле с именем "ItemListExpenseType"
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListExpenseType"
		И я нажимаю на кнопку с именем 'FormCreate'
		И в поле с именем 'Description_en' я ввожу текст 'Статья расходов'
		И я изменяю флаг с именем 'IsExpense'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Статья доходов и расходов (создание) *' в течение 20 секунд
		И я нажимаю на кнопку с именем 'FormChoose'
		И в таблице "ItemList" я завершаю редактирование строки
	
	* Проверка результата заполнения документа
		
		И элемент формы с именем "Partner" стал равен 'Поставщик 2'
		И элемент формы с именем "LegalName" стал равен 'Поставщик 2'
		И элемент формы с именем "Agreement" стал равен 'Соглашение с поставщиком 2'
		И элемент формы с именем "LegalNameContract" стал равен ''
		И элемент формы с именем "Description" стал равен 'Click to enter description'
		И элемент формы с именем "Company" стал равен 'Собственная компания 1'
		И элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'
		И таблица "ItemList" стала равной:
			| 'Сумма без налогов' | 'Сумма скидки' | 'N' | 'Номенклатура'            | 'Не рассчитывать строки' | 'Характеристика'          | 'Сумма налогов' | 'Серии номенклатуры' | 'Количество' | 'Заказ поставщику' | 'Ед. изм.' | 'НДС' | 'Заказ покупателя' | 'Общая сумма' | 'Дата выполнения' | 'Склад'                         | 'Вид цены'          | 'Статья расходов' | 'Центр прибыли/убытков' | 'Цена'   | 'Дополнительная аналитика' | 'Заявка на обеспечение товара' | 'Используется приходная товарная накладная' | 'Комментарий' |
			| '166,67'            | ''             | '1' | 'Товар без характеристик' | 'Нет'                    | 'Товар без характеристик' | '33,33'         | ''                   | '2,000'      | ''                 | 'шт'       | '20%' | ''                 | '200,00'      | ''                | 'Склад 1 (с контролем остатка)' | 'Ручное назначение' | ''                | ''                      | '100,00' | ''                         | ''                             | 'Да'                                        | ''            |
			| '166,67'            | ''             | '2' | 'Услуга'                  | 'Нет'                    | 'Услуга'                  | '33,33'         | ''                   | '1,000'      | ''                 | 'шт'       | '20%' | ''                 | '200,00'      | ''                | 'Склад 1 (с контролем остатка)' | 'Ручное назначение' | 'Статья расходов' | ''                      | '200,00' | ''                         | ''                             | 'Нет'                                       | ''            |
		
		Тогда в таблице "SpecialOffers" количество строк "равно" 0
		Тогда в таблице "PaymentTerms" количество строк "равно" 0
		Тогда в таблице "SerialLotNumbersTree" количество строк "равно" 0
		Тогда в таблице "GoodsReceiptsTree" количество строк "равно" 0
		И элемент формы с именем "PriceIncludeTax" стал равен 'Да'
		И элемент формы с именем "IgnoreAdvances" стал равен 'Нет'
		И элемент формы с именем "Currency" стал равен 'USD'
		И элемент формы с именем "Branch" стал равен ''
		И элемент формы с именем "InternalLinkedDocs" стал равен ''
		И элемент формы с именем "ExternalLinkedDocs" стал равен ''
		И элемент формы с именем "ItemListTotalOffersAmount" стал равен '0,00'
		И у элемента формы с именем "ItemListTotalOffersAmount" текст редактирования стал равен '0,00'
		И элемент формы с именем "ItemListTotalNetAmount" стал равен '333,34'
		И элемент формы с именем "ItemListTotalTaxAmount" стал равен '66,66'
		И элемент формы с именем "ItemListTotalTotalAmount" стал равен '400,00'
		И у элемента формы с именем "ItemListTotalTotalAmount" текст редактирования стал равен '400,00'
		И элемент формы с именем "CurrencyTotalAmount" стал равен 'USD'

	* Запись документа
		И я нажимаю на кнопку с именем 'FormPost'

	* Сохранение параметров документа в переменные
		И я запоминаю значение поля с именем 'Number' как "НомерНовогоДокумента" 
		И Я запоминаю значение поля с именем  'Date' как "ДатаНовогоДокумента"  

	* Закрытие окон
		И я закрываю все окна клиентского приложения		

	* Проверка проведения созданного документа
		* Поиск созданного документа					
			И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров и услуг'
			И я нажимаю на кнопку с именем 'FormListSettings'
			Тогда открылось окно 'Настройка списка'
			И я перехожу к закладке с именем "SettingsComposerUserSettingsItem0"
			И в таблице "SettingsComposerUserSettingsItem0Filter" я активизирую поле с именем "SettingsComposerUserSettingsItem0FilterPresentation"
			И в таблице "SettingsComposerUserSettingsItem0Filter" я нажимаю на кнопку с именем 'SettingsComposerUserSettingsItem0FilterUncheckAll'
			И в таблице "SettingsComposerUserSettingsItem0AvailableFieldsTable" я перехожу к строке:
				| 'Доступные поля' |
				| 'Номер'          |
			И в таблице "SettingsComposerUserSettingsItem0AvailableFieldsTable" я выбираю текущую строку
			И в таблице "SettingsComposerUserSettingsItem0Filter" я активизирую поле с именем "SettingsComposerUserSettingsItem0FilterRightValue"
			И в таблице "SettingsComposerUserSettingsItem0Filter" я выбираю текущую строку
			И в таблице "SettingsComposerUserSettingsItem0Filter" в поле с именем 'SettingsComposerUserSettingsItem0FilterRightValue' я ввожу текст '$НомерНовогоДокумента$'
			И в таблице "SettingsComposerUserSettingsItem0Filter" я завершаю редактирование строки
			И в таблице "SettingsComposerUserSettingsItem0AvailableFieldsTable" я перехожу к строке:
				| 'Доступные поля' |
				| 'Дата'           |
			И в таблице "SettingsComposerUserSettingsItem0AvailableFieldsTable" я выбираю текущую строку
			И в таблице "SettingsComposerUserSettingsItem0Filter" я активизирую поле с именем "SettingsComposerUserSettingsItem0FilterDate"
			И в таблице "SettingsComposerUserSettingsItem0Filter" я выбираю текущую строку
			И в таблице "SettingsComposerUserSettingsItem0Filter" в поле с именем 'SettingsComposerUserSettingsItem0FilterDate' я ввожу текст '$ДатаНовогоДокумента$'
			И в таблице "SettingsComposerUserSettingsItem0Filter" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormEndEdit'	

		* Проверка движения по регистру закупки
			И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
			И в табличном документе 'ResultTable' я перехожу к ячейке "R1C1"
			И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
			И я нажимаю на кнопку с именем 'GenerateReport'
			Тогда табличный документ "ResultTable" содержит строки:
				| 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | ''                      | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                                            | ''                        | ''            | ''                  |
				| 'Движения документа по регистрам'                                             | ''                      | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                                            | ''                        | ''            | ''                  |
				| 'Регистр  "R1001 Закупки"'                                                    | ''                      | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                                            | ''                        | ''            | ''                  |
				| ''                                                                            | 'Period'                | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                                            | ''                        | ''            | 'Attributes'        |
				| ''                                                                            | ''                      | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                                      | 'Характеристика'          | 'Ключ строки' | 'Отложенный расчет' |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Услуга'                  | '*'           | 'Да'                |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Услуга'                  | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en description is empty'      | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Услуга'                  | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Услуга'                  | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Услуга'                  | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Товар без характеристик' | '*'           | 'Да'                |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Товар без характеристик' | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'en description is empty'      | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Товар без характеристик' | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Товар без характеристик' | '*'           | 'Нет'               |
				| ''                                                                            | '$ДатаНовогоДокумента$' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг $НомерНовогоДокумента$ от $ДатаНовогоДокумента$' | 'Товар без характеристик' | '*'           | 'Нет'               |
			
							
				

				