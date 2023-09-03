CREATE TABLE public.banner (
    id integer NOT NULL,
    image text NOT NULL
);

CREATE SEQUENCE public.banner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.company (
    id integer NOT NULL,
    legal_name text NOT NULL,
    trade_name text NOT NULL,
    cnpj text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    street text NOT NULL,
    street_number text NOT NULL,
    neighborhood text NOT NULL,
    city text NOT NULL,
    postal_code text NOT NULL,
    facebook text NOT NULL,
    instagram text NOT NULL,
    whatsapp text NOT NULL,
    mission text NOT NULL,
    vision text NOT NULL,
    "values" text NOT NULL,
    password text NOT NULL
);

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.product (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price numeric(8,2) NOT NULL,
    image text NOT NULL
);

CREATE TABLE public.product_category (
    id integer NOT NULL,
    name text NOT NULL
);

CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY public.banner ALTER COLUMN id SET DEFAULT nextval('public.banner_id_seq'::regclass);

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);

ALTER TABLE ONLY public.banner
    ADD CONSTRAINT banner_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_email_key UNIQUE (email);

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_name_key UNIQUE (name);

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_category_id_fkey FOREIGN KEY (product_category_id) REFERENCES public.product_category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

