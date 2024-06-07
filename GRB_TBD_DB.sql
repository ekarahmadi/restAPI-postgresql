PGDMP      #                |         
   GRB_TBD_DB "   14.12 (Ubuntu 14.12-1.pgdg22.04+1)    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    40995 
   GRB_TBD_DB    DATABASE     t   CREATE DATABASE "GRB_TBD_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE "GRB_TBD_DB";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    4            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    41504    author    TABLE     �   CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character varying,
    year_born integer,
    year_died integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.author;
       public         heap    postgres    false    4            �            1259    41503    Author_author_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Author_author_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Author_author_id_seq";
       public          postgres    false    210    4            �           0    0    Author_author_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Author_author_id_seq" OWNED BY public.author.author_id;
          public          postgres    false    209            �            1259    41551    book    TABLE       CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_name character varying,
    pages integer,
    publication_year integer,
    publisher_id integer,
    language_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.book;
       public         heap    postgres    false    4            �            1259    41512    book_author    TABLE     �   CREATE TABLE public.book_author (
    book_id integer,
    author_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.book_author;
       public         heap    postgres    false    4            �            1259    41550    book_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.book_book_id_seq;
       public          postgres    false    4    222            �           0    0    book_book_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.book_book_id_seq OWNED BY public.book.book_id;
          public          postgres    false    221            �            1259    41547    book_category    TABLE     �   CREATE TABLE public.book_category (
    category_id integer,
    book_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.book_category;
       public         heap    postgres    false    4            �            1259    41579    book_promotion    TABLE     �   CREATE TABLE public.book_promotion (
    promotion_id integer,
    book_id integer,
    store_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.book_promotion;
       public         heap    postgres    false    4            �            1259    41539    category    TABLE     �   CREATE TABLE public.category (
    category_id integer NOT NULL,
    category character varying,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.category;
       public         heap    postgres    false    4            �            1259    41538    category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_category_id_seq;
       public          postgres    false    219    4            �           0    0    category_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;
          public          postgres    false    218            �            1259    41610    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city character varying,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.city;
       public         heap    postgres    false    4            �            1259    41609    city_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.city_city_id_seq;
       public          postgres    false    4    235            �           0    0    city_city_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;
          public          postgres    false    234            �            1259    41592    customer    TABLE        CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name character varying,
    customer_email character varying,
    city_id integer,
    store_id integer,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.customer;
       public         heap    postgres    false    4            �            1259    41591    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    231    4            �           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    230            �            1259    41635 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    store_id integer,
    book_id integer,
    quantity integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.inventory;
       public         heap    postgres    false    4            �            1259    41634    inventory_inventory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventory_inventory_id_seq;
       public          postgres    false    4    241            �           0    0    inventory_inventory_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;
          public          postgres    false    240            �            1259    41530    language    TABLE     �   CREATE TABLE public.language (
    language_id integer NOT NULL,
    language character varying,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.language;
       public         heap    postgres    false    4            �            1259    41529    language_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public.language_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.language_language_id_seq;
       public          postgres    false    4    217            �           0    0    language_language_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;
          public          postgres    false    216            �            1259    41626    position    TABLE     �   CREATE TABLE public."position" (
    position_id integer NOT NULL,
    "position" character varying,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."position";
       public         heap    postgres    false    4            �            1259    41625    position_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.position_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.position_position_id_seq;
       public          postgres    false    4    239            �           0    0    position_position_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.position_position_id_seq OWNED BY public."position".position_id;
          public          postgres    false    238            �            1259    41562 	   promotion    TABLE       CREATE TABLE public.promotion (
    promotion_id integer NOT NULL,
    promotion_name character varying,
    start_date date,
    end_date date,
    description character varying,
    discount double precision,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.promotion;
       public         heap    postgres    false    4            �            1259    41561    promotion_promotion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promotion_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.promotion_promotion_id_seq;
       public          postgres    false    4    224            �           0    0    promotion_promotion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.promotion_promotion_id_seq OWNED BY public.promotion.promotion_id;
          public          postgres    false    223            �            1259    41523 	   publisher    TABLE     �   CREATE TABLE public.publisher (
    publisher_id integer NOT NULL,
    publisher_name character varying(255),
    city_id integer,
    telephone integer,
    year_founded integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.publisher;
       public         heap    postgres    false    4            �            1259    41522    publisher_publisher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publisher_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.publisher_publisher_id_seq;
       public          postgres    false    4    215            �           0    0    publisher_publisher_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.publisher_publisher_id_seq OWNED BY public.publisher.publisher_id;
          public          postgres    false    214            �            1259    41571    review    TABLE       CREATE TABLE public.review (
    review_id integer NOT NULL,
    customer_id integer,
    book_id integer,
    rating double precision,
    comment character varying,
    review_date date,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.review;
       public         heap    postgres    false    4            �            1259    41570    review_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.review_review_id_seq;
       public          postgres    false    226    4            �           0    0    review_review_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;
          public          postgres    false    225            �            1259    41619    salary    TABLE     �   CREATE TABLE public.salary (
    salary_id integer NOT NULL,
    salary_grade integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.salary;
       public         heap    postgres    false    4            �            1259    41618    salary_salary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.salary_salary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.salary_salary_id_seq;
       public          postgres    false    237    4            �           0    0    salary_salary_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.salary_salary_id_seq OWNED BY public.salary.salary_id;
          public          postgres    false    236            �            1259    41601    staff    TABLE     !  CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    staff_name character varying,
    staff_email character varying,
    position_id integer,
    salary_id integer,
    city_id integer,
    store_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.staff;
       public         heap    postgres    false    4            �            1259    41600    staff_staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.staff_staff_id_seq;
       public          postgres    false    4    233            �           0    0    staff_staff_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;
          public          postgres    false    232            �            1259    41583    store    TABLE     �   CREATE TABLE public.store (
    store_id integer NOT NULL,
    store_name character varying,
    city_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.store;
       public         heap    postgres    false    4            �            1259    41582    store_store_id_seq    SEQUENCE     �   CREATE SEQUENCE public.store_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.store_store_id_seq;
       public          postgres    false    4    229            �           0    0    store_store_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store.store_id;
          public          postgres    false    228            �            1259    41641    wishlist    TABLE     �   CREATE TABLE public.wishlist (
    customer_id integer,
    book_id integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.wishlist;
       public         heap    postgres    false    4            �            1259    41516    year    TABLE     �   CREATE TABLE public.year (
    year_id integer NOT NULL,
    year integer,
    last_update timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.year;
       public         heap    postgres    false    4            �            1259    41515    year_year_id_seq    SEQUENCE     �   CREATE SEQUENCE public.year_year_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.year_year_id_seq;
       public          postgres    false    213    4            �           0    0    year_year_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.year_year_id_seq OWNED BY public.year.year_id;
          public          postgres    false    212            �           2604    41507    author author_id    DEFAULT     v   ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public."Author_author_id_seq"'::regclass);
 ?   ALTER TABLE public.author ALTER COLUMN author_id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    41554    book book_id    DEFAULT     l   ALTER TABLE ONLY public.book ALTER COLUMN book_id SET DEFAULT nextval('public.book_book_id_seq'::regclass);
 ;   ALTER TABLE public.book ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    41542    category category_id    DEFAULT     |   ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    41613    city city_id    DEFAULT     l   ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);
 ;   ALTER TABLE public.city ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    41595    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    41638    inventory inventory_id    DEFAULT     �   ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);
 E   ALTER TABLE public.inventory ALTER COLUMN inventory_id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    41533    language language_id    DEFAULT     |   ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);
 C   ALTER TABLE public.language ALTER COLUMN language_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    41629    position position_id    DEFAULT     ~   ALTER TABLE ONLY public."position" ALTER COLUMN position_id SET DEFAULT nextval('public.position_position_id_seq'::regclass);
 E   ALTER TABLE public."position" ALTER COLUMN position_id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    41565    promotion promotion_id    DEFAULT     �   ALTER TABLE ONLY public.promotion ALTER COLUMN promotion_id SET DEFAULT nextval('public.promotion_promotion_id_seq'::regclass);
 E   ALTER TABLE public.promotion ALTER COLUMN promotion_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    41526    publisher publisher_id    DEFAULT     �   ALTER TABLE ONLY public.publisher ALTER COLUMN publisher_id SET DEFAULT nextval('public.publisher_publisher_id_seq'::regclass);
 E   ALTER TABLE public.publisher ALTER COLUMN publisher_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    41574    review review_id    DEFAULT     t   ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);
 ?   ALTER TABLE public.review ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    41622    salary salary_id    DEFAULT     t   ALTER TABLE ONLY public.salary ALTER COLUMN salary_id SET DEFAULT nextval('public.salary_salary_id_seq'::regclass);
 ?   ALTER TABLE public.salary ALTER COLUMN salary_id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    41604    staff staff_id    DEFAULT     p   ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);
 =   ALTER TABLE public.staff ALTER COLUMN staff_id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    41586    store store_id    DEFAULT     p   ALTER TABLE ONLY public.store ALTER COLUMN store_id SET DEFAULT nextval('public.store_store_id_seq'::regclass);
 =   ALTER TABLE public.store ALTER COLUMN store_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    41519    year year_id    DEFAULT     l   ALTER TABLE ONLY public.year ALTER COLUMN year_id SET DEFAULT nextval('public.year_year_id_seq'::regclass);
 ;   ALTER TABLE public.year ALTER COLUMN year_id DROP DEFAULT;
       public          postgres    false    213    212    213            �          0    41504    author 
   TABLE DATA           [   COPY public.author (author_id, author_name, year_born, year_died, last_update) FROM stdin;
    public          postgres    false    210   Ǭ       �          0    41551    book 
   TABLE DATA           s   COPY public.book (book_id, book_name, pages, publication_year, publisher_id, language_id, last_update) FROM stdin;
    public          postgres    false    222   :�       �          0    41512    book_author 
   TABLE DATA           F   COPY public.book_author (book_id, author_id, last_update) FROM stdin;
    public          postgres    false    211   =�       �          0    41547    book_category 
   TABLE DATA           J   COPY public.book_category (category_id, book_id, last_update) FROM stdin;
    public          postgres    false    220   #�       �          0    41579    book_promotion 
   TABLE DATA           V   COPY public.book_promotion (promotion_id, book_id, store_id, last_update) FROM stdin;
    public          postgres    false    227   d�       �          0    41539    category 
   TABLE DATA           F   COPY public.category (category_id, category, last_update) FROM stdin;
    public          postgres    false    219   �       �          0    41610    city 
   TABLE DATA           :   COPY public.city (city_id, city, last_update) FROM stdin;
    public          postgres    false    235   �       �          0    41592    customer 
   TABLE DATA           n   COPY public.customer (customer_id, customer_name, customer_email, city_id, store_id, last_update) FROM stdin;
    public          postgres    false    231   մ       �          0    41635 	   inventory 
   TABLE DATA           [   COPY public.inventory (inventory_id, store_id, book_id, quantity, last_update) FROM stdin;
    public          postgres    false    241   ߶       �          0    41530    language 
   TABLE DATA           F   COPY public.language (language_id, language, last_update) FROM stdin;
    public          postgres    false    217   )�       �          0    41626    position 
   TABLE DATA           J   COPY public."position" (position_id, "position", last_update) FROM stdin;
    public          postgres    false    239   �       �          0    41562 	   promotion 
   TABLE DATA           {   COPY public.promotion (promotion_id, promotion_name, start_date, end_date, description, discount, last_update) FROM stdin;
    public          postgres    false    224   I�       �          0    41523 	   publisher 
   TABLE DATA           p   COPY public.publisher (publisher_id, publisher_name, city_id, telephone, year_founded, last_update) FROM stdin;
    public          postgres    false    215   "�       �          0    41571    review 
   TABLE DATA           l   COPY public.review (review_id, customer_id, book_id, rating, comment, review_date, last_update) FROM stdin;
    public          postgres    false    226   ��       �          0    41619    salary 
   TABLE DATA           F   COPY public.salary (salary_id, salary_grade, last_update) FROM stdin;
    public          postgres    false    237   :�       �          0    41601    staff 
   TABLE DATA           z   COPY public.staff (staff_id, staff_name, staff_email, position_id, salary_id, city_id, store_id, last_update) FROM stdin;
    public          postgres    false    233   ��       �          0    41583    store 
   TABLE DATA           K   COPY public.store (store_id, store_name, city_id, last_update) FROM stdin;
    public          postgres    false    229   ��       �          0    41641    wishlist 
   TABLE DATA           E   COPY public.wishlist (customer_id, book_id, last_update) FROM stdin;
    public          postgres    false    242   �       �          0    41516    year 
   TABLE DATA           :   COPY public.year (year_id, year, last_update) FROM stdin;
    public          postgres    false    213   �       �           0    0    Author_author_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Author_author_id_seq"', 20, true);
          public          postgres    false    209            �           0    0    book_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.book_book_id_seq', 126, true);
          public          postgres    false    221            �           0    0    category_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.category_category_id_seq', 20, true);
          public          postgres    false    218            �           0    0    city_city_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.city_city_id_seq', 20, true);
          public          postgres    false    234            �           0    0    customer_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customer_customer_id_seq', 20, true);
          public          postgres    false    230            �           0    0    inventory_inventory_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 400, true);
          public          postgres    false    240            �           0    0    language_language_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.language_language_id_seq', 20, true);
          public          postgres    false    216            �           0    0    position_position_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.position_position_id_seq', 20, true);
          public          postgres    false    238            �           0    0    promotion_promotion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.promotion_promotion_id_seq', 20, true);
          public          postgres    false    223            �           0    0    publisher_publisher_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.publisher_publisher_id_seq', 20, true);
          public          postgres    false    214            �           0    0    review_review_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.review_review_id_seq', 1800, true);
          public          postgres    false    225            �           0    0    salary_salary_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.salary_salary_id_seq', 20, true);
          public          postgres    false    236            �           0    0    staff_staff_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.staff_staff_id_seq', 20, true);
          public          postgres    false    232            �           0    0    store_store_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.store_store_id_seq', 20, true);
          public          postgres    false    228            �           0    0    year_year_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.year_year_id_seq', 80, true);
          public          postgres    false    212            �           2606    41511    author author_id 
   CONSTRAINT     U   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_id PRIMARY KEY (author_id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT author_id;
       public            postgres    false    210            �           2606    41558    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    222            �           2606    41546    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    219            �           2606    41617    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    235            �           2606    41599    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    231            �           2606    41640    inventory inventory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public            postgres    false    241            �           2606    41537    language language_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);
 @   ALTER TABLE ONLY public.language DROP CONSTRAINT language_pkey;
       public            postgres    false    217            �           2606    41633    position position_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (position_id);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    239            �           2606    41569    promotion promotion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (promotion_id);
 B   ALTER TABLE ONLY public.promotion DROP CONSTRAINT promotion_pkey;
       public            postgres    false    224            �           2606    41528    publisher publisher_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (publisher_id);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public            postgres    false    215            �           2606    41578    review review_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);
 <   ALTER TABLE ONLY public.review DROP CONSTRAINT review_pkey;
       public            postgres    false    226            �           2606    41624    salary salary_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.salary
    ADD CONSTRAINT salary_pkey PRIMARY KEY (salary_id);
 <   ALTER TABLE ONLY public.salary DROP CONSTRAINT salary_pkey;
       public            postgres    false    237            �           2606    41608    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    233            �           2606    41590    store store_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);
 :   ALTER TABLE ONLY public.store DROP CONSTRAINT store_pkey;
       public            postgres    false    229            �           2606    41521    year year_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.year
    ADD CONSTRAINT year_pkey PRIMARY KEY (year_id);
 8   ALTER TABLE ONLY public.year DROP CONSTRAINT year_pkey;
       public            postgres    false    213            �           2606    41644    author Author_year_born_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.author
    ADD CONSTRAINT "Author_year_born_fkey" FOREIGN KEY (year_born) REFERENCES public.year(year_id) NOT VALID;
 H   ALTER TABLE ONLY public.author DROP CONSTRAINT "Author_year_born_fkey";
       public          postgres    false    3292    213    210            �           2606    41649    author Author_year_died_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.author
    ADD CONSTRAINT "Author_year_died_fkey" FOREIGN KEY (year_died) REFERENCES public.year(year_id) NOT VALID;
 H   ALTER TABLE ONLY public.author DROP CONSTRAINT "Author_year_died_fkey";
       public          postgres    false    3292    213    210            �           2606    41654 &   book_author book_author_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(author_id) NOT VALID;
 P   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_author_id_fkey;
       public          postgres    false    211    210    3290            �           2606    41659 $   book_author book_author_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 N   ALTER TABLE ONLY public.book_author DROP CONSTRAINT book_author_book_id_fkey;
       public          postgres    false    222    3300    211            �           2606    41679 (   book_category book_category_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_category
    ADD CONSTRAINT book_category_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 R   ALTER TABLE ONLY public.book_category DROP CONSTRAINT book_category_book_id_fkey;
       public          postgres    false    3300    220    222            �           2606    41674 ,   book_category book_category_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_category
    ADD CONSTRAINT book_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) NOT VALID;
 V   ALTER TABLE ONLY public.book_category DROP CONSTRAINT book_category_category_id_fkey;
       public          postgres    false    3298    219    220                       2606    41714 *   book_promotion book_promotion_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_promotion
    ADD CONSTRAINT book_promotion_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 T   ALTER TABLE ONLY public.book_promotion DROP CONSTRAINT book_promotion_book_id_fkey;
       public          postgres    false    3300    222    227                       2606    41709 /   book_promotion book_promotion_promotion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_promotion
    ADD CONSTRAINT book_promotion_promotion_id_fkey FOREIGN KEY (promotion_id) REFERENCES public.promotion(promotion_id) NOT VALID;
 Y   ALTER TABLE ONLY public.book_promotion DROP CONSTRAINT book_promotion_promotion_id_fkey;
       public          postgres    false    227    224    3302                       2606    41719 +   book_promotion book_promotion_store_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_promotion
    ADD CONSTRAINT book_promotion_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 U   ALTER TABLE ONLY public.book_promotion DROP CONSTRAINT book_promotion_store_id_fkey;
       public          postgres    false    227    3306    229                       2606    41749     inventory inventory_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 J   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_book_id_fkey;
       public          postgres    false    3300    222    241                       2606    41744 !   inventory inventory_store_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 K   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_store_id_fkey;
       public          postgres    false    3306    229    241            �           2606    41694    book language_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id) NOT VALID;
 :   ALTER TABLE ONLY public.book DROP CONSTRAINT language_id;
       public          postgres    false    217    222    3296                        2606    41684    book publication_year    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT publication_year FOREIGN KEY (publication_year) REFERENCES public.year(year_id) NOT VALID;
 ?   ALTER TABLE ONLY public.book DROP CONSTRAINT publication_year;
       public          postgres    false    222    213    3292            �           2606    41664     publisher publisher_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 J   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_city_id_fkey;
       public          postgres    false    235    215    3312                       2606    41689    book publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT publisher_id FOREIGN KEY (publisher_id) REFERENCES public.publisher(publisher_id) NOT VALID;
 ;   ALTER TABLE ONLY public.book DROP CONSTRAINT publisher_id;
       public          postgres    false    3294    215    222            �           2606    41669 %   publisher publisher_year_founded_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_year_founded_fkey FOREIGN KEY (year_founded) REFERENCES public.year(year_id) NOT VALID;
 O   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_year_founded_fkey;
       public          postgres    false    215    3292    213                       2606    41704    review review_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 D   ALTER TABLE ONLY public.review DROP CONSTRAINT review_book_id_fkey;
       public          postgres    false    222    3300    226                       2606    41699    review review_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) NOT VALID;
 H   ALTER TABLE ONLY public.review DROP CONSTRAINT review_customer_id_fkey;
       public          postgres    false    226    231    3308                       2606    41734    staff staff_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;
 B   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_city_id_fkey;
       public          postgres    false    235    233    3312                       2606    41724    staff staff_position_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(position_id) NOT VALID;
 F   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_position_id_fkey;
       public          postgres    false    239    3316    233            	           2606    41729    staff staff_salary_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_salary_id_fkey FOREIGN KEY (salary_id) REFERENCES public.salary(salary_id) NOT VALID;
 D   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_salary_id_fkey;
       public          postgres    false    233    237    3314            
           2606    41739    staff staff_store_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 C   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_store_id_fkey;
       public          postgres    false    233    229    3306                       2606    41759    wishlist wishlist_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(book_id) NOT VALID;
 H   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_book_id_fkey;
       public          postgres    false    3300    222    242                       2606    41754 "   wishlist wishlist_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) NOT VALID;
 L   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_customer_id_fkey;
       public          postgres    false    3308    231    242            �   c  x����n�0Eד��}E�$<viAB<*,�L���D(��N�E�Ne˫9��{�%�5����������t�
9O�\�8̈́P�%�D
N�kܚN�J��c�m�5��xj�3)��0E�=U7����b��%�x��GC�"&�v�ý��/�i���}T��ma=�%f9�S��U�d�p���[���jz�~f��&ƃ{^������pl���7=� 
�ΫwO˥ Å�������3lP Ky��Zm:�BT�)�mmp�����������K���>�9�zp���)�i����7�eM�i�5�$;�����T8B7�ˎ0�db9�6>9p��(�y���      �   �  x��T�r�0�O_q]��<x�%w
3�gdŊ�&3i �"!&�	 ���)3����,�BC����b�Rh�w�`n�`{�B@Q�%�U�R�K-Q�[U��F�Jꏢ^HQ����&��z&�</�b���g���[�=��+�ܛθ�)Q@�:L'�g(|����#P��R��c������=��ëuǽh#+v�eh@��T�G�tv~��%�p�;HV+���`�`lĭ�����{�Ppx�a�y��~�㑐��_��1��+�bƘ@�ܪ���D�g���h�DP�oIW@kɡ���;��{�L7�U��q���`#wl*hQ��:�`K��-Xqwy�i̬�S���؎{��5G���9�[�1�kU�,?l���ݚt8qӭ���t�nk�Ֆ+h�hޒ��l<��]M	6����G���;����m�m;�������l�./��Iq�Ҋ�@y�u���	�3����u�����b����      �   �   x����1�r���Z��+ �}ĵ4j�Y�?u</��[�S��u�9�*����ЖЈe0�m# �i3t��4��t ݤh�+m��;�:F�f0Z���*������-��UIZBk���� �m��NK=2:,�Gd�!�q����35�l1K.$C��Ld���믻��lG����Kǰ�h��Ȅ1�L}$���}J)�o      �   1  x���Kn� �ur��?��Yz�s�T]��f�������maQ?�>ſ<�2oW�w��~����@U4�@�Nd±M���E�`(+�H�T��Жt)�]-�J����c��2%Ma���wS��v�����׌�&�Qff��w3��h��^�������kEA�&��j�>��@��&�6�+P�$0yt^I�������[0C0.-�>5� ���RS��`i�E�E�B]AC@+9v��`�zBQU�Px�Pj̠wN��1�k:�E@�S��v��`�`�^�hu����H�\�y��j��      �   �   x��һ�0�U���~�kq�u���7څ�L4IY��~������r�[��Ѥ���,���<������d7�\*�[[�f3J3nR����f*��Z ^C9M��{N��u��؁�u+w�R�{���j�����      �   �   x��ҽN�0����ȕ����V	��rR�p�9#;��	Op]n�I��2�L�Xm���̓1G�v8�}k:�����[bu���Ҝq�`�����#-�+��Je�Y
�`L9eA�pAb)s���b��T����F7
Ȓ5�%�4I�����4���u��d�_���j��\(�5w��I�>�H��k�_%�ø�m�� ��^[É1��"��CUUG��      �   �   x�����@���)��Jbe41��f� '���/��;�3;L{<�gP�2�V�:甹)t��MY�[�W�J2��	̩�w8MG3�	TA����J:�7� Vt���^����L�S�j:)q"+��e���L�	�����gX	˃�!b��v��R�\��_r%����/Z���`'�C�{�� �����~G<�mH^��e�$��0��      �   �  x����n�@F�����L�
Q��(
��J��o�Z{Eݧ�͍ce7ߑ�#�͌إ��P�6'��Ϙ��!�K�9O�* �_8��i|7T��}��8	�$�������%Ϩ��4M���`�Y�j����!�"���<���&;�L�9@�fM��İ���Oc�``/�MM,��k���:�s���
�X�0������Q�d�P	Ą�J�B^�kQ�� ��Ȧ9�d<HH�d	��+XS�łf��{|(�w��w4�\��La��Q;*�����᳊���x3�Q��n	,G�Hyn��	a�lK,��w�Z�U#Wx�5��iH�Q�Ӈ�3�.�L3����ᙗj뎢�C�X�8�E7|��Ej����Zqa���F����g�ÊoU�Zj� ���s#���k�ϑ��@� w#0r-x�|�6��'��.����(q�Inx���k����ڟ���ȷ�u�};�|G�U�\��/�O]���'��?8�L��A��      �   :
  x���;�%7C�~�p�W��w�����Г^d�F�#�"��������O����W��Z���;�?=ߓ��w������q��Qv*�ӖS*׳�N
�ӺrQy�6�Qn(�{�n�C��N��4���]�]հ��Q���II��uMǳS�+;���S����v��'�v��:%I�]��Δ���M��*�d��
h����vjݡ���.m��vJ'�F:(]ϴ������/J��.+ݐ�U�q-~�N�/��o��J����IX���������p�$,a����`�@��`7V���΄IZ�	�����`������������Yn�� �Pe���+�y���t;�ƨ���R-*/�ag�!��v�Ce{�[�{��'�`$[Y���`���z�Ե�=�A]W�s}�Le�� (F+�T$uMu��A]O�P�`���$���>��.K-���RvY��������ŧ�Q�����*�GMJw���Ӌ��P��T������Kin ������Ԓ,eWu�Ե��S/����W�ER����")Xj����
q�^�Q]Oy%I�覺I�q��o�GѤ����L����޿as��(�n�rUد��^W9���a|Y�۪{C
W������o(r�M�Y!R�\�lu�CV��������������z�
��w�CV��۫��p��JV�M�q��E�'a�xL:�hoP����
h��zl�z�ʮ��MJ/��]ԞB������;��l.��2�a��a�����zl�4���,k^/�2{��~I�٫3ƛ_�����3�1��lJ�'���t>�9	�[��"�,���aZtjg��u����}�%�m?���wC_�/;����
t/���ݍIf���ڵ��d�J̒�*wD�K�D�q�̮-�=G���
��$F�ٍ�D�r��l'1�T�xr����^�������kZ�lE3?젴b�{�m��W������M���Yx���2;�ƭ�b��6Ȭe%�Bk�r��V*�����.� 5�3?]R�6��a�Y��� 5���*�|f���pm�g<Y%d6��%��i�`�I�v,�{g>r�� �ro���|ey��,�?C憖�F��s�m��^j�x�՜��<k�EfM��Ӓ��@hh~/,RC~擈Ej�j���Q��K�F���Dv��C�F�KF����{�*�S�Q(T"�S<e���ĕ��=��T��^ҞB� 1��^{�m�:0P��܎���/$G���=&��!��8�ء�',t�s~����s�� ����G�P��!t���g�C��^�lBγO���J\ys	�V{�F��9���+���j`ȯ��F���j��Y#~�����Oo��x%�/���X�PݷD��!{�=�o~���CM���g!zx.�D�k>{
E�x�t4�c��.r���v10���a#~M��"Rb�]��K<+F�o:g�Ĕv?��!bI{|�����{'>7�XG��F�r)x('�]�����+R���b��g9�еU9�S���ł�t�wbуQ
#�^T.-х5��X���{�zH\y����ޥ�>͎>�]���S�]��}I|
-J�7��|�)i[��%��|�T�n_��-���}�z1�q�&Y1į�`1�}?���}>��C�g�-C�X����𕞹c
�G|O c�|�~ތ�+���d̔xTz�g�x^&c�W���S�]H;�n�����������摶v�z��J���Vx�%||����Ϯ�=��e[����,x}~Ƃ���OB��-Ԑb	�­���]����@�Em&� G���3�-I�Z��iҬ�PkQ���=���u�xz������&���u��Fj�Z�sb+�Z��t�ON�Z���mz��N,zH��Yq�Un-G��,MB��<�ubW�?�#x��e�^��n�8��r�; �=�g�O�r��n������}�Qޛ�s��X��=��#�{���_Գ����}�I6�(��nw��)��]���Qh8�&x�z~`�c��Oc���U�ɳ�^)��&|x/�{��^�ΙM�J/��D�z���2D��ۂ�Tֳ�,�<��~��Z�םbCY�֢�[M�Z��d��S�](1&�-��T�(��C�g�b�*zŖ�y��"E��]�=<������g!zw��7�LѣQ��LуS�ER����	�b�>V:��]�`��(�쯷ًC�J�J���t���4��ಋMΉ�˟��tK�S���|�+�V�(��}��-j_�e����X��c��D��]�~�&z|W�b�k�����r������/���iݏ+v4�=���E��S5�-_#��>�[����{T[�י�#��vB���fi~�%�)��j�����e�[T�a�5��?Ήů���K����Y_�<�?^��,��N�y��*o�����~��n�\����[�P����)�*峗8��z`����+���=kz��ld`���秼$��=�迸gO8�T����Of�O��%��1A��?�ǜϋE��uG�p��{�nf��>��_"�]qĎ������o/�^�BY�����p'������� �CL�      �   �   x���MN�0�{
�hFq��gv��AHT��xh��2���7x�Oֳ���E'�I�[�?8�a>yw��ط����i+K�?����G�1�+p5=$�P��\ j�>h�kiX�V"���K�&��s�OcCC�/��x�����[:�/Jǎ�� �iY��=�a.� ��ʲ}�}[K����Q��z�=����,��fo�j�~?VU�ޗ�t      �   *  x���=k�0@g�Wh/	�?�$[ PR7p�.���^lK�d����ܡd��Q��$NF��Y%q�-�|�m�67��,�4�󇸈�����Ox�*��X���F����z���O������t���~����;�:!BK����K.k%JNM�Z��_�v����j��M|G� ���ƨ�tXIևs�MT��O���o���������"�`*�N����d�ǚ�}h��J+U:�5Yd�vW0��w=bM�+7�Z��Yd���Z(��u��uv��������.P�<��������      �   �  x����n�0E��Wp_�%ˎ�sZ�i�F�v��(&$���ߡB�R�FFQ���Ù�;��پ�Um8����5ٝ@�{����I�Z$?��љg��p|jukQL�A�%�s%4v�,i�=s�$�^���<]��f�}�l�����`�@2�rͼ[�邮} ����D��1p]:���̃w���fW�)�͜�=�p���4�B��B"Y�o�W~��|�[�W�ZdI+*k��*�C:яp@�.�t�sO�
�E�ޑ��H5L�)��/�}�1J���=u������3�RG�ˑG��j��ϼ���;���#v��V��]󀃹�;��8p���W����U]Kﳉ����Q��98"_0U���2���%Ty;l-��r`�Z_-�ƛ[g>����(Y��PBLj���?��'[ڦ��ʷ�̿=OecZ6�A7HY��i҃ь)Wܴ�ჱ�]b�i�a��HW�?��#��Ds$[ZhH�� 9��g��U؀�����7�����
�����'7hT�Z�ju͎�Z��j���癆��Z�B{sz�;��� ��V��2!+]�/��%��U���;OT5쭎����!	��_��yi�\���<^��_��9]��c��హ>+Ʉ����7�G;��R}����������(���?�_�xQ���ǻ�����	����{9��� ���      �   �  x����n�0E��Wx_��v®T�VUԊ]7CIi1(U������|�9�3c��rW!+����M�5� )�T�X҂�RO��*����|γ���(���D²9���#�2S�(}�k큎p:'p���Y��m��T��e��<�U�BQ���V[�E���
	�J��
�خo�#��8��R�gl����	8�ˋ}9P2`A	>`��c#h�Rm
1�
[�b[����rl�-gp;I�*�Eh�Ȋ��&I�K���I��ѷ������a��?�%�d�at�2�֮(ۓG��w'_��(c���t�����Þ�w�!�o�,u"7俏��r��s`�M�vS<�+�	�H�#��R�J�oa*a���$I������M&�zi%�      �   v  x��Y�nA<O�bsG�~p�p�2���2YG^[����grbk� EQ�8��5]ՏQA*��Ka����2��8<�/�<��Wλ�9���6O�)O�q~Zj��f#���5(����<8#�S�d�S�>b�!A(��x8>m���D�3��c�	y��Ӹ���!�C�b�O��}��yw����m��C��_!�Wѭ�n��/l�u9�qx�q<�w���-8b�QrC����"2�~��s�J8�B/��8[�%�e<��+�`f�()�<G�΂B�U����e��͇�q�t}ܝ�vӹ�%/��-�EVpl�f�gPL�I	b�8V��t���_��i�=瑓�)yI_%`O���?h�)W�A��$ɣ�2@S��%\K��#ϯ܏��2��F3K��RA$@Io_x � #�4���Thψw�$=ͲnR	��(06:�L�ih����������q�Pk�#?�j����q���C��C�]�)ޮ@zф�X/�w'��4 �3RXn,���+Ԓ�{�gI�~�f�q7���f�����(KO��Z�s)�
�.H&\{���X
�ҫP�7-}�E����c�Ta���5P�XU�8�\���c�k��P=�ae�V�~��ߒjj�-^����aL���!����+�L];/j[�@?�@���uŵ��b��|��e�q�k"q�z�LNׄKL�~��;�P|�9ˣ��o�??W넢b����-��'��-1dm.��*����%N]�����k��gg^�]��ѽ.zَu����5��n��-ݴa��ݕW��Ӫ%ME�Sȶ|��!tuy���[�H����3�4�CR�X��̈��v����+����K8�MMIP̋o����`װtC��^�,�:�t(�
�;^w�F�>RK�<�C���E�{i�F�I�KV	�|Z�8�G�,]�?��q�]z|���U��>.V8�4M�u��)�[��X���Nԙ
V+Z���2�}nǫ����7����Xo(oZ��yV7(��k�E`���uM�L�('I�D��o��@E"�*��m$��nu����<�eW��W�Z��g���W�-�A85B����o��`ۍ�ˍA��A��R֜C�# �owww�u_�`      �   x   x��ҹ�@Cј[�sC�p�]բ��0�
���E$�����eu?������}�6��t���DJ^�$�Q�7h��h�;ɣa$���D���������M#�V�Z�A��<�vG7P;�{��~Tb�      �     x���O��0�ϓO�{Y��v��BSJ��,,��L�n�M,�d�O߱,�*]�z��c<#+�-v'�gv�U-z��iθ��}6��5Į�(���!�Y�<F�c��"�������J����;��z=�Z�Vm�՜x��V��®�3ѷ�/�ꡩG~��-��h�D��l�S���-��]f+�˩;���E5N��\/Σ�� ���l;��/h�B�]�
�K84��}�l�D�9���C��� ��g3�l׉�@�9=��@!G�<he+]�۱���()����eqtm+@�h����{1�Y�7O�9�{����)ȏa�vX�!�c3�M�q�����8���b�>'q
rR���OF!]��yk�Q"�(��9�:�!p;9�L�n��i���g�9�9�)���/t��$)�����ܩ
A8� qn�t���i�S�V¦n��]�z@2��[��J�u�W�����gӒ�� ����>�r
r��D{�wdO�m���ʹ��E�g>�}����콝���O"� ���V�?r��t      �     x���Ak�0���Wx/�$QWݣ
������'��j���������[.߼��%>�aJ�uXӗ gz���t���BK��dq�T��Uʫ�ϵ��J?�2������gܚ^���[��\0tAc�� �C_(��q�^2xI������U���^��ܼ��j��q�_q�)I���ܧ+EғXx����s��a�>��Ҽ�>6y`ҿ�f��_~�`��P��)R�6��O�I��p���|��}�O����u�Ͼ��$��G�      �   �   x�����0C���	L�#;�t�9*y�� �E�pY�~�q7|`o�oų��6�Ջ]�M`���Y�A�M�o9g`��ꂮ`�����`f
��S<t!c.��?K�9��`��'ô'����N�a;݂�`�����Mt 6RBt� �1���G��Q����8WA�T�M������+QQ�;!�̥�����r�	q�Po��:��o\�ZN�>�{J)�}�      �   |  x��ֱm0D�ڞ"}�II�,�������Bx���ǲ�_V_���ߕ�n��O;ϥцQht`�]�F��7*����at5Z0j�FnZ%�\+2w���ԋ�]�E�.�"w�&x��&y�&z��&�%�M�K���7�/�o�_��d�d��~������!�%�C�K���C���C���C��������_��_��_��_�O�_�O�_�O�_�O�_|�e�>e�>e�d��o�O�7٧��K�M�%�&��}�}ɾɾdߘY�7�O���'AF�� #�I���$��~dd?	2���O���'A���~�d?	r��9�O���'AN�� '�I���$��~�d�N~0�Hd�NٿD��	�����|�ޭ0U     