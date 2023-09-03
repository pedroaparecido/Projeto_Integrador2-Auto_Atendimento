CREATE TABLE public."order" (
    id integer NOT NULL,
    total numeric(8,2) NOT NULL
);

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY public."order" 
	ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);

CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id);
		
ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_quantity_ck CHECK (quantity > 0);		
