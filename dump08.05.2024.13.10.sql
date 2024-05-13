toc.dat                                                                                             0000600 0004000 0002000 00000114323 14616631562 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       
    
            |            pract    16.2    16.2 V               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    24922    pract    DATABASE     y   CREATE DATABASE pract WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE pract;
                postgres    false                    1255    41249 Н   add_class(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     t  CREATE PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying)
    LANGUAGE sql
    AS $$
	begin;
		insert into ╨Ъ╨╗╨░╤Б╤Б╤Л (╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В, ╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡, ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В)
		values (max_places, resp_id, note, 0);
		insert into ╨Р╨┤╤А╨╡╤Б╨░
		values (lastval(), a_pref, a_street, a_house, a_place, a_phone_number);
	commit;
$$;
   DROP PROCEDURE public.add_class(IN max_places integer, IN resp_id integer, IN note character varying, IN a_pref character varying, IN a_street character varying, IN a_house character varying, IN a_place character varying, IN a_phone_number character varying);
       public          postgres    false         у            1255    41147 D   add_eq_type(character varying, character varying, character varying) 	   PROCEDURE     H  CREATE PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying)
    LANGUAGE sql
    AS $$
	insert into ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣
	(╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П, ╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡, ╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░)
	values (category, name, characteristic)
$$;
 В   DROP PROCEDURE public.add_eq_type(IN category character varying, IN name character varying, IN characteristic character varying);
       public          postgres    false                    1255    41256 d   add_learn_place(integer, character varying, character varying, character varying, character varying) 	   PROCEDURE     {  CREATE PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying)
    LANGUAGE sql
    AS $$
	begin;
		update ╨Ъ╨╗╨░╤Б╤Б╤Л set ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В = ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В + 1 where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = class_id;
		insert into ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ (╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░, ╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░, ╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕, ip_╨░╨┤╤А╨╡╤Б, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡)
		values (class_id, place_num, workstation_name, id_address, note);
	commit;
$$;
 ┐   DROP PROCEDURE public.add_learn_place(IN class_id integer, IN place_num character varying, IN workstation_name character varying, IN id_address character varying, IN note character varying);
       public          postgres    false                    1255    41230    del_class(integer) 	   PROCEDURE     ╪   CREATE PROCEDURE public.del_class(IN class_id integer)
    LANGUAGE sql
    AS $$
	delete from ╨Ъ╨╗╨░╤Б╤Б╤Л
	where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = class_id;
	delete from ╨Р╨┤╤А╨╡╤Б╨░
	where ╨Р╨┤╤А╨╡╤Б╨░."╨Ш╨Ф" = class_id;
$$;
 6   DROP PROCEDURE public.del_class(IN class_id integer);
       public          postgres    false         Ў            1255    41215    del_eq(integer) 	   PROCEDURE     К   CREATE PROCEDURE public.del_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	delete from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф = eq_id
$$;
 0   DROP PROCEDURE public.del_eq(IN eq_id integer);
       public          postgres    false         ф            1255    41148    del_eq_type(integer) 	   PROCEDURE     С   CREATE PROCEDURE public.del_eq_type(IN id integer)
    LANGUAGE sql
    AS $$
	delete from ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ where ╨Ш╨Ф = id
$$;
 2   DROP PROCEDURE public.del_eq_type(IN id integer);
       public          postgres    false         	           1255    41259    del_learn_place(integer) 	   PROCEDURE     х  CREATE PROCEDURE public.del_learn_place(IN learn_place_id integer)
    LANGUAGE sql
    AS $$
	begin;
		update ╨Ъ╨╗╨░╤Б╤Б╤Л set ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В = ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В - 1
		where ╨Ш╨Ф = (select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░"  from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = learn_place_id);
		delete from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = learn_place_id;
	commit;
$$;
 B   DROP PROCEDURE public.del_learn_place(IN learn_place_id integer);
       public          postgres    false         х            1255    41149    eq_is_installed(integer)    FUNCTION     я   CREATE FUNCTION public.eq_is_installed(eq_id integer) RETURNS boolean
    LANGUAGE sql
    AS $$
	select (select count(*) from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = null) != 0
$$;
 5   DROP FUNCTION public.eq_is_installed(eq_id integer);
       public          postgres    false         ╫            1259    25072    ╨Р╨┤╤А╨╡╤Б╨░    TABLE     5  CREATE TABLE public."╨Р╨┤╤А╨╡╤Б╨░" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л" character varying(20) DEFAULT '╤Г╨╗╨╕╤Ж╨░'::character varying NOT NULL,
    "╨г╨╗╨╕╤Ж╨░" character varying(30) NOT NULL,
    "╨Ф╨╛╨╝" character varying(10) NOT NULL,
    "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡" character varying(20) NOT NULL,
    "╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░" character varying(7),
    CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░_check" CHECK ((translate(("╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░")::text, '0123456789-'::text, '9999999999-'::text) = '9-99-99'::text)),
    CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л_check" CHECK ((("╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л")::text = ANY (ARRAY[('╤Г╨╗╨╕╤Ж╨░'::character varying)::text, ('╨┐╤А╨╛╤Б╨┐╨╡╨║╤В'::character varying)::text, ('╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║'::character varying)::text])))
);
 "   DROP TABLE public."╨Р╨┤╤А╨╡╤Б╨░";
       public         heap    postgres    false         ъ            1255    41224     get_address_by_class_id(integer)    FUNCTION     ░   CREATE FUNCTION public.get_address_by_class_id(class_id integer) RETURNS public."╨Р╨┤╤А╨╡╤Б╨░"
    LANGUAGE sql
    AS $$
	select * from ╨Р╨┤╤А╨╡╤Б╨░ where ╨Ш╨Ф = class_id
$$;
 @   DROP FUNCTION public.get_address_by_class_id(class_id integer);
       public          postgres    false    215         щ            1255    41223    get_all_address()    FUNCTION     В   CREATE FUNCTION public.get_all_address() RETURNS public."╨Р╨┤╤А╨╡╤Б╨░"
    LANGUAGE sql
    AS $$
	select * from ╨Р╨┤╤А╨╡╤Б╨░
$$;
 (   DROP FUNCTION public.get_all_address();
       public          postgres    false    215         ╪            1259    25080    ╨Ъ╨╗╨░╤Б╤Б╤Л    TABLE     A  CREATE TABLE public."╨Ъ╨╗╨░╤Б╤Б╤Л" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" integer NOT NULL,
    "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л" integer NOT NULL,
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" integer NOT NULL,
    CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В_check" CHECK (("╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" >= 0)),
    CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В_check" CHECK (("╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" >= 0))
);
 "   DROP TABLE public."╨Ъ╨╗╨░╤Б╤Б╤Л";
       public         heap    postgres    false                    1255    41227    get_all_classes()    FUNCTION     В   CREATE FUNCTION public.get_all_classes() RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select * from ╨Ъ╨╗╨░╤Б╤Б╤Л
$$;
 (   DROP FUNCTION public.get_all_classes();
       public          postgres    false    216         ┘            1259    25089    ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡    TABLE     є  CREATE TABLE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" integer NOT NULL,
    "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А" numeric(10,0) NOT NULL,
    "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕" numeric(1,0) NOT NULL,
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛_check" CHECK (("╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕" = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);
 .   DROP TABLE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡";
       public         heap    postgres    false         э            1255    41209    get_all_eq()    FUNCTION     Х   CREATE FUNCTION public.get_all_eq() RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
$$;
 #   DROP FUNCTION public.get_all_eq();
       public          postgres    false    217         █            1259    25103 !   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣    TABLE     
  CREATE TABLE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П" character varying(20) NOT NULL,
    "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡" character varying(150) NOT NULL,
    "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░" character varying(1000),
    CONSTRAINT "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П_check" CHECK ((("╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П")::text = ANY (ARRAY[('╨╝╨╛╨╜╨╕╤В╨╛╤А'::character varying)::text, ('╨┐╤А╨╕╨╜╤В╨╡╤А'::character varying)::text, ('╤Б╨╕╤Б╤В╨╡╨╝╨╜╤Л╨╣ ╨▒╨╗╨╛╨║'::character varying)::text, ('╨╝╨░╤В╨╡╤А╨╕╨╜╤Б╨║╨░╤П ╨┐╨╗╨░╤В╨░'::character varying)::text, ('╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А'::character varying)::text, ('╤Б╨╡╤В╨╡╨▓╨░╤П ╨║╨░╤А╤В╨░'::character varying)::text, ('╨╝╨╛╨┤╤Г╨╗╤М ╨┐╨░╨╝╤П╤В╨╕'::character varying)::text, ('╨Ц╨Ь╨Ф'::character varying)::text, ('╨┐╤А╨╕╨▓╨╛╨┤ CD'::character varying)::text, ('╨┐╤А╨╕╨▓╨╛╨┤ DVD'::character varying)::text, ('╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░'::character varying)::text, ('╨У╨Ь╨Ф'::character varying)::text, ('╨┐╤А╨╛╤З╨╡╨╡'::character varying)::text])))
);
 7   DROP TABLE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣";
       public         heap    postgres    false         Ё            1255    41150    get_all_eq_type()    FUNCTION     н   CREATE FUNCTION public.get_all_eq_type() RETURNS public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"
    LANGUAGE sql
    AS $$
		select * from ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣
$$;
 (   DROP FUNCTION public.get_all_eq_type();
       public          postgres    false    219         ▄            1259    25112    ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░    TABLE     н  CREATE TABLE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░" integer NOT NULL,
    "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░" character varying(20) NOT NULL,
    "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕" character varying(255),
    "ip_╨░╨┤╤А╨╡╤Б" character varying(15),
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_check" CHECK ((("╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕" IS NOT NULL) OR ("ip_╨░╨┤╤А╨╡╤Б" IS NOT NULL))),
    CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_ip_╨░╨┤╤А╨╡╤Б_check" CHECK ((translate(("ip_╨░╨┤╤А╨╡╤Б")::text, '0123456789.'::text, '9999999999.'::text) = '999.999.999.999'::text))
);
 /   DROP TABLE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░";
       public         heap    postgres    false                    1255    41253    get_all_learn_places()    FUNCTION     б   CREATE FUNCTION public.get_all_learn_places() RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select * from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░
$$;
 -   DROP FUNCTION public.get_all_learn_places();
       public          postgres    false    220         ┌            1259    25097    ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡    TABLE     Ж  CREATE TABLE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░" integer NOT NULL,
    "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" integer NOT NULL,
    "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕" date NOT NULL,
    "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П" date,
    CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_check" CHECK (("╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕" <= "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П"))
);
 .   DROP TABLE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡";
       public         heap    postgres    false         °            1255    41217    get_all_serv()    FUNCTION     Ч   CREATE FUNCTION public.get_all_serv() RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
$$;
 %   DROP FUNCTION public.get_all_serv();
       public          postgres    false    218                    1255    41229    get_class_by_id(integer)    FUNCTION     л   CREATE FUNCTION public.get_class_by_id(id integer) RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select * from ╨Ъ╨╗╨░╤Б╤Б╤Л where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = id
$$;
 2   DROP FUNCTION public.get_class_by_id(id integer);
       public          postgres    false    216                    1255    41228 $   get_class_by_learn_place_id(integer)    FUNCTION     *  CREATE FUNCTION public.get_class_by_learn_place_id(place_id integer) RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select ╨Ъ╨╗╨░╤Б╤Б╤Л.*
	from ╨Ъ╨╗╨░╤Б╤Б╤Л join ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ on(╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░ = ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф")
	where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = place_id
$$;
 D   DROP FUNCTION public.get_class_by_learn_place_id(place_id integer);
       public          postgres    false    216         ў            1255    41216    get_eq_by_serv_id(integer)    FUNCTION     Z  CREATE FUNCTION public.get_eq_by_serv_id(serv_id integer) RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.*
	from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П =╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф" = serv_id
	
$$;
 9   DROP FUNCTION public.get_eq_by_serv_id(serv_id integer);
       public          postgres    false    217         ю            1255    41210    get_eq_by_type(integer)    FUNCTION     ▀   CREATE FUNCTION public.get_eq_by_type(type_id integer) RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ where ╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = type_id
$$;
 6   DROP FUNCTION public.get_eq_by_type(type_id integer);
       public          postgres    false    217                    1255    41252    get_eqs_by_learn_place()    FUNCTION     x  CREATE FUNCTION public.get_eqs_by_learn_place() RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.* from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" = ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П"  = null
$$;
 /   DROP FUNCTION public.get_eqs_by_learn_place();
       public          postgres    false    217         я            1255    41213 !   get_learn_place_by_eq_id(integer)    FUNCTION     А  CREATE FUNCTION public.get_learn_place_by_eq_id(eq_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.* from
	╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ join ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ on (╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.╨Ш╨Ф = ╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░)
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П != NULL
$$;
 >   DROP FUNCTION public.get_learn_place_by_eq_id(eq_id integer);
       public          postgres    false    220         
           1255    41260 #   get_learn_place_by_serv_id(integer)    FUNCTION     Г  CREATE FUNCTION public.get_learn_place_by_serv_id(serv_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.* from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф" = serv_id
$$;
 B   DROP FUNCTION public.get_learn_place_by_serv_id(serv_id integer);
       public          postgres    false    220                    1255    41251 %   get_learn_places_by_class_id(integer)    FUNCTION     °   CREATE FUNCTION public.get_learn_places_by_class_id(class_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select * from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░" = class_id
$$;
 E   DROP FUNCTION public.get_learn_places_by_class_id(class_id integer);
       public          postgres    false    220         ч            1255    41221    get_serv_by_eq_id(integer)    FUNCTION     ╓   CREATE FUNCTION public.get_serv_by_eq_id(eq_id integer) RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id
$$;
 7   DROP FUNCTION public.get_serv_by_eq_id(eq_id integer);
       public          postgres    false    218         ш            1255    41222    get_serv_by_place_id(integer)    FUNCTION     т   CREATE FUNCTION public.get_serv_by_place_id(place_id integer) RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░ = place_id
$$;
 =   DROP FUNCTION public.get_serv_by_place_id(place_id integer);
       public          postgres    false    218         т            1255    41218    install_eq(integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer)
    LANGUAGE sql
    AS $$
	insert into ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ (╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░, ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П, ╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕)
	values (eq_id, place_id, CURRENT_DATE)
$$;
 I   DROP PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer);
       public          postgres    false         ц            1255    41220    uninstall_eq(integer) 	   PROCEDURE     Ё   CREATE PROCEDURE public.uninstall_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	update ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	set ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = current_date
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id
	and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = null
$$;
 6   DROP PROCEDURE public.uninstall_eq(IN eq_id integer);
       public          postgres    false                     1255    41226 v   update_address(integer, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     ╪  CREATE PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying)
    LANGUAGE sql
    AS $$
	update ╨Р╨┤╤А╨╡╤Б╨░
	set (╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л, ╨г╨╗╨╕╤Ж╨░,╨Ф╨╛╨╝,╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡,╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░)=
	(new_pref, new_street, new_house, new_place, new_phone_number)
	where (╨Ш╨Ф = address_id)
$$;
 ф   DROP PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying);
       public          postgres    false         ы            1255    41250 :   update_class(integer, integer, integer, character varying) 	   PROCEDURE     B  CREATE PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying)
    LANGUAGE sql
    AS $$
	update ╨Ъ╨╗╨░╤Б╤Б╤Л
	set (╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В, ╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡) = 
	(max_places, resp_id, note)
$$;
    DROP PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying);
       public          postgres    false         ё            1255    41214 @   update_eq(integer, integer, numeric, numeric, character varying) 	   PROCEDURE     п  CREATE PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying)
    LANGUAGE sql
    AS $$
	update ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
	set (╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П, ╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А, ╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡) = 
	(new_eq_type_id, new_inv_num, is_ok, new_notes)
	where ╨Ш╨Ф = eq_id
$$;
 Ш   DROP PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying);
       public          postgres    false         ь            1255    41151 P   update_eq_type(integer, character varying, character varying, character varying) 	   PROCEDURE     Б  CREATE PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying)
    LANGUAGE sql
    AS $$
	update "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" 
	set (╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П, ╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡, ╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░) = 
	(new_category, new_name, new_characteristic)
	where ╨Ш╨Ф = id
$$;
 а   DROP PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying);
       public          postgres    false         ▌            1259    41153    ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq    SEQUENCE     П   CREATE SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq";
       public          postgres    false    216                    0    0    ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq" OWNED BY public."╨Ъ╨╗╨░╤Б╤Б╤Л"."╨Ш╨Ф";
          public          postgres    false    221         ▐            1259    41154 !   ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE     Ы   CREATE SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq";
       public          postgres    false    217                    0    0 !   ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNED BY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"."╨Ш╨Ф";
          public          postgres    false    222         ▀            1259    41155 !   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE     Ы   CREATE SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq";
       public          postgres    false    218                    0    0 !   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNED BY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"."╨Ш╨Ф";
          public          postgres    false    223         р            1259    41156 *   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq    SEQUENCE     д   CREATE SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq";
       public          postgres    false    219                    0    0 *   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq" OWNED BY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"."╨Ш╨Ф";
          public          postgres    false    224         с            1259    41157 "   ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq    SEQUENCE     Ь   CREATE SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq";
       public          postgres    false    220                    0    0 "   ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq" OWNED BY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"."╨Ш╨Ф";
          public          postgres    false    225         R           2604    41159    ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ш╨Ф    DEFAULT     |   ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"'::regclass);
 D   ALTER TABLE public."╨Ъ╨╗╨░╤Б╤Б╤Л" ALTER COLUMN "╨Ш╨Ф" DROP DEFAULT;
       public          postgres    false    221    216         S           2604    41160    ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ш╨Ф    DEFAULT     Ф   ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"'::regclass);
 P   ALTER TABLE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" DROP DEFAULT;
       public          postgres    false    222    217         T           2604    41161    ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ш╨Ф    DEFAULT     Ф   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"'::regclass);
 P   ALTER TABLE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" DROP DEFAULT;
       public          postgres    false    223    218         U           2604    41162 &   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ ╨Ш╨Ф    DEFAULT     ж   ALTER TABLE ONLY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"'::regclass);
 Y   ALTER TABLE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ALTER COLUMN "╨Ш╨Ф" DROP DEFAULT;
       public          postgres    false    224    219         V           2604    41163    ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨Ш╨Ф    DEFAULT     Ц   ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"'::regclass);
 Q   ALTER TABLE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ALTER COLUMN "╨Ш╨Ф" DROP DEFAULT;
       public          postgres    false    225    220                   0    25072    ╨Р╨┤╤А╨╡╤Б╨░ 
   TABLE DATA           Ъ   COPY public."╨Р╨┤╤А╨╡╤Б╨░" ("╨Ш╨Ф", "╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л", "╨г╨╗╨╕╤Ж╨░", "╨Ф╨╛╨╝", "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡", "╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░") FROM stdin;
    public          postgres    false    215       4872.dat 	          0    25080    ╨Ъ╨╗╨░╤Б╤Б╤Л 
   TABLE DATA           ╞   COPY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ("╨Ш╨Ф", "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В", "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡", "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В") FROM stdin;
    public          postgres    false    216       4873.dat 
          0    25089    ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ 
   TABLE DATA           ╠   COPY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А", "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
    public          postgres    false    217       4874.dat           0    25097    ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ 
   TABLE DATA           ╣   COPY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕", "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П") FROM stdin;
    public          postgres    false    218       4875.dat           0    25103 !   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ 
   TABLE DATA           Ч   COPY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ("╨Ш╨Ф", "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡", "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░") FROM stdin;
    public          postgres    false    219       4876.dat 
          0    25112    ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ 
   TABLE DATA           ═   COPY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ("╨Ш╨Ф", "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕", "ip_╨░╨┤╤А╨╡╤Б", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
    public          postgres    false    220       4877.dat            0    0    ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"', 1, true);
          public          postgres    false    221                    0    0 !   ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"', 2, true);
          public          postgres    false    222                     0    0 !   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"', 1, false);
          public          postgres    false    223         !           0    0 *   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"', 19, true);
          public          postgres    false    224         "           0    0 "   ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"', 1, false);
          public          postgres    false    225         a           2606    41233    ╨Р╨┤╤А╨╡╤Б╨░ ╨Р╨┤╤А╨╡╤Б╨░_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."╨Р╨┤╤А╨╡╤Б╨░"
    ADD CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_pkey" PRIMARY KEY ("╨Ш╨Ф");
 L   ALTER TABLE ONLY public."╨Р╨┤╤А╨╡╤Б╨░" DROP CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_pkey";
       public            postgres    false    215         d           2606    41167    ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ъ╨╗╨░╤Б╤Б╤Л_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    ADD CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_pkey" PRIMARY KEY ("╨Ш╨Ф");
 L   ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л" DROP CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_pkey";
       public            postgres    false    216         f           2606    41169 6   ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_pkey" PRIMARY KEY ("╨Ш╨Ф");
 d   ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" DROP CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_pkey";
       public            postgres    false    217         i           2606    41171 6   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_pkey" PRIMARY KEY ("╨Ш╨Ф");
 d   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" DROP CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_pkey";
       public            postgres    false    218         n           2606    41173 H   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_pkey 
   CONSTRAINT     О   ALTER TABLE ONLY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"
    ADD CONSTRAINT "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_pkey" PRIMARY KEY ("╨Ш╨Ф");
 v   ALTER TABLE ONLY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" DROP CONSTRAINT "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_pkey";
       public            postgres    false    219         s           2606    41175 8   ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    ADD CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_pkey" PRIMARY KEY ("╨Ш╨Ф");
 f   ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" DROP CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_pkey";
       public            postgres    false    220         b           1259    41176    ╨Р╨┤╤А╨╡╤Б╨░_╨г╨Ъ    INDEX     }   CREATE UNIQUE INDEX "╨Р╨┤╤А╨╡╤Б╨░_╨г╨Ъ" ON public."╨Р╨┤╤А╨╡╤Б╨░" USING btree ("╨г╨╗╨╕╤Ж╨░", "╨Ф╨╛╨╝", "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡");
 '   DROP INDEX public."╨Р╨┤╤А╨╡╤Б╨░_╨г╨Ъ";
       public            postgres    false    215    215    215         g           1259    41177    ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨г╨Ъ    INDEX     М   CREATE UNIQUE INDEX "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨г╨Ъ" ON public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А");
 3   DROP INDEX public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨г╨Ъ";
       public            postgres    false    217         j           1259    41178    ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ1    INDEX     и   CREATE UNIQUE INDEX "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ1" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕");
 4   DROP INDEX public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ1";
       public            postgres    false    218    218         k           1259    41179    ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ2    INDEX     л   CREATE UNIQUE INDEX "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ2" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕");
 4   DROP INDEX public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ2";
       public            postgres    false    218    218         o           1259    41180 &   ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨г╨Ъ    INDEX     л   CREATE UNIQUE INDEX "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨г╨Ъ" ON public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" USING btree ("╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡");
 <   DROP INDEX public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨г╨Ъ";
       public            postgres    false    219    219         p           1259    41181    ╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ1    INDEX     з   CREATE UNIQUE INDEX "╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ1" ON public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" USING btree ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕");
 5   DROP INDEX public."╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ1";
       public            postgres    false    220    220         q           1259    41182    ╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ2    INDEX     Р   CREATE UNIQUE INDEX "╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ2" ON public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" USING btree ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "ip_╨░╨┤╤А╨╡╤Б");
 5   DROP INDEX public."╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ2";
       public            postgres    false    220    220         l           1259    41183 2   ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨┤╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П_idx    INDEX     ╦   CREATE UNIQUE INDEX "╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨┤╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П_idx" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") WHERE ("╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П" <> NULL::date);
 H   DROP INDEX public."╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨┤╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П_idx";
       public            postgres    false    218    218         t           2606    41234 #   ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_fkey 
   FK CONSTRAINT     Т   ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    ADD CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_fkey" FOREIGN KEY ("╨Ш╨Ф") REFERENCES public."╨Р╨┤╤А╨╡╤Б╨░"("╨Ш╨Ф");
 Q   ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л" DROP CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_fkey";
       public          postgres    false    216    4705    215         u           2606    41189 W   ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░_fkey 
   FK CONSTRAINT     ¤   ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") REFERENCES public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"("╨Ш╨Ф");
 Е   ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" DROP CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░_fkey";
       public          postgres    false    4718    219    217         v           2606    41194 T   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П_fkey 
   FK CONSTRAINT     ш   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П_fkey" FOREIGN KEY ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") REFERENCES public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"("╨Ш╨Ф");
 В   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" DROP CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П_fkey";
       public          postgres    false    217    4710    218         w           2606    41199 W   ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░_fkey 
   FK CONSTRAINT       ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░") REFERENCES public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"("╨Ш╨Ф") ON DELETE CASCADE;
 Е   ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" DROP CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░_fkey";
       public          postgres    false    220    218    4723         x           2606    41204 J   ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░_fkey 
   FK CONSTRAINT     ╪   ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    ADD CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░") REFERENCES public."╨Ъ╨╗╨░╤Б╤Б╤Л"("╨Ш╨Ф") ON DELETE CASCADE;
 x   ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" DROP CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░_fkey";
       public          postgres    false    4708    220    216                                                                                                                                                                                                                                                                                                                     4872.dat                                                                                            0000600 0004000 0002000 00000000231 14616631562 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	21	╨Ш╨╝╨╡╨╡╤В╤Б╤П	0-00-00
7	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	21	╨┤╤А╤Г╨│╨╛╨╡	0-00-00
1	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	52	12	9-23-14
\.


                                                                                                                                                                                                                                                                                                                                                                       4873.dat                                                                                            0000600 0004000 0002000 00000000024 14616631562 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	10	10	asd	23
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            4874.dat                                                                                            0000600 0004000 0002000 00000000005 14616631562 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4875.dat                                                                                            0000600 0004000 0002000 00000000005 14616631562 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4876.dat                                                                                            0000600 0004000 0002000 00000000443 14616631562 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	╨┐╤А╨╕╨╜╤В╨╡╤А	╨┐╤А╨╕╨╜╤В╨╡╤А	asd
5	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А	asd
7	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А1	asd
8	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А2	asd
9	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А3	asd
10	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А4	asd
\.


                                                                                                                                                                                                                             4877.dat                                                                                            0000600 0004000 0002000 00000000005 14616631562 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000103641 14616631562 0015403 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
		insert into ╨Ъ╨╗╨░╤Б╤Б╤Л (╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В, ╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡, ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В)
		values (max_places, resp_id, note, 0);
		insert into ╨Р╨┤╤А╨╡╤Б╨░
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
	insert into ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣
	(╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П, ╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡, ╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░)
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
		update ╨Ъ╨╗╨░╤Б╤Б╤Л set ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В = ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В + 1 where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = class_id;
		insert into ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ (╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░, ╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░, ╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕, ip_╨░╨┤╤А╨╡╤Б, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡)
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
	delete from ╨Ъ╨╗╨░╤Б╤Б╤Л
	where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = class_id;
	delete from ╨Р╨┤╤А╨╡╤Б╨░
	where ╨Р╨┤╤А╨╡╤Б╨░."╨Ш╨Ф" = class_id;
$$;


ALTER PROCEDURE public.del_class(IN class_id integer) OWNER TO postgres;

--
-- Name: del_eq(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	delete from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф = eq_id
$$;


ALTER PROCEDURE public.del_eq(IN eq_id integer) OWNER TO postgres;

--
-- Name: del_eq_type(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_eq_type(IN id integer)
    LANGUAGE sql
    AS $$
	delete from ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ where ╨Ш╨Ф = id
$$;


ALTER PROCEDURE public.del_eq_type(IN id integer) OWNER TO postgres;

--
-- Name: del_learn_place(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.del_learn_place(IN learn_place_id integer)
    LANGUAGE sql
    AS $$
	begin;
		update ╨Ъ╨╗╨░╤Б╤Б╤Л set ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В = ╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В - 1
		where ╨Ш╨Ф = (select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░"  from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = learn_place_id);
		delete from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = learn_place_id;
	commit;
$$;


ALTER PROCEDURE public.del_learn_place(IN learn_place_id integer) OWNER TO postgres;

--
-- Name: eq_is_installed(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.eq_is_installed(eq_id integer) RETURNS boolean
    LANGUAGE sql
    AS $$
	select (select count(*) from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = null) != 0
$$;


ALTER FUNCTION public.eq_is_installed(eq_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ╨Р╨┤╤А╨╡╤Б╨░; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨Р╨┤╤А╨╡╤Б╨░" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л" character varying(20) DEFAULT '╤Г╨╗╨╕╤Ж╨░'::character varying NOT NULL,
    "╨г╨╗╨╕╤Ж╨░" character varying(30) NOT NULL,
    "╨Ф╨╛╨╝" character varying(10) NOT NULL,
    "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡" character varying(20) NOT NULL,
    "╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░" character varying(7),
    CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░_check" CHECK ((translate(("╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░")::text, '0123456789-'::text, '9999999999-'::text) = '9-99-99'::text)),
    CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л_check" CHECK ((("╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л")::text = ANY (ARRAY[('╤Г╨╗╨╕╤Ж╨░'::character varying)::text, ('╨┐╤А╨╛╤Б╨┐╨╡╨║╤В'::character varying)::text, ('╨┐╨╡╤А╨╡╤Г╨╗╨╛╨║'::character varying)::text])))
);


ALTER TABLE public."╨Р╨┤╤А╨╡╤Б╨░" OWNER TO postgres;

--
-- Name: get_address_by_class_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_address_by_class_id(class_id integer) RETURNS public."╨Р╨┤╤А╨╡╤Б╨░"
    LANGUAGE sql
    AS $$
	select * from ╨Р╨┤╤А╨╡╤Б╨░ where ╨Ш╨Ф = class_id
$$;


ALTER FUNCTION public.get_address_by_class_id(class_id integer) OWNER TO postgres;

--
-- Name: get_all_address(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_address() RETURNS public."╨Р╨┤╤А╨╡╤Б╨░"
    LANGUAGE sql
    AS $$
	select * from ╨Р╨┤╤А╨╡╤Б╨░
$$;


ALTER FUNCTION public.get_all_address() OWNER TO postgres;

--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨Ъ╨╗╨░╤Б╤Б╤Л" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" integer NOT NULL,
    "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л" integer NOT NULL,
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" integer NOT NULL,
    CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В_check" CHECK (("╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" >= 0)),
    CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В_check" CHECK (("╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В" >= 0))
);


ALTER TABLE public."╨Ъ╨╗╨░╤Б╤Б╤Л" OWNER TO postgres;

--
-- Name: get_all_classes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_classes() RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select * from ╨Ъ╨╗╨░╤Б╤Б╤Л
$$;


ALTER FUNCTION public.get_all_classes() OWNER TO postgres;

--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" integer NOT NULL,
    "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А" numeric(10,0) NOT NULL,
    "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕" numeric(1,0) NOT NULL,
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛_check" CHECK (("╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕" = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);


ALTER TABLE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" OWNER TO postgres;

--
-- Name: get_all_eq(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_eq() RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
$$;


ALTER FUNCTION public.get_all_eq() OWNER TO postgres;

--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П" character varying(20) NOT NULL,
    "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡" character varying(150) NOT NULL,
    "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░" character varying(1000),
    CONSTRAINT "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П_check" CHECK ((("╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П")::text = ANY (ARRAY[('╨╝╨╛╨╜╨╕╤В╨╛╤А'::character varying)::text, ('╨┐╤А╨╕╨╜╤В╨╡╤А'::character varying)::text, ('╤Б╨╕╤Б╤В╨╡╨╝╨╜╤Л╨╣ ╨▒╨╗╨╛╨║'::character varying)::text, ('╨╝╨░╤В╨╡╤А╨╕╨╜╤Б╨║╨░╤П ╨┐╨╗╨░╤В╨░'::character varying)::text, ('╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А'::character varying)::text, ('╤Б╨╡╤В╨╡╨▓╨░╤П ╨║╨░╤А╤В╨░'::character varying)::text, ('╨╝╨╛╨┤╤Г╨╗╤М ╨┐╨░╨╝╤П╤В╨╕'::character varying)::text, ('╨Ц╨Ь╨Ф'::character varying)::text, ('╨┐╤А╨╕╨▓╨╛╨┤ CD'::character varying)::text, ('╨┐╤А╨╕╨▓╨╛╨┤ DVD'::character varying)::text, ('╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░'::character varying)::text, ('╨У╨Ь╨Ф'::character varying)::text, ('╨┐╤А╨╛╤З╨╡╨╡'::character varying)::text])))
);


ALTER TABLE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" OWNER TO postgres;

--
-- Name: get_all_eq_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_eq_type() RETURNS public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"
    LANGUAGE sql
    AS $$
		select * from ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣
$$;


ALTER FUNCTION public.get_all_eq_type() OWNER TO postgres;

--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░" integer NOT NULL,
    "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░" character varying(20) NOT NULL,
    "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕" character varying(255),
    "ip_╨░╨┤╤А╨╡╤Б" character varying(15),
    "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡" character varying(1000),
    CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_check" CHECK ((("╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕" IS NOT NULL) OR ("ip_╨░╨┤╤А╨╡╤Б" IS NOT NULL))),
    CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_ip_╨░╨┤╤А╨╡╤Б_check" CHECK ((translate(("ip_╨░╨┤╤А╨╡╤Б")::text, '0123456789.'::text, '9999999999.'::text) = '999.999.999.999'::text))
);


ALTER TABLE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" OWNER TO postgres;

--
-- Name: get_all_learn_places(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_learn_places() RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select * from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░
$$;


ALTER FUNCTION public.get_all_learn_places() OWNER TO postgres;

--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" (
    "╨Ш╨Ф" integer NOT NULL,
    "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░" integer NOT NULL,
    "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" integer NOT NULL,
    "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕" date NOT NULL,
    "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П" date,
    CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_check" CHECK (("╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕" <= "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П"))
);


ALTER TABLE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" OWNER TO postgres;

--
-- Name: get_all_serv(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_all_serv() RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
$$;


ALTER FUNCTION public.get_all_serv() OWNER TO postgres;

--
-- Name: get_class_by_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_class_by_id(id integer) RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select * from ╨Ъ╨╗╨░╤Б╤Б╤Л where ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф" = id
$$;


ALTER FUNCTION public.get_class_by_id(id integer) OWNER TO postgres;

--
-- Name: get_class_by_learn_place_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_class_by_learn_place_id(place_id integer) RETURNS public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    LANGUAGE sql
    AS $$
	select ╨Ъ╨╗╨░╤Б╤Б╤Л.*
	from ╨Ъ╨╗╨░╤Б╤Б╤Л join ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ on(╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░ = ╨Ъ╨╗╨░╤Б╤Б╤Л."╨Ш╨Ф")
	where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = place_id
$$;


ALTER FUNCTION public.get_class_by_learn_place_id(place_id integer) OWNER TO postgres;

--
-- Name: get_eq_by_serv_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eq_by_serv_id(serv_id integer) RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.*
	from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П =╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф" = serv_id
	
$$;


ALTER FUNCTION public.get_eq_by_serv_id(serv_id integer) OWNER TO postgres;

--
-- Name: get_eq_by_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eq_by_type(type_id integer) RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ where ╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = type_id
$$;


ALTER FUNCTION public.get_eq_by_type(type_id integer) OWNER TO postgres;

--
-- Name: get_eqs_by_learn_place(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_eqs_by_learn_place() RETURNS public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.* from ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П" = ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П"  = null
$$;


ALTER FUNCTION public.get_eqs_by_learn_place() OWNER TO postgres;

--
-- Name: get_learn_place_by_eq_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_place_by_eq_id(eq_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.* from
	╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ join ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ on (╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.╨Ш╨Ф = ╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░)
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П != NULL
$$;


ALTER FUNCTION public.get_learn_place_by_eq_id(eq_id integer) OWNER TO postgres;

--
-- Name: get_learn_place_by_serv_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_place_by_serv_id(serv_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░.* from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ join ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ on (╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф" = ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░")
	where ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡."╨Ш╨Ф" = serv_id
$$;


ALTER FUNCTION public.get_learn_place_by_serv_id(serv_id integer) OWNER TO postgres;

--
-- Name: get_learn_places_by_class_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_learn_places_by_class_id(class_id integer) RETURNS public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    LANGUAGE sql
    AS $$
	select * from ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ where ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░."╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░" = class_id
$$;


ALTER FUNCTION public.get_learn_places_by_class_id(class_id integer) OWNER TO postgres;

--
-- Name: get_serv_by_eq_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_serv_by_eq_id(eq_id integer) RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id
$$;


ALTER FUNCTION public.get_serv_by_eq_id(eq_id integer) OWNER TO postgres;

--
-- Name: get_serv_by_place_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_serv_by_place_id(place_id integer) RETURNS public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    LANGUAGE sql
    AS $$
	select * from ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	where ╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░ = place_id
$$;


ALTER FUNCTION public.get_serv_by_place_id(place_id integer) OWNER TO postgres;

--
-- Name: install_eq(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer)
    LANGUAGE sql
    AS $$
	insert into ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ (╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░, ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П, ╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕)
	values (eq_id, place_id, CURRENT_DATE)
$$;


ALTER PROCEDURE public.install_eq(IN eq_id integer, IN place_id integer) OWNER TO postgres;

--
-- Name: uninstall_eq(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.uninstall_eq(IN eq_id integer)
    LANGUAGE sql
    AS $$
	update ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡
	set ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = current_date
	where ╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П = eq_id
	and ╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П = null
$$;


ALTER PROCEDURE public.uninstall_eq(IN eq_id integer) OWNER TO postgres;

--
-- Name: update_address(integer, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying)
    LANGUAGE sql
    AS $$
	update ╨Р╨┤╤А╨╡╤Б╨░
	set (╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л, ╨г╨╗╨╕╤Ж╨░,╨Ф╨╛╨╝,╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡,╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░)=
	(new_pref, new_street, new_house, new_place, new_phone_number)
	where (╨Ш╨Ф = address_id)
$$;


ALTER PROCEDURE public.update_address(IN address_id integer, IN new_pref character varying, IN new_street character varying, IN new_house character varying, IN new_place character varying, IN new_phone_number character varying) OWNER TO postgres;

--
-- Name: update_class(integer, integer, integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying)
    LANGUAGE sql
    AS $$
	update ╨Ъ╨╗╨░╤Б╤Б╤Л
	set (╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В, ╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡) = 
	(max_places, resp_id, note)
$$;


ALTER PROCEDURE public.update_class(IN class_id integer, IN max_places integer, IN resp_id integer, IN note character varying) OWNER TO postgres;

--
-- Name: update_eq(integer, integer, numeric, numeric, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying)
    LANGUAGE sql
    AS $$
	update ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡
	set (╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П, ╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А, ╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕, ╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡) = 
	(new_eq_type_id, new_inv_num, is_ok, new_notes)
	where ╨Ш╨Ф = eq_id
$$;


ALTER PROCEDURE public.update_eq(IN eq_id integer, IN new_eq_type_id integer, IN new_inv_num numeric, IN is_ok numeric, IN new_notes character varying) OWNER TO postgres;

--
-- Name: update_eq_type(integer, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying)
    LANGUAGE sql
    AS $$
	update "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" 
	set (╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П, ╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡, ╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░) = 
	(new_category, new_name, new_characteristic)
	where ╨Ш╨Ф = id
$$;


ALTER PROCEDURE public.update_eq_type(IN id integer, IN new_category character varying, IN new_name character varying, IN new_characteristic character varying) OWNER TO postgres;

--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq" OWNER TO postgres;

--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq" OWNED BY public."╨Ъ╨╗╨░╤Б╤Б╤Л"."╨Ш╨Ф";


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNER TO postgres;

--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNED BY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"."╨Ш╨Ф";


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNER TO postgres;

--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq" OWNED BY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"."╨Ш╨Ф";


--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq" OWNER TO postgres;

--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq" OWNED BY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"."╨Ш╨Ф";


--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq" OWNER TO postgres;

--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq" OWNED BY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"."╨Ш╨Ф";


--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ш╨Ф; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"'::regclass);


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ш╨Ф; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"'::regclass);


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ш╨Ф; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"'::regclass);


--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ ╨Ш╨Ф; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"'::regclass);


--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨Ш╨Ф; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ALTER COLUMN "╨Ш╨Ф" SET DEFAULT nextval('public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"'::regclass);


--
-- Data for Name: ╨Р╨┤╤А╨╡╤Б╨░; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Р╨┤╤А╨╡╤Б╨░" ("╨Ш╨Ф", "╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л", "╨г╨╗╨╕╤Ж╨░", "╨Ф╨╛╨╝", "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡", "╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░") FROM stdin;
\.
COPY public."╨Р╨┤╤А╨╡╤Б╨░" ("╨Ш╨Ф", "╨Я╤А╨╡╤Д╨╕╨║╤Б_╤Г╨╗╨╕╤Ж╤Л", "╨г╨╗╨╕╤Ж╨░", "╨Ф╨╛╨╝", "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡", "╨Э╨╛╨╝╨╡╤А_╤В╨╡╨╗╨╡╤Д╨╛╨╜╨░") FROM '$$PATH$$/4872.dat';

--
-- Data for Name: ╨Ъ╨╗╨░╤Б╤Б╤Л; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ("╨Ш╨Ф", "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В", "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡", "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В") FROM stdin;
\.
COPY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ("╨Ш╨Ф", "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В", "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡", "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В") FROM '$$PATH$$/4873.dat';

--
-- Data for Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А", "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
\.
COPY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А", "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM '$$PATH$$/4874.dat';

--
-- Data for Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕", "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П") FROM stdin;
\.
COPY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕", "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П") FROM '$$PATH$$/4875.dat';

--
-- Data for Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ("╨Ш╨Ф", "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡", "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░") FROM stdin;
\.
COPY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ("╨Ш╨Ф", "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡", "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░") FROM '$$PATH$$/4876.dat';

--
-- Data for Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ("╨Ш╨Ф", "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕", "ip_╨░╨┤╤А╨╡╤Б", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
\.
COPY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ("╨Ш╨Ф", "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕", "ip_╨░╨┤╤А╨╡╤Б", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM '$$PATH$$/4877.dat';

--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_seq"', 1, true);


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"', 2, true);


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_seq"', 1, false);


--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨Ш╨Ф_seq"', 19, true);


--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_seq"', 1, false);


--
-- Name: ╨Р╨┤╤А╨╡╤Б╨░ ╨Р╨┤╤А╨╡╤Б╨░_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Р╨┤╤А╨╡╤Б╨░"
    ADD CONSTRAINT "╨Р╨┤╤А╨╡╤Б╨░_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ъ╨╗╨░╤Б╤Б╤Л_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    ADD CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣ ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"
    ADD CONSTRAINT "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    ADD CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_pkey" PRIMARY KEY ("╨Ш╨Ф");


--
-- Name: ╨Р╨┤╤А╨╡╤Б╨░_╨г╨Ъ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨Р╨┤╤А╨╡╤Б╨░_╨г╨Ъ" ON public."╨Р╨┤╤А╨╡╤Б╨░" USING btree ("╨г╨╗╨╕╤Ж╨░", "╨Ф╨╛╨╝", "╨Я╨╛╨╝╨╡╤Й╨╡╨╜╨╕╨╡");


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨г╨Ъ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨г╨Ъ" ON public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А");


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ1" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕");


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨г╨Ъ2" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕");


--
-- Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨г╨Ъ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣_╨г╨Ъ" ON public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" USING btree ("╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡");


--
-- Name: ╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ1" ON public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" USING btree ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕");


--
-- Name: ╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨г╤З╨╡╨▒╨╜╨╛╨╡_╨╝╨╡╤Б╤В╨╛_╨г╨Ъ2" ON public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" USING btree ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "ip_╨░╨┤╤А╨╡╤Б");


--
-- Name: ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨┤╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨┤╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П_idx" ON public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" USING btree ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") WHERE ("╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П" <> NULL::date);


--
-- Name: ╨Ъ╨╗╨░╤Б╤Б╤Л ╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ъ╨╗╨░╤Б╤Б╤Л"
    ADD CONSTRAINT "╨Ъ╨╗╨░╤Б╤Б╤Л_╨Ш╨Ф_fkey" FOREIGN KEY ("╨Ш╨Ф") REFERENCES public."╨Р╨┤╤А╨╡╤Б╨░"("╨Ш╨Ф");


--
-- Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") REFERENCES public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣"("╨Ш╨Ф");


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П_fkey" FOREIGN KEY ("╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П") REFERENCES public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡"("╨Ш╨Ф");


--
-- Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡"
    ADD CONSTRAINT "╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡_╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░") REFERENCES public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"("╨Ш╨Ф") ON DELETE CASCADE;


--
-- Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░ ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░"
    ADD CONSTRAINT "╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░_╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░_fkey" FOREIGN KEY ("╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░") REFERENCES public."╨Ъ╨╗╨░╤Б╤Б╤Л"("╨Ш╨Ф") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
