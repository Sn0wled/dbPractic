
CREATE TABLE Весы
(
	Инв_номер_весов      VARCHAR(10) NOT NULL ,
	Марка                VARCHAR(50) NOT NULL ,
	дата_калибровки      DATE NULL ,
	Предельный_вес       numeric(10,3) NOT NULL ,
	Погрешность          numeric(10,3) NULL 
);



ALTER TABLE Весы
	ADD CONSTRAINT  XPKВесы PRIMARY KEY (Инв_номер_весов);



CREATE  INDEX XIE1Весы ON Весы
(Марка   ASC);



CREATE  INDEX XIE2Весы ON Весы
(дата_калибровки   ASC);



CREATE  INDEX XIE3Весы ON Весы
(Предельный_вес   ASC,Погрешность   ASC);



CREATE TABLE Контейнер
(
	инв_номер_контейнер  VARCHAR(5) NOT NULL ,
	тип_контейнера       VARCHAR(20) NULL ,
	масса                numeric(3) NULL 
);



ALTER TABLE Контейнер
	ADD CONSTRAINT  XPKКонтейнер PRIMARY KEY (инв_номер_контейнер);



CREATE TABLE Материал
(
	id_материала         serial NOT NULL ,
	тип_материала        VARCHAR(30) NULL ,
	атомная_масса        numeric(10,3) NULL ,CONSTRAINT  XAK1Материал UNIQUE (тип_материала,атомная_масса)
);



ALTER TABLE Материал
	ADD CONSTRAINT  XPKМатериал PRIMARY KEY (id_материала);



CREATE  INDEX XIE_Материал_Тип ON Материал
(тип_материала   ASC);



CREATE TABLE ЗБМ
(
	id_ЗБМ               serial NOT NULL ,
	название             VARCHAR(20) NULL 
);



ALTER TABLE ЗБМ
	ADD CONSTRAINT  XPKЗБМ PRIMARY KEY (id_ЗБМ);



CREATE  INDEX XIE_ЗБМ_Название ON ЗБМ
(название   ASC);



CREATE TABLE Здание
(
	номер_здания         VARCHAR(5) NOT NULL ,
	id_ЗБМ               INTEGER NOT NULL ,
CONSTRAINT R_3 FOREIGN KEY (id_ЗБМ) REFERENCES ЗБМ (id_ЗБМ)
);



ALTER TABLE Здание
	ADD CONSTRAINT  XPKЗдание PRIMARY KEY (id_ЗБМ,номер_здания);



CREATE TABLE Должность
(
	id_должности         serial NOT NULL ,
	название_должности   VARCHAR(128) NULL ,
	может_изменять_справочную_инфо SMALLINT NULL ,
	может_отправлять_УЕ  SMALLINT NULL ,
	может_принимать_УЕ   SMALLINT NULL ,
	может_взвешивать_УЕ  SMALLINT NULL ,CONSTRAINT  XAK1Должность UNIQUE (название_должности)
);



ALTER TABLE Должность
	ADD CONSTRAINT  XPKДолжность PRIMARY KEY (id_должности);



CREATE  INDEX XIE_Должность_Название ON Должность
(название_должности   ASC);



CREATE TABLE Сотрудник
(
	фамилия              VARCHAR(50) NULL ,
	имя                  VARCHAR(50) NULL ,
	отчество             VARCHAR(50) NULL ,
	номер_телефона       VARCHAR(7) NULL ,
	дата_рождения        DATE NULL ,
	ИНН                  VARCHAR(12) NULL ,
	адрес                VARCHAR(200) NULL ,
	паспортные_данные    VARCHAR(10) NULL ,
	СНИЛС                VARCHAR(11) NULL ,
	id_должности         INTEGER NOT NULL ,
	таб_номер_сотрудника VARCHAR(6) NOT NULL ,CONSTRAINT  XAK_Сотрудник_Паспорт UNIQUE (паспортные_данные),CONSTRAINT  XAK_Сотрудник_Снилс UNIQUE (СНИЛС),CONSTRAINT  XAK_Сотрудник_ИНН UNIQUE (ИНН),
CONSTRAINT R_34 FOREIGN KEY (id_должности) REFERENCES Должность (id_должности)
);



ALTER TABLE Сотрудник
	ADD CONSTRAINT  XPKСотрудник PRIMARY KEY (таб_номер_сотрудника);



CREATE  INDEX XIE_Сотрудник_ФИО ON Сотрудник
(фамилия   ASC,имя   ASC,отчество   ASC);



CREATE TABLE Помещение
(
	id_ЗБМ               INTEGER NOT NULL ,
	таб_номер_сотрудника VARCHAR(6) NOT NULL ,
	номер_здания         VARCHAR(5) NOT NULL ,
	номер_помещения      VARCHAR(5) NOT NULL ,
CONSTRAINT R_4 FOREIGN KEY (id_ЗБМ, номер_здания) REFERENCES Здание (id_ЗБМ, номер_здания),
CONSTRAINT R_8 FOREIGN KEY (таб_номер_сотрудника) REFERENCES Сотрудник (таб_номер_сотрудника)
);



ALTER TABLE Помещение
	ADD CONSTRAINT  XPKПомещение PRIMARY KEY (id_ЗБМ,номер_здания,номер_помещения);



CREATE TABLE Учетная_единица
(
	форма_материала      VARCHAR(15) NULL ,
	id_материала         INTEGER NOT NULL ,
	id_ЗБМ               INTEGER NOT NULL ,
	масса_материала      numeric(10,3) NULL ,
	Серийный_номер_УЕ    VARCHAR(5) NOT NULL ,
	инв_номер_контейнер  VARCHAR(5) NOT NULL ,
	Инв_номер_весов      VARCHAR(10) NOT NULL ,
	номер_здания         VARCHAR(5) NOT NULL ,
	номер_помещения      VARCHAR(5) NOT NULL ,
CONSTRAINT R_17 FOREIGN KEY (инв_номер_контейнер) REFERENCES Контейнер (инв_номер_контейнер),
CONSTRAINT R_18 FOREIGN KEY (id_материала) REFERENCES Материал (id_материала),
CONSTRAINT R_9 FOREIGN KEY (Инв_номер_весов) REFERENCES Весы (Инв_номер_весов),
CONSTRAINT R_33 FOREIGN KEY (id_ЗБМ, номер_здания, номер_помещения) REFERENCES Помещение (id_ЗБМ, номер_здания, номер_помещения)
);



ALTER TABLE Учетная_единица
	ADD CONSTRAINT  XPKУчетная_единица PRIMARY KEY (Серийный_номер_УЕ);



CREATE  INDEX XIE1Учетная_единица ON Учетная_единица
(id_ЗБМ   ASC,номер_здания   ASC,номер_помещения   ASC);



CREATE  INDEX XIE2Учетная_единица ON Учетная_единица
(инв_номер_контейнер   ASC);



CREATE  INDEX XIE3Учетная_единица ON Учетная_единица
(id_материала   ASC);



CREATE TABLE Накладная_перемещения
(
	номер_накладной      VARCHAR(5) NOT NULL ,
	таб_номер_сотрудника VARCHAR(6) NOT NULL ,
	Дата_формирования    TIMESTAMP NOT NULL ,
CONSTRAINT R_36 FOREIGN KEY (таб_номер_сотрудника) REFERENCES Сотрудник (таб_номер_сотрудника)
);



ALTER TABLE Накладная_перемещения
	ADD CONSTRAINT  XPKНакладная_перемещения PRIMARY KEY (номер_накладной,Дата_формирования);



CREATE TABLE УЕ_Накладная
(
	Серийный_номер_УЕ    VARCHAR(5) NOT NULL ,
	номер_накладной      VARCHAR(5) NOT NULL ,
	Дата_формирования    TIMESTAMP NOT NULL ,
CONSTRAINT содержится FOREIGN KEY (Серийный_номер_УЕ) REFERENCES Учетная_единица (Серийный_номер_УЕ),
CONSTRAINT содержит FOREIGN KEY (номер_накладной, Дата_формирования) REFERENCES Накладная_перемещения (номер_накладной, Дата_формирования)
);



ALTER TABLE УЕ_Накладная
	ADD CONSTRAINT  XPKУЕ_Накладная PRIMARY KEY (Серийный_номер_УЕ,номер_накладной,Дата_формирования);



CREATE TABLE цилиндрический_контейнер
(
	инв_номер_контейнер  VARCHAR(5) NOT NULL ,
	высота               INTEGER NULL ,
	диаметр              INTEGER NULL ,
FOREIGN KEY (инв_номер_контейнер) REFERENCES Контейнер(инв_номер_контейнер) ON DELETE CASCADE
);



ALTER TABLE цилиндрический_контейнер
	ADD CONSTRAINT  XPKцилиндрический_контейнер PRIMARY KEY (инв_номер_контейнер);



CREATE TABLE кубический_контейнер
(
	инв_номер_контейнер  VARCHAR(5) NOT NULL ,
	длина                INTEGER NULL ,
	ширина               INTEGER NULL ,
	высота               INTEGER NULL ,
FOREIGN KEY (инв_номер_контейнер) REFERENCES Контейнер(инв_номер_контейнер) ON DELETE CASCADE
);



ALTER TABLE кубический_контейнер
	ADD CONSTRAINT  XPKкубический_контейнер PRIMARY KEY (инв_номер_контейнер);



CREATE TABLE Предприятие_партнер
(
	id_предприятия       serial NOT NULL ,
	название             VARCHAR(20) NULL ,
	ИНН                  VARCHAR(10) NULL ,
	электронная_почта    VARCHAR(320) NULL ,
	адрес                VARCHAR(200) NULL ,
	номер_телефона       VARCHAR(7) NULL ,CONSTRAINT  XAK_Предприятие_партнер_ИНН UNIQUE (ИНН),CONSTRAINT  XAK2Предприятие_партнер UNIQUE (название,адрес)
);



ALTER TABLE Предприятие_партнер
	ADD CONSTRAINT  XPKПредприятие_партнер PRIMARY KEY (id_предприятия);



CREATE TABLE Представитель_предприятия_парт
(
	id_предприятия       INTEGER NOT NULL ,
	id_представителя     serial NOT NULL ,
	фамилия              VARCHAR(50) NULL ,
	имя                  VARCHAR(50) NULL ,
	отчество             VARCHAR(50) NULL ,
	номер_телефона       VARCHAR(7) NULL ,
CONSTRAINT R_31 FOREIGN KEY (id_предприятия) REFERENCES Предприятие_партнер (id_предприятия)
);



ALTER TABLE Представитель_предприятия_парт
	ADD CONSTRAINT  XPKПредставитель_предприятия_п PRIMARY KEY (id_представителя);



CREATE  INDEX XIE_Представитель_предприятия_ ON Представитель_предприятия_парт
(фамилия   ASC,имя   ASC,отчество   ASC);



CREATE TABLE Накладная_отправки
(
	номер_накладной      VARCHAR(5) NOT NULL ,
	id_представителя     INTEGER NOT NULL ,
	Дата_формирования    TIMESTAMP NOT NULL ,
FOREIGN KEY (номер_накладной, Дата_формирования) REFERENCES Накладная_перемещения(номер_накладной, Дата_формирования) ON DELETE CASCADE,
CONSTRAINT R_14 FOREIGN KEY (id_представителя) REFERENCES Представитель_предприятия_парт (id_представителя)
);



ALTER TABLE Накладная_отправки
	ADD CONSTRAINT  XPKНакладная_отправки PRIMARY KEY (номер_накладной,Дата_формирования);



CREATE TABLE Накладная_поступления
(
	номер_накладной      VARCHAR(5) NOT NULL ,
	id_представителя     INTEGER NOT NULL ,
	Дата_формирования    TIMESTAMP NOT NULL ,
FOREIGN KEY (номер_накладной, Дата_формирования) REFERENCES Накладная_перемещения(номер_накладной, Дата_формирования) ON DELETE CASCADE,
CONSTRAINT R_11 FOREIGN KEY (id_представителя) REFERENCES Представитель_предприятия_парт (id_представителя)
);



ALTER TABLE Накладная_поступления
	ADD CONSTRAINT  XPKНакладная_поступления PRIMARY KEY (номер_накладной,Дата_формирования);



CREATE TABLE Накладная_локального_перемещен
(
	номер_накладной      VARCHAR(5) NOT NULL ,
	таб_номер_принимающего VARCHAR(6) NOT NULL ,
	таб_номер_отправляющего VARCHAR(6) NOT NULL ,
	Дата_формирования    TIMESTAMP NOT NULL ,
CONSTRAINT R_35 FOREIGN KEY (таб_номер_принимающего) REFERENCES Сотрудник (таб_номер_сотрудника),
FOREIGN KEY (номер_накладной, Дата_формирования) REFERENCES Накладная_перемещения(номер_накладной, Дата_формирования) ON DELETE CASCADE,
CONSTRAINT R_38 FOREIGN KEY (таб_номер_отправляющего) REFERENCES Сотрудник (таб_номер_сотрудника)
);



ALTER TABLE Накладная_локального_перемещен
	ADD CONSTRAINT  XPKНакладная_локального_переме PRIMARY KEY (номер_накладной,Дата_формирования);



CREATE TABLE Критический_предел
(
	id_материала         INTEGER NOT NULL ,
	id_ЗБМ               INTEGER NOT NULL ,
	предельная_масса     numeric(10,3) NULL ,
	номер_здания         VARCHAR(5) NOT NULL ,
	номер_помещения      VARCHAR(5) NOT NULL ,
CONSTRAINT R_6 FOREIGN KEY (id_материала) REFERENCES Материал (id_материала),
CONSTRAINT R_5 FOREIGN KEY (id_ЗБМ, номер_здания, номер_помещения) REFERENCES Помещение (id_ЗБМ, номер_здания, номер_помещения)
);



ALTER TABLE Критический_предел
	ADD CONSTRAINT  XPKКритический_предел PRIMARY KEY (id_материала,id_ЗБМ,номер_здания,номер_помещения);


