--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: add_class(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying)
    LANGUAGE sql
    AS $$
	begin;
		insert into Классы (Макс_количество_мест, ИД_ответств_кафедры, Примечание, Текущ_количество_мест)
		values (max_places, resp_id, note, 0);
		insert into Адреса
		values (lastval(), a_pref, a_street, a_house, a_place, a_phone_number);
	commit;
$$;


ALTER PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying) OWNER TO postgres;

--
-- Name: add_eq_type(character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying)
    LANGUAGE sql
    AS $$
	insert into Типы_оборудований
	(Категория, Наименование, Характеристика)
	values (category, name, characteristic)
$$;


ALTER PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying) OWNER TO postgres;

--
-- Name: add_learn_place(integer, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying)
    LANGUAGE sql
    AS $$
	begin;
		update Классы set Текущ_количество_мест = Текущ_количество_мест + 1 where Классы."ИД" = class_id;
		insert into Учебные_места (ИД_класса, Номер_учебного_места, Имя_рабочей_станции, ip_адрес, Примечание)
		values (class_id, place_num, workstation_name, id_address, note);
	commit;
$$;


ALTER PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying) OWNER TO postgres;

--
-- Name: del_class(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_class(IN class_id integer)
    LANGUAGE sql
    AS $$
	delete from Классы
	where Классы."ИД" = class_id;
	delete from Адреса
	where Адреса."ИД" = class_id;
$$;


ALTER PROCEDURE public.del_class(IN class_id integer) OWNER TO postgres;

--
-- Name: del_eq(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	delete from Оборудование
	where ИД = eq_id
$$;


ALTER PROCEDURE public.del_eq(IN eq_id integer) OWNER TO postgres;

--
-- Name: del_eq_type(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_eq_type(IN id integer)
    LANGUAGE sql
    AS $$
	delete from Типы_оборудований where ИД = id
$$;


ALTER PROCEDURE public.del_eq_type(IN id integer) OWNER TO postgres;

--
-- Name: del_learn_place(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_learn_place(IN learn_place_id integer)
    LANGUAGE sql
    AS $$
	begin;
		update Классы set Текущ_количество_мест = Текущ_количество_мест - 1
		where ИД = (select Учебные_места."ИД_класса"  from Учебные_места where Учебные_места."ИД" = learn_place_id);
		delete from Учебные_места where Учебные_места."ИД" = learn_place_id;
	commit;
$$;


ALTER PROCEDURE public.del_learn_place(IN learn_place_id integer) OWNER TO postgres;

--
-- Name: eq_is_installed(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.eq_is_installed(eq_id integer) RETURNS boolean
    LANGUAGE sql
    AS $$
	select (select count(*) from Обслуживание where ИД_оборудования = eq_id and Дата_снятия = null) != 0
$$;


ALTER FUNCTION public.eq_is_installed(eq_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Адреса; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Адреса" (
    "ИД" integer NOT NULL,
    "Префикс_улицы" character varying(20) DEFAULT 'улица'::character varying NOT NULL,
    "Улица" character varying(30) NOT NULL,
    "Дом" character varying(10) NOT NULL,
    "Помещение" character varying(20) NOT NULL,
    "Номер_телефона" character varying(7),
    CONSTRAINT "Адреса_Номер_телефона_check" CHECK ((translate(("Номер_телефона")::text, '0123456789-'::text, '9999999999-'::text) = '9-99-99'::text)),
    CONSTRAINT "Адреса_Префикс_улицы_check" CHECK ((("Префикс_улицы")::text = ANY (ARRAY[('улица'::character varying)::text, ('проспект'::character varying)::text, ('переулок'::character varying)::text])))
);


ALTER TABLE public."Адреса" OWNER TO postgres;

--
-- Name: get_address_by_class_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_address_by_class_id(class_id integer) RETURNS public."Адреса"
    LANGUAGE sql
    AS $$
	select * from Адреса where ИД = class_id
$$;


ALTER FUNCTION public.get_address_by_class_id(class_id integer) OWNER TO postgres;

--
-- Name: get_all_address(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_address() RETURNS public."Адреса"
    LANGUAGE sql
    AS $$
	select * from Адреса
$$;


ALTER FUNCTION public.get_all_address() OWNER TO postgres;

--
-- Name: Классы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Классы" (
    "ИД" integer NOT NULL,
    "Макс_количество_мест" integer NOT NULL,
    "ИД_ответств_кафедры" integer NOT NULL,
    "Примечание" character varying(1000),
    "Текущ_количество_мест" integer NOT NULL,
    CONSTRAINT "Классы_Макс_количество_мест_check" CHECK (("Макс_количество_мест" >= 0)),
    CONSTRAINT "Классы_Текущ_количество_мест_check" CHECK (("Текущ_количество_мест" >= 0))
);


ALTER TABLE public."Классы" OWNER TO postgres;

--
-- Name: get_all_classes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_classes() RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select * from Классы
$$;


ALTER FUNCTION public.get_all_classes() OWNER TO postgres;

--
-- Name: Оборудование; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Оборудование" (
    "ИД" integer NOT NULL,
    "ИД_типа_оборудования" integer NOT NULL,
    "Инвентарный_номер" numeric(10,0) NOT NULL,
    "Признак_исправности" numeric(1,0) NOT NULL,
    "Примечание" character varying(1000),
    CONSTRAINT "Оборудование_Признак_исправно_check" CHECK (("Признак_исправности" = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);


ALTER TABLE public."Оборудование" OWNER TO postgres;

--
-- Name: get_all_eq(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_eq() RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select * from Оборудование
$$;


ALTER FUNCTION public.get_all_eq() OWNER TO postgres;

--
-- Name: Типы_оборудований; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Типы_оборудований" (
    "ИД" integer NOT NULL,
    "Категория" character varying(20) NOT NULL,
    "Наименование" character varying(150) NOT NULL,
    "Характеристика" character varying(1000),
    CONSTRAINT "Типы_оборудований_Категория_check" CHECK ((("Категория")::text = ANY (ARRAY[('монитор'::character varying)::text, ('принтер'::character varying)::text, ('системный блок'::character varying)::text, ('материнская плата'::character varying)::text, ('процессор'::character varying)::text, ('сетевая карта'::character varying)::text, ('модуль памяти'::character varying)::text, ('ЖМД'::character varying)::text, ('привод CD'::character varying)::text, ('привод DVD'::character varying)::text, ('видеокарта'::character varying)::text, ('ГМД'::character varying)::text, ('прочее'::character varying)::text])))
);


ALTER TABLE public."Типы_оборудований" OWNER TO postgres;

--
-- Name: get_all_eq_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_eq_type() RETURNS public."Типы_оборудований"
    LANGUAGE sql
    AS $$
		select * from Типы_оборудований
$$;


ALTER FUNCTION public.get_all_eq_type() OWNER TO postgres;

--
-- Name: Учебные_места; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Учебные_места" (
    "ИД" integer NOT NULL,
    "ИД_класса" integer NOT NULL,
    "Номер_учебного_места" character varying(20) NOT NULL,
    "Имя_рабочей_станции" character varying(255),
    "ip_адрес" character varying(15),
    "Примечание" character varying(1000),
    CONSTRAINT "Учебные_места_check" CHECK ((("Имя_рабочей_станции" IS NOT NULL) OR ("ip_адрес" IS NOT NULL))),
    CONSTRAINT "Учебные_места_ip_адрес_check" CHECK ((translate(("ip_адрес")::text, '0123456789.'::text, '9999999999.'::text) = '999.999.999.999'::text))
);


ALTER TABLE public."Учебные_места" OWNER TO postgres;

--
-- Name: get_all_learn_places(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_learn_places() RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select * from Учебные_места
$$;


ALTER FUNCTION public.get_all_learn_places() OWNER TO postgres;

--
-- Name: Обслуживание; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Обслуживание" (
    "ИД" integer NOT NULL,
    "ИД_учебного_места" integer NOT NULL,
    "ИД_оборудования" integer NOT NULL,
    "Дата_установки" date NOT NULL,
    "Дата_снятия" date,
    CONSTRAINT "Обслуживание_check" CHECK (("Дата_установки" <= "Дата_снятия"))
);


ALTER TABLE public."Обслуживание" OWNER TO postgres;

--
-- Name: get_all_serv(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_serv() RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
$$;


ALTER FUNCTION public.get_all_serv() OWNER TO postgres;

--
-- Name: get_class_by_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_class_by_id(id integer) RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select * from Классы where Классы."ИД" = id
$$;


ALTER FUNCTION public.get_class_by_id(id integer) OWNER TO postgres;

--
-- Name: get_class_by_learn_place_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_class_by_learn_place_id(place_id integer) RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select Классы.*
	from Классы join Учебные_места on(ИД_класса = Классы."ИД")
	where Учебные_места."ИД" = place_id
$$;


ALTER FUNCTION public.get_class_by_learn_place_id(place_id integer) OWNER TO postgres;

--
-- Name: get_eq_by_serv_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eq_by_serv_id(serv_id integer) RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select Оборудование.*
	from Оборудование join Обслуживание on (ИД_оборудования =Оборудование."ИД")
	where Обслуживание."ИД" = serv_id
	
$$;


ALTER FUNCTION public.get_eq_by_serv_id(serv_id integer) OWNER TO postgres;

--
-- Name: get_eq_by_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eq_by_type(type_id integer) RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select * from Оборудование where ИД_типа_оборудования = type_id
$$;


ALTER FUNCTION public.get_eq_by_type(type_id integer) OWNER TO postgres;

--
-- Name: get_eqs_by_learn_place(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eqs_by_learn_place() RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select Оборудование.* from Оборудование join Обслуживание on (Обслуживание."ИД_оборудования" = Оборудование."ИД")
	where Обслуживание."Дата_снятия"  = null
$$;


ALTER FUNCTION public.get_eqs_by_learn_place() OWNER TO postgres;

--
-- Name: get_learn_place_by_eq_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_place_by_eq_id(eq_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
select Учебные_места.* from
	Обслуживание join Учебные_места on (Учебные_места.ИД = ИД_учебного_места)
	where ИД_оборудования = eq_id and Дата_снятия != NULL
$$;


ALTER FUNCTION public.get_learn_place_by_eq_id(eq_id integer) OWNER TO postgres;

--
-- Name: get_learn_place_by_serv_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_place_by_serv_id(serv_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select Учебные_места.* from Учебные_места join Обслуживание on (Учебные_места."ИД" = Обслуживание."ИД_учебного_места")
	where Обслуживание."ИД" = serv_id
$$;


ALTER FUNCTION public.get_learn_place_by_serv_id(serv_id integer) OWNER TO postgres;

--
-- Name: get_learn_places_by_class_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_places_by_class_id(class_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select * from Учебные_места where Учебные_места."ИД_класса" = class_id
$$;


ALTER FUNCTION public.get_learn_places_by_class_id(class_id integer) OWNER TO postgres;

--
-- Name: get_serv_by_eq_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_serv_by_eq_id(eq_id integer) RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
	where ИД_оборудования = eq_id
$$;


ALTER FUNCTION public.get_serv_by_eq_id(eq_id integer) OWNER TO postgres;

--
-- Name: get_serv_by_place_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_serv_by_place_id(place_id integer) RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
	where ИД_учебного_места = place_id
$$;


ALTER FUNCTION public.get_serv_by_place_id(place_id integer) OWNER TO postgres;

--
-- Name: install_eq(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer)
    LANGUAGE sql
    AS $$
	insert into Обслуживание (ИД_учебного_места, ИД_оборудования, Дата_установки)
	values (eq_id, place_id, CURRENT_DATE)
$$;


ALTER PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer) OWNER TO postgres;

--
-- Name: uninstall_eq(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.uninstall_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	update Обслуживание
	set Дата_снятия = current_date
	where ИД_оборудования = eq_id
	and Дата_снятия = null
$$;


ALTER PROCEDURE public.uninstall_eq(IN eq_id integer) OWNER TO postgres;

--
-- Name: update_address(integer, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying)
    LANGUAGE sql
    AS $$
	update Адреса
	set (Префикс_улицы, Улица,Дом,Помещение,Номер_телефона)=
	(new_pref, new_street, new_house, new_place, new_phone_number)
	where (ИД = address_id)
$$;


ALTER PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying) OWNER TO postgres;

--
-- Name: update_class(integer, integer, integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying)
    LANGUAGE sql
    AS $$
	update Классы
	set (Макс_количество_мест, ИД_ответств_кафедры, Примечание) = 
	(max_places, resp_id, note)
$$;


ALTER PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying) OWNER TO postgres;

--
-- Name: update_eq(integer, integer, numeric, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying)
    LANGUAGE sql
    AS $$
	update Оборудование
	set (ИД_типа_оборудования, Инвентарный_номер, Признак_исправности, Примечание) = 
	(new_eq_type_id, new_inv_num, is_ok, new_notes)
	where ИД = eq_id
$$;


ALTER PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying) OWNER TO postgres;

--
-- Name: update_eq_type(integer, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying)
    LANGUAGE sql
    AS $$
	update "Типы_оборудований" 
	set (Категория, Наименование, Характеристика) = 
	(new_category, new_name, new_characteristic)
	where ИД = id
$$;


ALTER PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying) OWNER TO postgres;

--
-- Name: Классы_ИД_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Классы_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Классы_ИД_seq" OWNER TO postgres;

--
-- Name: Классы_ИД_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Классы_ИД_seq" OWNED BY public."Классы"."ИД";


--
-- Name: Оборудование_ИД_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Оборудование_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Оборудование_ИД_seq" OWNER TO postgres;

--
-- Name: Оборудование_ИД_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Оборудование_ИД_seq" OWNED BY public."Оборудование"."ИД";


--
-- Name: Обслуживание_ИД_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Обслуживание_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Обслуживание_ИД_seq" OWNER TO postgres;

--
-- Name: Обслуживание_ИД_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Обслуживание_ИД_seq" OWNED BY public."Обслуживание"."ИД";


--
-- Name: Типы_оборудований_ИД_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Типы_оборудований_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Типы_оборудований_ИД_seq" OWNER TO postgres;

--
-- Name: Типы_оборудований_ИД_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Типы_оборудований_ИД_seq" OWNED BY public."Типы_оборудований"."ИД";


--
-- Name: Учебные_места_ИД_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Учебные_места_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Учебные_места_ИД_seq" OWNER TO postgres;

--
-- Name: Учебные_места_ИД_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Учебные_места_ИД_seq" OWNED BY public."Учебные_места"."ИД";


--
-- Name: Классы ИД; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Классы" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Классы_ИД_seq"'::regclass);


--
-- Name: Оборудование ИД; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оборудование" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Оборудование_ИД_seq"'::regclass);


--
-- Name: Обслуживание ИД; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Обслуживание" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Обслуживание_ИД_seq"'::regclass);


--
-- Name: Типы_оборудований ИД; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Типы_оборудований" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Типы_оборудований_ИД_seq"'::regclass);


--
-- Name: Учебные_места ИД; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Учебные_места" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Учебные_места_ИД_seq"'::regclass);


--
-- Data for Name: Адреса; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Адреса" ("ИД", "Префикс_улицы", "Улица", "Дом", "Помещение", "Номер_телефона") FROM stdin;
5	улица	Пушкина	21	Имеется	0-00-00
7	улица	Пушкина	21	другое	0-00-00
1	улица	Пушкина	52	12	9-23-14
\.


--
-- Data for Name: Классы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Классы" ("ИД", "Макс_количество_мест", "ИД_ответств_кафедры", "Примечание", "Текущ_количество_мест") FROM stdin;
1	10	10	asd	23
\.


--
-- Data for Name: Оборудование; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Оборудование" ("ИД", "ИД_типа_оборудования", "Инвентарный_номер", "Признак_исправности", "Примечание") FROM stdin;
\.


--
-- Data for Name: Обслуживание; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Обслуживание" ("ИД", "ИД_учебного_места", "ИД_оборудования", "Дата_установки", "Дата_снятия") FROM stdin;
\.


--
-- Data for Name: Типы_оборудований; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Типы_оборудований" ("ИД", "Категория", "Наименование", "Характеристика") FROM stdin;
4	принтер	принтер	asd
5	принтер	крутой принтер	asd
7	принтер	крутой принтер1	asd
8	принтер	крутой принтер2	asd
9	принтер	крутой принтер3	asd
10	принтер	крутой принтер4	asd
\.


--
-- Data for Name: Учебные_места; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Учебные_места" ("ИД", "ИД_класса", "Номер_учебного_места", "Имя_рабочей_станции", "ip_адрес", "Примечание") FROM stdin;
\.


--
-- Name: Классы_ИД_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Классы_ИД_seq"', 1, true);


--
-- Name: Оборудование_ИД_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Оборудование_ИД_seq"', 2, true);


--
-- Name: Обслуживание_ИД_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Обслуживание_ИД_seq"', 1, false);


--
-- Name: Типы_оборудований_ИД_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Типы_оборудований_ИД_seq"', 19, true);


--
-- Name: Учебные_места_ИД_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Учебные_места_ИД_seq"', 1, false);


--
-- Name: Адреса Адреса_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Адреса"
    ADD CONSTRAINT "Адреса_pkey" PRIMARY KEY ("ИД");


--
-- Name: Классы Классы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Классы"
    ADD CONSTRAINT "Классы_pkey" PRIMARY KEY ("ИД");


--
-- Name: Оборудование Оборудование_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оборудование"
    ADD CONSTRAINT "Оборудование_pkey" PRIMARY KEY ("ИД");


--
-- Name: Обслуживание Обслуживание_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_pkey" PRIMARY KEY ("ИД");


--
-- Name: Типы_оборудований Типы_оборудований_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Типы_оборудований"
    ADD CONSTRAINT "Типы_оборудований_pkey" PRIMARY KEY ("ИД");


--
-- Name: Учебные_места Учебные_места_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Учебные_места"
    ADD CONSTRAINT "Учебные_места_pkey" PRIMARY KEY ("ИД");


--
-- Name: Адреса_УК; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Адреса_УК" ON public."Адреса" USING btree ("Улица", "Дом", "Помещение");


--
-- Name: Оборудование_УК; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Оборудование_УК" ON public."Оборудование" USING btree ("Инвентарный_номер");


--
-- Name: Обслуживание_УК1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Обслуживание_УК1" ON public."Обслуживание" USING btree ("ИД_оборудования", "Дата_установки");


--
-- Name: Обслуживание_УК2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Обслуживание_УК2" ON public."Обслуживание" USING btree ("ИД_учебного_места", "Дата_установки");


--
-- Name: Типы_оборудований_УК; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Типы_оборудований_УК" ON public."Типы_оборудований" USING btree ("Категория", "Наименование");


--
-- Name: Учебное_место_УК1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Учебное_место_УК1" ON public."Учебные_места" USING btree ("ИД_класса", "Имя_рабочей_станции");


--
-- Name: Учебное_место_УК2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Учебное_место_УК2" ON public."Учебные_места" USING btree ("ИД_класса", "ip_адрес");


--
-- Name: обслуживание_дата_снятия_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "обслуживание_дата_снятия_idx" ON public."Обслуживание" USING btree ("ИД_оборудования") WHERE ("Дата_снятия" <> NULL::date);


--
-- Name: Классы Классы_ИД_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Классы"
    ADD CONSTRAINT "Классы_ИД_fkey" FOREIGN KEY ("ИД") REFERENCES public."Адреса"("ИД");


--
-- Name: Оборудование Оборудование_ИД_типа_оборудова_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Оборудование"
    ADD CONSTRAINT "Оборудование_ИД_типа_оборудова_fkey" FOREIGN KEY ("ИД_типа_оборудования") REFERENCES public."Типы_оборудований"("ИД");


--
-- Name: Обслуживание Обслуживание_ИД_оборудования_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_ИД_оборудования_fkey" FOREIGN KEY ("ИД_оборудования") REFERENCES public."Оборудование"("ИД");


--
-- Name: Обслуживание Обслуживание_ИД_учебного_места_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_ИД_учебного_места_fkey" FOREIGN KEY ("ИД_учебного_места") REFERENCES public."Учебные_места"("ИД") ON DELETE CASCADE;


--
-- Name: Учебные_места Учебные_места_ИД_класса_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Учебные_места"
    ADD CONSTRAINT "Учебные_места_ИД_класса_fkey" FOREIGN KEY ("ИД_класса") REFERENCES public."Классы"("ИД") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

