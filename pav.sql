toc.dat                                                                                             0000600 0004000 0002000 00000021416 14633076476 0014463 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            pav    16.3    16.3 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    24576    pav    DATABASE     z   CREATE DATABASE pav WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE pav;
                postgres    false         �            1259    40969    client    TABLE     ^   CREATE TABLE public.client (
    id integer NOT NULL,
    name text NOT NULL,
    cpf text
);
    DROP TABLE public.client;
       public         heap    postgres    false         �            1259    40972    client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215         �            1259    41015    order    TABLE     U   CREATE TABLE public."order" (
    id integer NOT NULL,
    total integer NOT NULL
);
    DROP TABLE public."order";
       public         heap    postgres    false         �            1259    41018    order_id_seq    SEQUENCE     �   ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221         �            1259    41024    order_product    TABLE        CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false         �            1259    40978    product    TABLE     p   CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false         �            1259    40981    product_id_seq    SEQUENCE     �   ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217         �            1259    40987    variant    TABLE     �   CREATE TABLE public.variant (
    id integer NOT NULL,
    name text NOT NULL,
    ean text NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    product_id integer
);
    DROP TABLE public.variant;
       public         heap    postgres    false         �            1259    40990    variants_id_seq    SEQUENCE     �   ALTER TABLE public.variant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219         �          0    40969    client 
   TABLE DATA           /   COPY public.client (id, name, cpf) FROM stdin;
    public          postgres    false    215       4813.dat �          0    41015    order 
   TABLE DATA           ,   COPY public."order" (id, total) FROM stdin;
    public          postgres    false    221       4819.dat �          0    41024    order_product 
   TABLE DATA           A   COPY public.order_product (order_id, product_id, id) FROM stdin;
    public          postgres    false    223       4821.dat �          0    40978    product 
   TABLE DATA           8   COPY public.product (id, name, description) FROM stdin;
    public          postgres    false    217       4815.dat �          0    40987    variant 
   TABLE DATA           M   COPY public.variant (id, name, ean, quantity, price, product_id) FROM stdin;
    public          postgres    false    219       4817.dat �           0    0    client_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.client_id_seq', 19, true);
          public          postgres    false    216         �           0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 1, false);
          public          postgres    false    222         �           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 2, true);
          public          postgres    false    218         �           0    0    variants_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.variants_id_seq', 12, true);
          public          postgres    false    220         .           2606    40998    client client_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.client DROP CONSTRAINT client_id;
       public            postgres    false    215         :           2606    41028    order_product order_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_id;
       public            postgres    false    223         0           2606    41000    product product_id 
   CONSTRAINT     P   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_id PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.product DROP CONSTRAINT product_id;
       public            postgres    false    217         6           2606    41023    order transaction_id 
   CONSTRAINT     T   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT transaction_id PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."order" DROP CONSTRAINT transaction_id;
       public            postgres    false    221         4           2606    41002    variant variant_id 
   CONSTRAINT     P   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_id PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_id;
       public            postgres    false    219         7           1259    41040    fki_order_id_fk    INDEX     M   CREATE INDEX fki_order_id_fk ON public.order_product USING btree (order_id);
 #   DROP INDEX public.fki_order_id_fk;
       public            postgres    false    223         8           1259    41034    fki_product_id    INDEX     N   CREATE INDEX fki_product_id ON public.order_product USING btree (product_id);
 "   DROP INDEX public.fki_product_id;
       public            postgres    false    223         1           1259    41014    fki_r    INDEX     ?   CREATE INDEX fki_r ON public.variant USING btree (product_id);
    DROP INDEX public.fki_r;
       public            postgres    false    219         2           1259    41008    fki_variant_product    INDEX     M   CREATE INDEX fki_variant_product ON public.variant USING btree (product_id);
 '   DROP INDEX public.fki_variant_product;
       public            postgres    false    219         <           2606    41035    order_product order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) NOT VALID;
 C   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_id_fk;
       public          postgres    false    221    4662    223         =           2606    41029    order_product product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id) NOT VALID;
 B   ALTER TABLE ONLY public.order_product DROP CONSTRAINT product_id;
       public          postgres    false    223    4656    217         ;           2606    41009    variant variant_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_product FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_product;
       public          postgres    false    219    217    4656                                                                                                                                                                                                                                                          4813.dat                                                                                            0000600 0004000 0002000 00000000545 14633076476 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Caio	18364623796
3	Caio	18364623796
4	Caio	18364623796
5	Caio	18364623796
6	Caio	18364623796
7	Caio	18364623796
8	Caio	18364623796
9	Caio	18364623796
10	Caio	18364623796
11	Caio	18364623796
12	Caio	18364623796
13	Caio	18364623796
14	Caio	18364623796
15	Caio	18364623796
16	Caio	18364623796
17	Caio	18364623796
18	Caio	18364623796
19	Caio	18364623796
\.


                                                                                                                                                           4819.dat                                                                                            0000600 0004000 0002000 00000000005 14633076476 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4821.dat                                                                                            0000600 0004000 0002000 00000000005 14633076476 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4815.dat                                                                                            0000600 0004000 0002000 00000000165 14633076476 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Camisa Florida	Uma camisa florida para usar no solzin
2	Camisa Florida	Uma camisa florida para usar no solzin
\.


                                                                                                                                                                                                                                                                                                                                                                                                           4817.dat                                                                                            0000600 0004000 0002000 00000000357 14633076476 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	P	1234	10	10000	\N
2	P	1234	10	10000	\N
3	P	1234	10	10000	\N
4	P	1234	10	10000	\N
5	P	1234	10	10000	\N
6	P	1234	10	10000	\N
7	P	1234	10	10000	\N
8	P	1234	10	10000	1
9	P	1234	10	10000	174548
11	P	1234	10	10000	1
12	P	1234	10	10000	2
\.


                                                                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000016534 14633076476 0015415 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE pav;
--
-- Name: pav; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pav WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE pav OWNER TO postgres;

\connect pav

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name text NOT NULL,
    cpf text
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    total integer NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variant (
    id integer NOT NULL,
    name text NOT NULL,
    ean text NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    product_id integer
);


ALTER TABLE public.variant OWNER TO postgres;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.variant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, cpf) FROM stdin;
\.
COPY public.client (id, name, cpf) FROM '$$PATH$$/4813.dat';

--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, total) FROM stdin;
\.
COPY public."order" (id, total) FROM '$$PATH$$/4819.dat';

--
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_product (order_id, product_id, id) FROM stdin;
\.
COPY public.order_product (order_id, product_id, id) FROM '$$PATH$$/4821.dat';

--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description) FROM stdin;
\.
COPY public.product (id, name, description) FROM '$$PATH$$/4815.dat';

--
-- Data for Name: variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variant (id, name, ean, quantity, price, product_id) FROM stdin;
\.
COPY public.variant (id, name, ean, quantity, price, product_id) FROM '$$PATH$$/4817.dat';

--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 19, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 2, true);


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variants_id_seq', 12, true);


--
-- Name: client client_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id PRIMARY KEY (id);


--
-- Name: order_product order_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id PRIMARY KEY (id);


--
-- Name: product product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_id PRIMARY KEY (id);


--
-- Name: order transaction_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT transaction_id PRIMARY KEY (id);


--
-- Name: variant variant_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_id PRIMARY KEY (id);


--
-- Name: fki_order_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_order_id_fk ON public.order_product USING btree (order_id);


--
-- Name: fki_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_product_id ON public.order_product USING btree (product_id);


--
-- Name: fki_r; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_r ON public.variant USING btree (product_id);


--
-- Name: fki_variant_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_variant_product ON public.variant USING btree (product_id);


--
-- Name: order_product order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) NOT VALID;


--
-- Name: order_product product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id) NOT VALID;


--
-- Name: variant variant_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_product FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    