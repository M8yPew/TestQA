﻿#language: ru

@tree

Функционал: Проврка формы элемента справочника Организации

Как тестировщик я хочу
проверить доступность вкладок 
чтобы убедиться что пользователь не ошибся при вводе данных и функционал работоспособен

Сценарий: Проверка доступности вкладок налоги и валюты в справочнике Организаций
	* Открытие элемента
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Установка галочки "наша компания"
		И я устанавливаю флаг с именем 'OurCompany'
		И элемент формы "Валюты" присутствует на форме
		И элемент формы "Вид налога" присутствует на форме
	* Снятие галочки "наша компания" и проверка невидимости элементов	
		И я снимаю флаг с именем 'OurCompany'
		И элемент формы "Валюты" существует и невидим на форме
		И элемент формы "Вид налога" существует и невидим на форме