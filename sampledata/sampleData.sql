--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-03-28 17:34:49

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

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16396)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    categoryi_d bigint NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    name character varying(255),
    need_to_cook_flag boolean,
    update_dt timestamp without time zone NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 16401)
-- Name: employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee (
    user_id character varying(255) NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    push_token character varying(255),
    update_dt timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255)
);


--
-- TOC entry 202 (class 1259 OID 16409)
-- Name: orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderitem (
    order_id character varying(255) NOT NULL,
    order_item_id integer NOT NULL,
    quantity integer,
    product_id character varying(255)
);


--
-- TOC entry 203 (class 1259 OID 16417)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    order_id character varying(255) NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    order_status character varying(255),
    update_dt timestamp without time zone NOT NULL,
    user_id character varying(255),
    table_id bigint
);


--
-- TOC entry 204 (class 1259 OID 16425)
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    product_id character varying(255) NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    image_filename character varying(255),
    name character varying(255),
    price double precision,
    update_dt timestamp without time zone NOT NULL,
    category_id bigint
);


--
-- TOC entry 205 (class 1259 OID 16433)
-- Name: serv_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.serv_table (
    table_id bigint NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    is_take_out boolean NOT NULL,
    name character varying(255),
    occupied boolean,
    seats integer,
    update_dt timestamp without time zone NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16438)
-- Name: usertoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usertoken (
    user_id character varying(255) NOT NULL,
    create_dt timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    update_dt timestamp without time zone NOT NULL
);


--
-- TOC entry 3027 (class 0 OID 16396)
-- Dependencies: 200
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category (categoryi_d, create_dt, name, need_to_cook_flag, update_dt) VALUES (1, '2021-03-27 00:00:00', 'beverages', false, '2021-03-27 00:00:00');
INSERT INTO public.category (categoryi_d, create_dt, name, need_to_cook_flag, update_dt) VALUES (2, '2021-03-27 00:00:00', 'main', true, '2021-03-27 00:00:00');
INSERT INTO public.category (categoryi_d, create_dt, name, need_to_cook_flag, update_dt) VALUES (3, '2021-03-27 00:00:00', 'appetizers', true, '2021-03-27 00:00:00');


--
-- TOC entry 3028 (class 0 OID 16401)
-- Dependencies: 201
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.employee (user_id, create_dt, push_token, update_dt, first_name, last_name, email) VALUES ('anna', '2021-03-27 00:00:00', NULL, '2021-03-27 00:00:00', 'Austin', 'Bond', 'Austin.Bond@coska.com');
INSERT INTO public.employee (user_id, create_dt, push_token, update_dt, first_name, last_name, email) VALUES ('dina', '2021-03-27 00:00:00', NULL, '2021-03-27 00:00:00', 'Grace', 'Clark', 'Grace.Clark@coska.com');
INSERT INTO public.employee (user_id, create_dt, push_token, update_dt, first_name, last_name, email) VALUES ('thomas', '2021-03-27 00:00:00', NULL, '2021-03-27 00:00:00', 'Joan', 'Davies', 'Joan.Davies@coska.com');


--
-- TOC entry 3029 (class 0 OID 16409)
-- Dependencies: 202
-- Data for Name: orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('91f00584-0c1c-462e-92f4-aaf8c0ea86bb', 1, 2, 'main14');
INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('91f00584-0c1c-462e-92f4-aaf8c0ea86bb', 2, 2, 'main14');
INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('91f00584-0c1c-462e-92f4-aaf8c0ea86bb', 3, 2, 'main12');
INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('91f00584-0c1c-462e-92f4-aaf8c0ea86bb', 4, 1, 'main1');
INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('15b60f42-2b4a-4a2d-97fc-bfd9f386c1c3', 1, 2, 'main12');
INSERT INTO public.orderitem (order_id, order_item_id, quantity, product_id) VALUES ('15b60f42-2b4a-4a2d-97fc-bfd9f386c1c3', 2, 1, 'main1');


--
-- TOC entry 3030 (class 0 OID 16417)
-- Dependencies: 203
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders (order_id, create_dt, order_status, update_dt, user_id, table_id) VALUES ('91f00584-0c1c-462e-92f4-aaf8c0ea86bb', '2018-08-07 13:32:31.965', 'NEW', '2018-08-07 13:32:31.965', 'dina', 1);
INSERT INTO public.orders (order_id, create_dt, order_status, update_dt, user_id, table_id) VALUES ('15b60f42-2b4a-4a2d-97fc-bfd9f386c1c3', '2018-08-07 13:45:59.612', 'NEW', '2018-08-07 13:45:59.612', 'dina', 3);


--
-- TOC entry 3031 (class 0 OID 16425)
-- Dependencies: 204
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink1', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.001.png', 'Oolong Tea', 1, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink2', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.002.png', 'Green Tea', 1, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink3', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.003.png', 'Black Tea', 1, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink4', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.004.png', 'Coffee', 2, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink5', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.005.png', 'California Sake', 20, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink6', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.006.png', 'Gekkeinkan Sake', 24, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink7', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.007.png', 'Margarita', 6, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink8', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.008.png', 'Screwdriver', 6, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink9', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.009.png', 'Kirin Beer', 8, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink10', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.010.png', 'Yebisu Beer', 7, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink11', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.011.png', 'Whit Russian', 7, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink12', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.012.png', 'Whiskey Sour', 6, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink13', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.013.png', 'Asahi Beer', 8, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('drink14', '2021-03-27 00:00:00', '/200x200/Drinks-item+images.014.png', 'Sapporo Beer', 8, '2021-03-27 00:00:00', 1);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main1', '2021-03-27 00:00:00', '/200x200/main-item+images.001.png', 'Spicy Tuna Roll', 15, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main2', '2021-03-27 00:00:00', '/200x200/main-item+images.002.png', 'Avocado Roll', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main3', '2021-03-27 00:00:00', '/200x200/main-item+images.003.png', 'Beff Teriyaki', 25, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main4', '2021-03-27 00:00:00', '/200x200/main-item+images.004.png', 'Salmon Roll', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main5', '2021-03-27 00:00:00', '/200x200/main-item+images.005.png', 'Dynamite Roll', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main6', '2021-03-27 00:00:00', '/200x200/main-item+images.006.png', 'Bento Set A', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main7', '2021-03-27 00:00:00', '/200x200/main-item+images.007.png', 'Maki', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main8', '2021-03-27 00:00:00', '/200x200/main-item+images.008.png', 'Poke bowl', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main9', '2021-03-27 00:00:00', '/200x200/main-item+images.009.png', 'California Roll', 17, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main10', '2021-03-27 00:00:00', '/200x200/main-item+images.010.png', 'Sushi Combo', 14, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main11', '2021-03-27 00:00:00', '/200x200/main-item+images.011.png', 'Lunch Set A', 20, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main12', '2021-03-27 00:00:00', '/200x200/main-item+images.012.png', 'Lunch Set B', 18, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main13', '2021-03-27 00:00:00', '/200x200/main-item+images.013.png', 'Smoked Salmon Roll', 15, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('main14', '2021-03-27 00:00:00', '/200x200/main-item+images.014.png', 'Vegetable Roll', 10, '2021-03-27 00:00:00', 2);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer1', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.001.png', 'Cucumber Salad', 6, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer2', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.002.png', 'Yaki Onigiri', 7, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer3', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.003.png', 'Fired Tofu', 8, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer4', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.004.png', 'Kinpira Gobo', 7, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer5', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.005.png', 'Eggplant with Sesame Sauce', 10, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer6', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.006.png', 'Pickled Cucumber', 5, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer7', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.007.png', 'Simmered Kabocha', 8, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer8', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.008.png', 'Green Bean', 8, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer9', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.009.png', 'Fried Lotus Root with Port', 10, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer10', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.010.png', 'Miso Onigiri', 7, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer11', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.011.png', 'Takoyaki', 8, '2021-03-27 00:00:00', 3);
INSERT INTO public.product (product_id, create_dt, image_filename, name, price, update_dt, category_id) VALUES ('appetizer12', '2021-03-27 00:00:00', '/200x200/Appetizer-item+images.012.png', 'Grilled Oysters with Ponzu Sauce', 10, '2021-03-27 00:00:00', 3);


--
-- TOC entry 3032 (class 0 OID 16433)
-- Dependencies: 205
-- Data for Name: serv_table; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (1, '2021-03-27 00:00:00', false, '#1', false, 4, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (2, '2021-03-27 00:00:00', false, '#2', false, 4, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (3, '2021-03-27 00:00:00', false, '#3', false, 6, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (4, '2021-03-27 00:00:00', false, '#4', false, 6, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (5, '2021-03-27 00:00:00', false, '#5', false, 6, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (6, '2021-03-27 00:00:00', false, '#6', false, 6, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (7, '2021-03-27 00:00:00', false, '#7', false, 2, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (8, '2021-03-27 00:00:00', false, '#8', false, 2, '2021-03-27 00:00:00');
INSERT INTO public.serv_table (table_id, create_dt, is_take_out, name, occupied, seats, update_dt) VALUES (100, '2021-03-27 00:00:00', true, 'TakeOut', NULL, NULL, '2021-03-27 00:00:00');


--
-- TOC entry 3033 (class 0 OID 16438)
-- Dependencies: 206
-- Data for Name: usertoken; Type: TABLE DATA; Schema: public; Owner: -
--



-- Completed on 2021-03-28 17:34:49

--
-- PostgreSQL database dump complete
--

