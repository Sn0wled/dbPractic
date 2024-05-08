
CREATE TABLE Адреса
(
	ИД                   serial NOT NULL ,
	Префикс_улицы        VARCHAR(20) DEFAULT  'улица'  NOT NULL  CHECK (Префикс_улицы IN ('улица', 'проспект', 'переулок')),
	Улица                VARCHAR(30) NOT NULL ,
	Дом                  VARCHAR(10) NOT NULL ,
	Помещение            VARCHAR(20) NOT NULL ,
	Номер_телефона       VARCHAR(7) NULL  CHECK (TRANSLATE(Номер_телефона,'0123456789-','9999999999-') = '9-99-99')
);



ALTER TABLE Адреса
	ADD  PRIMARY KEY (ИД);




CREATE UNIQUE INDEX Адреса_УК ON Адреса
(Улица   ASC,Дом   ASC,Помещение   ASC);



CREATE TABLE Классы
(
	ИД                   serial NOT NULL ,
	Макс_количество_мест INTEGER NOT NULL  CHECK (Макс_количество_мест >= 0),
	ИД_ответств_кафедры  NUMERIC(10) NOT NULL ,
	Примечание           varchar(1000) NULL ,
	Текущ_количество_мест INTEGER NOT NULL  CHECK (Текущ_количество_мест >= 0)
);



ALTER TABLE Классы
	ADD  PRIMARY KEY (ИД);



CREATE TABLE Оборудование
(
	ИД                   serial NOT NULL ,
	ИД_типа_оборудования integer NOT NULL ,
	Инвентарный_номер    NUMERIC(10) NOT NULL ,
	Признак_исправности  NUMERIC(1) NOT NULL  CHECK (Признак_исправности IN (0, 1)),
	Примечание           varchar(1000) NULL 
);



ALTER TABLE Оборудование
	ADD  PRIMARY KEY (ИД);



CREATE UNIQUE INDEX Оборудование_УК ON Оборудование
(Инвентарный_номер   ASC);



CREATE TABLE Обслуживание
(
	ИД                   serial NOT NULL ,
	ИД_учебного_места    integer NOT NULL ,
	ИД_оборудования      integer NOT NULL ,
	Дата_установки       DATE NOT NULL ,
	Дата_снятия          DATE NULL ,
CHECK ( Дата_установки <= Дата_снятия )
);



ALTER TABLE Обслуживание
	ADD  PRIMARY KEY (ИД);



CREATE UNIQUE INDEX Обслуживание_УК1 ON Обслуживание
(ИД_оборудования   ASC,Дата_установки   ASC);



CREATE UNIQUE INDEX Обслуживание_УК2 ON Обслуживание
(ИД_учебного_места   ASC,Дата_установки   ASC);



CREATE TABLE Типы_оборудований
(
	ИД                   serial NOT NULL ,
	Категория            varchar(20) NOT NULL  CHECK (Категория IN ('монитор', 'принтер', 'системный блок', 'материнская плата', 'процессор', 'сетевая карта', 'модуль памяти', 'ЖМД', 'привод CD', 'привод DVD', 'видеокарта', 'ГМД', 'прочее')),
	Наименование         varchar(150) NOT NULL ,
	Характеристика       varchar(1000) NULL 
);



ALTER TABLE Типы_оборудований
	ADD  PRIMARY KEY (ИД);



CREATE UNIQUE INDEX Типы_оборудований_УК ON Типы_оборудований
(Категория   ASC,Наименование   ASC);



CREATE TABLE Учебные_места
(
	ИД                   serial NOT NULL ,
	ИД_класса            integer NOT NULL ,
	Номер_учебного_места varchar(20) NOT NULL ,
	Имя_рабочей_станции  varchar(255) NULL ,
	IP_адрес             varchar(15) NULL  CHECK (TRANSLATE(IP_адрес,'0123456789.','9999999999.') = '999.999.999.999'),
	Примечание           varchar(1000) NULL ,
CHECK ( (Имя_рабочей_станции is not null) or
(IP_адрес is not null) )
);



ALTER TABLE Учебные_места
	ADD  PRIMARY KEY (ИД);



CREATE UNIQUE INDEX Учебное_место_УК1 ON Учебные_места
(ИД_класса   ASC,Имя_рабочей_станции   ASC);



CREATE UNIQUE INDEX Учебное_место_УК2 ON Учебные_места
(ИД_класса   ASC,IP_адрес   ASC);



ALTER TABLE Классы  
	ADD FOREIGN KEY ( ИД ) REFERENCES Адреса ( ИД ) ;



ALTER TABLE Оборудование
	ADD FOREIGN KEY (ИД_типа_оборудования) REFERENCES Типы_оборудований (ИД);



ALTER TABLE Обслуживание
	ADD FOREIGN KEY (ИД_оборудования) REFERENCES Оборудование (ИД);



ALTER TABLE Обслуживание
	ADD FOREIGN KEY (ИД_учебного_места) REFERENCES Учебные_места (ИД) ON DELETE CASCADE;



ALTER TABLE Учебные_места
	ADD FOREIGN KEY (ИД_класса) REFERENCES Классы (ИД) ON DELETE CASCADE;


