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
5	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	21	╨Ш╨╝╨╡╨╡╤В╤Б╤П	0-00-00
7	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	21	╨┤╤А╤Г╨│╨╛╨╡	0-00-00
1	╤Г╨╗╨╕╤Ж╨░	╨Я╤Г╤И╨║╨╕╨╜╨░	52	12	9-23-14
\.


--
-- Data for Name: ╨Ъ╨╗╨░╤Б╤Б╤Л; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ъ╨╗╨░╤Б╤Б╤Л" ("╨Ш╨Ф", "╨Ь╨░╨║╤Б_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В", "╨Ш╨Ф_╨╛╤В╨▓╨╡╤В╤Б╤В╨▓_╨║╨░╤Д╨╡╨┤╤А╤Л", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡", "╨в╨╡╨║╤Г╤Й_╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛_╨╝╨╡╤Б╤В") FROM stdin;
1	10	10	asd	23
\.


--
-- Data for Name: ╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ю╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤В╨╕╨┐╨░_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ш╨╜╨▓╨╡╨╜╤В╨░╤А╨╜╤Л╨╣_╨╜╨╛╨╝╨╡╤А", "╨Я╤А╨╕╨╖╨╜╨░╨║_╨╕╤Б╨┐╤А╨░╨▓╨╜╨╛╤Б╤В╨╕", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
\.


--
-- Data for Name: ╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡" ("╨Ш╨Ф", "╨Ш╨Ф_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨Ф_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╤П", "╨Ф╨░╤В╨░_╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨╕", "╨Ф╨░╤В╨░_╤Б╨╜╤П╤В╨╕╤П") FROM stdin;
\.


--
-- Data for Name: ╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨в╨╕╨┐╤Л_╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╣" ("╨Ш╨Ф", "╨Ъ╨░╤В╨╡╨│╨╛╤А╨╕╤П", "╨Э╨░╨╕╨╝╨╡╨╜╨╛╨▓╨░╨╜╨╕╨╡", "╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨░") FROM stdin;
4	╨┐╤А╨╕╨╜╤В╨╡╤А	╨┐╤А╨╕╨╜╤В╨╡╤А	asd
5	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А	asd
7	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А1	asd
8	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А2	asd
9	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А3	asd
10	╨┐╤А╨╕╨╜╤В╨╡╤А	╨║╤А╤Г╤В╨╛╨╣ ╨┐╤А╨╕╨╜╤В╨╡╤А4	asd
\.


--
-- Data for Name: ╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."╨г╤З╨╡╨▒╨╜╤Л╨╡_╨╝╨╡╤Б╤В╨░" ("╨Ш╨Ф", "╨Ш╨Ф_╨║╨╗╨░╤Б╤Б╨░", "╨Э╨╛╨╝╨╡╤А_╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛_╨╝╨╡╤Б╤В╨░", "╨Ш╨╝╤П_╤А╨░╨▒╨╛╤З╨╡╨╣_╤Б╤В╨░╨╜╤Ж╨╕╨╕", "ip_╨░╨┤╤А╨╡╤Б", "╨Я╤А╨╕╨╝╨╡╤З╨░╨╜╨╕╨╡") FROM stdin;
\.


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

