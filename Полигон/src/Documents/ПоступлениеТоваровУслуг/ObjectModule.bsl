
Процедура ОбработкаПроведения(Отказ, Режим)
	// регистр Корреспонденция 
	Движения.Корреспонденция.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Корреспонденция.Добавить();
		Движение.СчетДт = ПланыСчетов.Управленческий.Товары;
		Движение.СчетКт = ПланыСчетов.Управленческий.РасчетыСПоставщиками;
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.КоличествоДт = ТекСтрокаТовары.Количество;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Склады] = Склад;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Номенклатура] = ТекСтрокаТовары.Номенклатура;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.Контрагенты] = Контрагент;
	КонецЦикла;

	// регистр БезКорреспонденции Дебет
	Движения.БезКорреспонденции.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.БезКорреспонденции.Добавить();
		Движение.ВидДвижения = ВидДвиженияБухгалтерии.Дебет;
		Движение.Счет = ПланыСчетов.Управленческий.Товары;
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Субконто[ПланыВидовХарактеристик.ВидыСубконто.Склады] = Склад;
		Движение.Субконто[ПланыВидовХарактеристик.ВидыСубконто.Номенклатура] = ТекСтрокаТовары.Номенклатура;
	КонецЦикла;

	// регистр БезКорреспонденции Кредит
	Движения.БезКорреспонденции.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.БезКорреспонденции.Добавить();
		Движение.ВидДвижения = ВидДвиженияБухгалтерии.Кредит;
		Движение.Счет = ПланыСчетов.Управленческий.РасчетыСПоставщиками;
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.Субконто[ПланыВидовХарактеристик.ВидыСубконто.Контрагенты] = Контрагент;
	КонецЦикла;

КонецПроцедуры
