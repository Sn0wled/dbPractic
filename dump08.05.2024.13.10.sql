toc.dat                                                                                             0000600 0004000 0002000 00000114323 14616666353 0014463 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   #                    |            pract    16.2    16.2 V               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    24922    pract    DATABASE     y   CREATE DATABASE pract WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE pract;
                postgres    false                    1255    41249 �   add_class(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     t  CREATE PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying)
    LANGUAGE sql
    AS $$
	begin;
		insert into Классы (Макс_количество_мест, ИД_ответств_кафедры, Примечание, Текущ_количество_мест)
		values (max_places, resp_id, note, 0);
		insert into Адреса
		values (lastval(), a_pref, a_street, a_house, a_place, a_phone_number);
	commit;
$$;
   DROP PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying);
       public          postgres    false         �            1255    41147 D   add_eq_type(character varying, character varying, character varying) 	   PROCEDURE     H  CREATE PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying)
    LANGUAGE sql
    AS $$
	insert into Типы_оборудований
	(Категория, Наименование, Характеристика)
	values (category, name, characteristic)
$$;
 �   DROP PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying);
       public          postgres    false                    1255    41256 d   add_learn_place(integer, character varying, character varying, character varying, character varying) 	   PROCEDURE     {  CREATE PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying)
    LANGUAGE sql
    AS $$
	begin;
		update Классы set Текущ_количество_мест = Текущ_количество_мест + 1 where Классы."ИД" = class_id;
		insert into Учебные_места (ИД_класса, Номер_учебного_места, Имя_рабочей_станции, ip_адрес, Примечание)
		values (class_id, place_num, workstation_name, id_address, note);
	commit;
$$;
 �   DROP PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying);
       public          postgres    false                    1255    41230    del_class(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.del_class(IN class_id integer)
    LANGUAGE sql
    AS $$
	delete from Классы
	where Классы."ИД" = class_id;
	delete from Адреса
	where Адреса."ИД" = class_id;
$$;
 6   DROP PROCEDURE public.del_class(IN class_id integer);
       public          postgres    false         �            1255    41215    del_eq(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.del_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	delete from Оборудование
	where ИД = eq_id
$$;
 0   DROP PROCEDURE public.del_eq(IN eq_id integer);
       public          postgres    false         �            1255    41148    del_eq_type(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.del_eq_type(IN id integer)
    LANGUAGE sql
    AS $$
	delete from Типы_оборудований where ИД = id
$$;
 2   DROP PROCEDURE public.del_eq_type(IN id integer);
       public          postgres    false         	           1255    41259    del_learn_place(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.del_learn_place(IN learn_place_id integer)
    LANGUAGE sql
    AS $$
	begin;
		update Классы set Текущ_количество_мест = Текущ_количество_мест - 1
		where ИД = (select Учебные_места."ИД_класса"  from Учебные_места where Учебные_места."ИД" = learn_place_id);
		delete from Учебные_места where Учебные_места."ИД" = learn_place_id;
	commit;
$$;
 B   DROP PROCEDURE public.del_learn_place(IN learn_place_id integer);
       public          postgres    false         �            1255    41149    eq_is_installed(integer)    FUNCTION     �   CREATE FUNCTION public.eq_is_installed(eq_id integer) RETURNS boolean
    LANGUAGE sql
    AS $$
	select (select count(*) from Обслуживание where ИД_оборудования = eq_id and Дата_снятия = null) != 0
$$;
 5   DROP FUNCTION public.eq_is_installed(eq_id integer);
       public          postgres    false         �            1259    25072    Адреса    TABLE     5  CREATE TABLE public."Адреса" (
    "ИД" integer NOT NULL,
    "Префикс_улицы" character varying(20) DEFAULT 'улица'::character varying NOT NULL,
    "Улица" character varying(30) NOT NULL,
    "Дом" character varying(10) NOT NULL,
    "Помещение" character varying(20) NOT NULL,
    "Номер_телефона" character varying(7),
    CONSTRAINT "Адреса_Номер_телефона_check" CHECK ((translate(("Номер_телефона")::text, '0123456789-'::text, '9999999999-'::text) = '9-99-99'::text)),
    CONSTRAINT "Адреса_Префикс_улицы_check" CHECK ((("Префикс_улицы")::text = ANY (ARRAY[('улица'::character varying)::text, ('проспект'::character varying)::text, ('переулок'::character varying)::text])))
);
 "   DROP TABLE public."Адреса";
       public         heap    postgres    false         �            1255    41224     get_address_by_class_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_address_by_class_id(class_id integer) RETURNS public."Адреса"
    LANGUAGE sql
    AS $$
	select * from Адреса where ИД = class_id
$$;
 @   DROP FUNCTION public.get_address_by_class_id(class_id integer);
       public          postgres    false    215         �            1255    41223    get_all_address()    FUNCTION     �   CREATE FUNCTION public.get_all_address() RETURNS public."Адреса"
    LANGUAGE sql
    AS $$
	select * from Адреса
$$;
 (   DROP FUNCTION public.get_all_address();
       public          postgres    false    215         �            1259    25080    Классы    TABLE     A  CREATE TABLE public."Классы" (
    "ИД" integer NOT NULL,
    "Макс_количество_мест" integer NOT NULL,
    "ИД_ответств_кафедры" integer NOT NULL,
    "Примечание" character varying(1000),
    "Текущ_количество_мест" integer NOT NULL,
    CONSTRAINT "Классы_Макс_количество_мест_check" CHECK (("Макс_количество_мест" >= 0)),
    CONSTRAINT "Классы_Текущ_количество_мест_check" CHECK (("Текущ_количество_мест" >= 0))
);
 "   DROP TABLE public."Классы";
       public         heap    postgres    false                    1255    41227    get_all_classes()    FUNCTION     �   CREATE FUNCTION public.get_all_classes() RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select * from Классы
$$;
 (   DROP FUNCTION public.get_all_classes();
       public          postgres    false    216         �            1259    25089    Оборудование    TABLE     �  CREATE TABLE public."Оборудование" (
    "ИД" integer NOT NULL,
    "ИД_типа_оборудования" integer NOT NULL,
    "Инвентарный_номер" numeric(10,0) NOT NULL,
    "Признак_исправности" numeric(1,0) NOT NULL,
    "Примечание" character varying(1000),
    CONSTRAINT "Оборудование_Признак_исправно_check" CHECK (("Признак_исправности" = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);
 .   DROP TABLE public."Оборудование";
       public         heap    postgres    false         �            1255    41209    get_all_eq()    FUNCTION     �   CREATE FUNCTION public.get_all_eq() RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select * from Оборудование
$$;
 #   DROP FUNCTION public.get_all_eq();
       public          postgres    false    217         �            1259    25103 !   Типы_оборудований    TABLE     
  CREATE TABLE public."Типы_оборудований" (
    "ИД" integer NOT NULL,
    "Категория" character varying(20) NOT NULL,
    "Наименование" character varying(150) NOT NULL,
    "Характеристика" character varying(1000),
    CONSTRAINT "Типы_оборудований_Категория_check" CHECK ((("Категория")::text = ANY (ARRAY[('монитор'::character varying)::text, ('принтер'::character varying)::text, ('системный блок'::character varying)::text, ('материнская плата'::character varying)::text, ('процессор'::character varying)::text, ('сетевая карта'::character varying)::text, ('модуль памяти'::character varying)::text, ('ЖМД'::character varying)::text, ('привод CD'::character varying)::text, ('привод DVD'::character varying)::text, ('видеокарта'::character varying)::text, ('ГМД'::character varying)::text, ('прочее'::character varying)::text])))
);
 7   DROP TABLE public."Типы_оборудований";
       public         heap    postgres    false         �            1255    41150    get_all_eq_type()    FUNCTION     �   CREATE FUNCTION public.get_all_eq_type() RETURNS public."Типы_оборудований"
    LANGUAGE sql
    AS $$
		select * from Типы_оборудований
$$;
 (   DROP FUNCTION public.get_all_eq_type();
       public          postgres    false    219         �            1259    25112    Учебные_места    TABLE     �  CREATE TABLE public."Учебные_места" (
    "ИД" integer NOT NULL,
    "ИД_класса" integer NOT NULL,
    "Номер_учебного_места" character varying(20) NOT NULL,
    "Имя_рабочей_станции" character varying(255),
    "ip_адрес" character varying(15),
    "Примечание" character varying(1000),
    CONSTRAINT "Учебные_места_check" CHECK ((("Имя_рабочей_станции" IS NOT NULL) OR ("ip_адрес" IS NOT NULL))),
    CONSTRAINT "Учебные_места_ip_адрес_check" CHECK ((translate(("ip_адрес")::text, '0123456789.'::text, '9999999999.'::text) = '999.999.999.999'::text))
);
 /   DROP TABLE public."Учебные_места";
       public         heap    postgres    false                    1255    41253    get_all_learn_places()    FUNCTION     �   CREATE FUNCTION public.get_all_learn_places() RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select * from Учебные_места
$$;
 -   DROP FUNCTION public.get_all_learn_places();
       public          postgres    false    220         �            1259    25097    Обслуживание    TABLE     �  CREATE TABLE public."Обслуживание" (
    "ИД" integer NOT NULL,
    "ИД_учебного_места" integer NOT NULL,
    "ИД_оборудования" integer NOT NULL,
    "Дата_установки" date NOT NULL,
    "Дата_снятия" date,
    CONSTRAINT "Обслуживание_check" CHECK (("Дата_установки" <= "Дата_снятия"))
);
 .   DROP TABLE public."Обслуживание";
       public         heap    postgres    false         �            1255    41217    get_all_serv()    FUNCTION     �   CREATE FUNCTION public.get_all_serv() RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
$$;
 %   DROP FUNCTION public.get_all_serv();
       public          postgres    false    218                    1255    41229    get_class_by_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_class_by_id(id integer) RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select * from Классы where Классы."ИД" = id
$$;
 2   DROP FUNCTION public.get_class_by_id(id integer);
       public          postgres    false    216                    1255    41228 $   get_class_by_learn_place_id(integer)    FUNCTION     *  CREATE FUNCTION public.get_class_by_learn_place_id(place_id integer) RETURNS public."Классы"
    LANGUAGE sql
    AS $$
	select Классы.*
	from Классы join Учебные_места on(ИД_класса = Классы."ИД")
	where Учебные_места."ИД" = place_id
$$;
 D   DROP FUNCTION public.get_class_by_learn_place_id(place_id integer);
       public          postgres    false    216         �            1255    41216    get_eq_by_serv_id(integer)    FUNCTION     Z  CREATE FUNCTION public.get_eq_by_serv_id(serv_id integer) RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select Оборудование.*
	from Оборудование join Обслуживание on (ИД_оборудования =Оборудование."ИД")
	where Обслуживание."ИД" = serv_id
	
$$;
 9   DROP FUNCTION public.get_eq_by_serv_id(serv_id integer);
       public          postgres    false    217         �            1255    41210    get_eq_by_type(integer)    FUNCTION     �   CREATE FUNCTION public.get_eq_by_type(type_id integer) RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select * from Оборудование where ИД_типа_оборудования = type_id
$$;
 6   DROP FUNCTION public.get_eq_by_type(type_id integer);
       public          postgres    false    217                    1255    41252    get_eqs_by_learn_place()    FUNCTION     x  CREATE FUNCTION public.get_eqs_by_learn_place() RETURNS public."Оборудование"
    LANGUAGE sql
    AS $$
	select Оборудование.* from Оборудование join Обслуживание on (Обслуживание."ИД_оборудования" = Оборудование."ИД")
	where Обслуживание."Дата_снятия"  = null
$$;
 /   DROP FUNCTION public.get_eqs_by_learn_place();
       public          postgres    false    217         �            1255    41213 !   get_learn_place_by_eq_id(integer)    FUNCTION     �  CREATE FUNCTION public.get_learn_place_by_eq_id(eq_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
select Учебные_места.* from
	Обслуживание join Учебные_места on (Учебные_места.ИД = ИД_учебного_места)
	where ИД_оборудования = eq_id and Дата_снятия != NULL
$$;
 >   DROP FUNCTION public.get_learn_place_by_eq_id(eq_id integer);
       public          postgres    false    220         
           1255    41260 #   get_learn_place_by_serv_id(integer)    FUNCTION     �  CREATE FUNCTION public.get_learn_place_by_serv_id(serv_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select Учебные_места.* from Учебные_места join Обслуживание on (Учебные_места."ИД" = Обслуживание."ИД_учебного_места")
	where Обслуживание."ИД" = serv_id
$$;
 B   DROP FUNCTION public.get_learn_place_by_serv_id(serv_id integer);
       public          postgres    false    220                    1255    41251 %   get_learn_places_by_class_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_learn_places_by_class_id(class_id integer) RETURNS public."Учебные_места"
    LANGUAGE sql
    AS $$
	select * from Учебные_места where Учебные_места."ИД_класса" = class_id
$$;
 E   DROP FUNCTION public.get_learn_places_by_class_id(class_id integer);
       public          postgres    false    220         �            1255    41221    get_serv_by_eq_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_serv_by_eq_id(eq_id integer) RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
	where ИД_оборудования = eq_id
$$;
 7   DROP FUNCTION public.get_serv_by_eq_id(eq_id integer);
       public          postgres    false    218         �            1255    41222    get_serv_by_place_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_serv_by_place_id(place_id integer) RETURNS public."Обслуживание"
    LANGUAGE sql
    AS $$
	select * from Обслуживание
	where ИД_учебного_места = place_id
$$;
 =   DROP FUNCTION public.get_serv_by_place_id(place_id integer);
       public          postgres    false    218         �            1255    41218    install_eq(integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer)
    LANGUAGE sql
    AS $$
	insert into Обслуживание (ИД_учебного_места, ИД_оборудования, Дата_установки)
	values (eq_id, place_id, CURRENT_DATE)
$$;
 I   DROP PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer);
       public          postgres    false         �            1255    41220    uninstall_eq(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.uninstall_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	update Обслуживание
	set Дата_снятия = current_date
	where ИД_оборудования = eq_id
	and Дата_снятия = null
$$;
 6   DROP PROCEDURE public.uninstall_eq(IN eq_id integer);
       public          postgres    false                     1255    41226 v   update_address(integer, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying)
    LANGUAGE sql
    AS $$
	update Адреса
	set (Префикс_улицы, Улица,Дом,Помещение,Номер_телефона)=
	(new_pref, new_street, new_house, new_place, new_phone_number)
	where (ИД = address_id)
$$;
 �   DROP PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying);
       public          postgres    false         �            1255    41250 :   update_class(integer, integer, integer, character varying) 	   PROCEDURE     B  CREATE PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying)
    LANGUAGE sql
    AS $$
	update Классы
	set (Макс_количество_мест, ИД_ответств_кафедры, Примечание) = 
	(max_places, resp_id, note)
$$;
    DROP PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying);
       public          postgres    false         �            1255    41214 @   update_eq(integer, integer, numeric, numeric, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying)
    LANGUAGE sql
    AS $$
	update Оборудование
	set (ИД_типа_оборудования, Инвентарный_номер, Признак_исправности, Примечание) = 
	(new_eq_type_id, new_inv_num, is_ok, new_notes)
	where ИД = eq_id
$$;
 �   DROP PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying);
       public          postgres    false         �            1255    41151 P   update_eq_type(integer, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying)
    LANGUAGE sql
    AS $$
	update "Типы_оборудований" 
	set (Категория, Наименование, Характеристика) = 
	(new_category, new_name, new_characteristic)
	where ИД = id
$$;
 �   DROP PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying);
       public          postgres    false         �            1259    41153    Классы_ИД_seq    SEQUENCE     �   CREATE SEQUENCE public."Классы_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Классы_ИД_seq";
       public          postgres    false    216                    0    0    Классы_ИД_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Классы_ИД_seq" OWNED BY public."Классы"."ИД";
          public          postgres    false    221         �            1259    41154 !   Оборудование_ИД_seq    SEQUENCE     �   CREATE SEQUENCE public."Оборудование_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Оборудование_ИД_seq";
       public          postgres    false    217                    0    0 !   Оборудование_ИД_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Оборудование_ИД_seq" OWNED BY public."Оборудование"."ИД";
          public          postgres    false    222         �            1259    41155 !   Обслуживание_ИД_seq    SEQUENCE     �   CREATE SEQUENCE public."Обслуживание_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."Обслуживание_ИД_seq";
       public          postgres    false    218                    0    0 !   Обслуживание_ИД_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."Обслуживание_ИД_seq" OWNED BY public."Обслуживание"."ИД";
          public          postgres    false    223         �            1259    41156 *   Типы_оборудований_ИД_seq    SEQUENCE     �   CREATE SEQUENCE public."Типы_оборудований_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public."Типы_оборудований_ИД_seq";
       public          postgres    false    219                    0    0 *   Типы_оборудований_ИД_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Типы_оборудований_ИД_seq" OWNED BY public."Типы_оборудований"."ИД";
          public          postgres    false    224         �            1259    41157 "   Учебные_места_ИД_seq    SEQUENCE     �   CREATE SEQUENCE public."Учебные_места_ИД_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."Учебные_места_ИД_seq";
       public          postgres    false    220                    0    0 "   Учебные_места_ИД_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."Учебные_места_ИД_seq" OWNED BY public."Учебные_места"."ИД";
          public          postgres    false    225         R           2604    41159    Классы ИД    DEFAULT     |   ALTER TABLE ONLY public."Классы" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Классы_ИД_seq"'::regclass);
 D   ALTER TABLE public."Классы" ALTER COLUMN "ИД" DROP DEFAULT;
       public          postgres    false    221    216         S           2604    41160    Оборудование ИД    DEFAULT     �   ALTER TABLE ONLY public."Оборудование" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Оборудование_ИД_seq"'::regclass);
 P   ALTER TABLE public."Оборудование" ALTER COLUMN "ИД" DROP DEFAULT;
       public          postgres    false    222    217         T           2604    41161    Обслуживание ИД    DEFAULT     �   ALTER TABLE ONLY public."Обслуживание" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Обслуживание_ИД_seq"'::regclass);
 P   ALTER TABLE public."Обслуживание" ALTER COLUMN "ИД" DROP DEFAULT;
       public          postgres    false    223    218         U           2604    41162 &   Типы_оборудований ИД    DEFAULT     �   ALTER TABLE ONLY public."Типы_оборудований" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Типы_оборудований_ИД_seq"'::regclass);
 Y   ALTER TABLE public."Типы_оборудований" ALTER COLUMN "ИД" DROP DEFAULT;
       public          postgres    false    224    219         V           2604    41163    Учебные_места ИД    DEFAULT     �   ALTER TABLE ONLY public."Учебные_места" ALTER COLUMN "ИД" SET DEFAULT nextval('public."Учебные_места_ИД_seq"'::regclass);
 Q   ALTER TABLE public."Учебные_места" ALTER COLUMN "ИД" DROP DEFAULT;
       public          postgres    false    225    220                   0    25072    Адреса 
   TABLE DATA           �   COPY public."Адреса" ("ИД", "Префикс_улицы", "Улица", "Дом", "Помещение", "Номер_телефона") FROM stdin;
    public          postgres    false    215       4872.dat 	          0    25080    Классы 
   TABLE DATA           �   COPY public."Классы" ("ИД", "Макс_количество_мест", "ИД_ответств_кафедры", "Примечание", "Текущ_количество_мест") FROM stdin;
    public          postgres    false    216       4873.dat 
          0    25089    Оборудование 
   TABLE DATA           �   COPY public."Оборудование" ("ИД", "ИД_типа_оборудования", "Инвентарный_номер", "Признак_исправности", "Примечание") FROM stdin;
    public          postgres    false    217       4874.dat           0    25097    Обслуживание 
   TABLE DATA           �   COPY public."Обслуживание" ("ИД", "ИД_учебного_места", "ИД_оборудования", "Дата_установки", "Дата_снятия") FROM stdin;
    public          postgres    false    218       4875.dat           0    25103 !   Типы_оборудований 
   TABLE DATA           �   COPY public."Типы_оборудований" ("ИД", "Категория", "Наименование", "Характеристика") FROM stdin;
    public          postgres    false    219       4876.dat           0    25112    Учебные_места 
   TABLE DATA           �   COPY public."Учебные_места" ("ИД", "ИД_класса", "Номер_учебного_места", "Имя_рабочей_станции", "ip_адрес", "Примечание") FROM stdin;
    public          postgres    false    220       4877.dat            0    0    Классы_ИД_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Классы_ИД_seq"', 1, true);
          public          postgres    false    221                    0    0 !   Оборудование_ИД_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Оборудование_ИД_seq"', 2, true);
          public          postgres    false    222                     0    0 !   Обслуживание_ИД_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Обслуживание_ИД_seq"', 1, false);
          public          postgres    false    223         !           0    0 *   Типы_оборудований_ИД_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."Типы_оборудований_ИД_seq"', 19, true);
          public          postgres    false    224         "           0    0 "   Учебные_места_ИД_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Учебные_места_ИД_seq"', 1, false);
          public          postgres    false    225         a           2606    41233    Адреса Адреса_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Адреса"
    ADD CONSTRAINT "Адреса_pkey" PRIMARY KEY ("ИД");
 L   ALTER TABLE ONLY public."Адреса" DROP CONSTRAINT "Адреса_pkey";
       public            postgres    false    215         d           2606    41167    Классы Классы_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Классы"
    ADD CONSTRAINT "Классы_pkey" PRIMARY KEY ("ИД");
 L   ALTER TABLE ONLY public."Классы" DROP CONSTRAINT "Классы_pkey";
       public            postgres    false    216         f           2606    41169 6   Оборудование Оборудование_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Оборудование"
    ADD CONSTRAINT "Оборудование_pkey" PRIMARY KEY ("ИД");
 d   ALTER TABLE ONLY public."Оборудование" DROP CONSTRAINT "Оборудование_pkey";
       public            postgres    false    217         i           2606    41171 6   Обслуживание Обслуживание_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_pkey" PRIMARY KEY ("ИД");
 d   ALTER TABLE ONLY public."Обслуживание" DROP CONSTRAINT "Обслуживание_pkey";
       public            postgres    false    218         n           2606    41173 H   Типы_оборудований Типы_оборудований_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Типы_оборудований"
    ADD CONSTRAINT "Типы_оборудований_pkey" PRIMARY KEY ("ИД");
 v   ALTER TABLE ONLY public."Типы_оборудований" DROP CONSTRAINT "Типы_оборудований_pkey";
       public            postgres    false    219         s           2606    41175 8   Учебные_места Учебные_места_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Учебные_места"
    ADD CONSTRAINT "Учебные_места_pkey" PRIMARY KEY ("ИД");
 f   ALTER TABLE ONLY public."Учебные_места" DROP CONSTRAINT "Учебные_места_pkey";
       public            postgres    false    220         b           1259    41176    Адреса_УК    INDEX     }   CREATE UNIQUE INDEX "Адреса_УК" ON public."Адреса" USING btree ("Улица", "Дом", "Помещение");
 '   DROP INDEX public."Адреса_УК";
       public            postgres    false    215    215    215         g           1259    41177    Оборудование_УК    INDEX     �   CREATE UNIQUE INDEX "Оборудование_УК" ON public."Оборудование" USING btree ("Инвентарный_номер");
 3   DROP INDEX public."Оборудование_УК";
       public            postgres    false    217         j           1259    41178    Обслуживание_УК1    INDEX     �   CREATE UNIQUE INDEX "Обслуживание_УК1" ON public."Обслуживание" USING btree ("ИД_оборудования", "Дата_установки");
 4   DROP INDEX public."Обслуживание_УК1";
       public            postgres    false    218    218         k           1259    41179    Обслуживание_УК2    INDEX     �   CREATE UNIQUE INDEX "Обслуживание_УК2" ON public."Обслуживание" USING btree ("ИД_учебного_места", "Дата_установки");
 4   DROP INDEX public."Обслуживание_УК2";
       public            postgres    false    218    218         o           1259    41180 &   Типы_оборудований_УК    INDEX     �   CREATE UNIQUE INDEX "Типы_оборудований_УК" ON public."Типы_оборудований" USING btree ("Категория", "Наименование");
 <   DROP INDEX public."Типы_оборудований_УК";
       public            postgres    false    219    219         p           1259    41181    Учебное_место_УК1    INDEX     �   CREATE UNIQUE INDEX "Учебное_место_УК1" ON public."Учебные_места" USING btree ("ИД_класса", "Имя_рабочей_станции");
 5   DROP INDEX public."Учебное_место_УК1";
       public            postgres    false    220    220         q           1259    41182    Учебное_место_УК2    INDEX     �   CREATE UNIQUE INDEX "Учебное_место_УК2" ON public."Учебные_места" USING btree ("ИД_класса", "ip_адрес");
 5   DROP INDEX public."Учебное_место_УК2";
       public            postgres    false    220    220         l           1259    41183 2   обслуживание_дата_снятия_idx    INDEX     �   CREATE UNIQUE INDEX "обслуживание_дата_снятия_idx" ON public."Обслуживание" USING btree ("ИД_оборудования") WHERE ("Дата_снятия" <> NULL::date);
 H   DROP INDEX public."обслуживание_дата_снятия_idx";
       public            postgres    false    218    218         t           2606    41234 #   Классы Классы_ИД_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Классы"
    ADD CONSTRAINT "Классы_ИД_fkey" FOREIGN KEY ("ИД") REFERENCES public."Адреса"("ИД");
 Q   ALTER TABLE ONLY public."Классы" DROP CONSTRAINT "Классы_ИД_fkey";
       public          postgres    false    216    4705    215         u           2606    41189 W   Оборудование Оборудование_ИД_типа_оборудова_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Оборудование"
    ADD CONSTRAINT "Оборудование_ИД_типа_оборудова_fkey" FOREIGN KEY ("ИД_типа_оборудования") REFERENCES public."Типы_оборудований"("ИД");
 �   ALTER TABLE ONLY public."Оборудование" DROP CONSTRAINT "Оборудование_ИД_типа_оборудова_fkey";
       public          postgres    false    4718    219    217         v           2606    41194 T   Обслуживание Обслуживание_ИД_оборудования_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_ИД_оборудования_fkey" FOREIGN KEY ("ИД_оборудования") REFERENCES public."Оборудование"("ИД");
 �   ALTER TABLE ONLY public."Обслуживание" DROP CONSTRAINT "Обслуживание_ИД_оборудования_fkey";
       public          postgres    false    217    4710    218         w           2606    41199 W   Обслуживание Обслуживание_ИД_учебного_места_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."Обслуживание"
    ADD CONSTRAINT "Обслуживание_ИД_учебного_места_fkey" FOREIGN KEY ("ИД_учебного_места") REFERENCES public."Учебные_места"("ИД") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."Обслуживание" DROP CONSTRAINT "Обслуживание_ИД_учебного_места_fkey";
       public          postgres    false    220    218    4723         x           2606    41204 J   Учебные_места Учебные_места_ИД_класса_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Учебные_места"
    ADD CONSTRAINT "Учебные_места_ИД_класса_fkey" FOREIGN KEY ("ИД_класса") REFERENCES public."Классы"("ИД") ON DELETE CASCADE;
 x   ALTER TABLE ONLY public."Учебные_места" DROP CONSTRAINT "Учебные_места_ИД_класса_fkey";
       public          postgres    false    4708    220    216                                                                                                                                                                                                                                                                                                                     4872.dat                                                                                            0000600 0004000 0002000 00000000231 14616666353 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	улица	Пушкина	21	Имеется	0-00-00
7	улица	Пушкина	21	другое	0-00-00
1	улица	Пушкина	52	12	9-23-14
\.


                                                                                                                                                                                                                                                                                                                                                                       4873.dat                                                                                            0000600 0004000 0002000 00000000024 14616666353 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	10	10	asd	23
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            4874.dat                                                                                            0000600 0004000 0002000 00000000005 14616666353 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4875.dat                                                                                            0000600 0004000 0002000 00000000005 14616666353 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4876.dat                                                                                            0000600 0004000 0002000 00000000443 14616666353 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	принтер	принтер	asd
5	принтер	крутой принтер	asd
7	принтер	крутой принтер1	asd
8	принтер	крутой принтер2	asd
9	принтер	крутой принтер3	asd
10	принтер	крутой принтер4	asd
\.


                                                                                                                                                                                                                             4877.dat                                                                                            0000600 0004000 0002000 00000000005 14616666353 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000103641 14616666353 0015411 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
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

DROP DATABASE pract;
--
-- Name: pract; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pract WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE pract OWNER TO postgres;

\connect pract

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
\.
COPY public."Адреса" ("ИД", "Префикс_улицы", "Улица", "Дом", "Помещение", "Номер_телефона") FROM '$$PATH$$/4872.dat';

--
-- Data for Name: Классы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Классы" ("ИД", "Макс_количество_мест", "ИД_ответств_кафедры", "Примечание", "Текущ_количество_мест") FROM stdin;
\.
COPY public."Классы" ("ИД", "Макс_количество_мест", "ИД_ответств_кафедры", "Примечание", "Текущ_количество_мест") FROM '$$PATH$$/4873.dat';

--
-- Data for Name: Оборудование; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Оборудование" ("ИД", "ИД_типа_оборудования", "Инвентарный_номер", "Признак_исправности", "Примечание") FROM stdin;
\.
COPY public."Оборудование" ("ИД", "ИД_типа_оборудования", "Инвентарный_номер", "Признак_исправности", "Примечание") FROM '$$PATH$$/4874.dat';

--
-- Data for Name: Обслуживание; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Обслуживание" ("ИД", "ИД_учебного_места", "ИД_оборудования", "Дата_установки", "Дата_снятия") FROM stdin;
\.
COPY public."Обслуживание" ("ИД", "ИД_учебного_места", "ИД_оборудования", "Дата_установки", "Дата_снятия") FROM '$$PATH$$/4875.dat';

--
-- Data for Name: Типы_оборудований; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Типы_оборудований" ("ИД", "Категория", "Наименование", "Характеристика") FROM stdin;
\.
COPY public."Типы_оборудований" ("ИД", "Категория", "Наименование", "Характеристика") FROM '$$PATH$$/4876.dat';

--
-- Data for Name: Учебные_места; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Учебные_места" ("ИД", "ИД_класса", "Номер_учебного_места", "Имя_рабочей_станции", "ip_адрес", "Примечание") FROM stdin;
\.
COPY public."Учебные_места" ("ИД", "ИД_класса", "Номер_учебного_места", "Имя_рабочей_станции", "ip_адрес", "Примечание") FROM '$$PATH$$/4877.dat';

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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               