-- DROP SCHEMA "transaction";

CREATE SCHEMA "transaction" AUTHORIZATION "admin";

-- DROP SEQUENCE "transaction".address_id_seq;

CREATE SEQUENCE "transaction".address_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".customer_id_seq;

CREATE SEQUENCE "transaction".customer_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".insurance_id_seq;

CREATE SEQUENCE "transaction".insurance_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".payment_method_id_seq;

CREATE SEQUENCE "transaction".payment_method_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".product_id_seq;

CREATE SEQUENCE "transaction".product_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".seller_id_seq;

CREATE SEQUENCE "transaction".seller_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "transaction".shipment_id_seq;

CREATE SEQUENCE "transaction".shipment_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- "transaction".customer definition

-- Drop table

-- DROP TABLE "transaction".customer;

CREATE TABLE "transaction".customer (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id)
);


-- "transaction".insurance definition

-- Drop table

-- DROP TABLE "transaction".insurance;

CREATE TABLE "transaction".insurance (
	id serial4 NOT NULL,
	premium_price int4 NOT NULL,
	vendor varchar(255) NOT NULL,
	CONSTRAINT insurance_pkey PRIMARY KEY (id)
);


-- "transaction".payment_method definition

-- Drop table

-- DROP TABLE "transaction".payment_method;

CREATE TABLE "transaction".payment_method (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT payment_method_pkey PRIMARY KEY (id)
);


-- "transaction".seller definition

-- Drop table

-- DROP TABLE "transaction".seller;

CREATE TABLE "transaction".seller (
	id serial4 NOT NULL,
	username varchar(255) NOT NULL,
	CONSTRAINT seller_pkey PRIMARY KEY (id)
);


-- "transaction".shipment definition

-- Drop table

-- DROP TABLE "transaction".shipment;

CREATE TABLE "transaction".shipment (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	shipment_fee int4 NOT NULL,
	CONSTRAINT shipment_pkey PRIMARY KEY (id)
);


-- "transaction".address definition

-- Drop table

-- DROP TABLE "transaction".address;

CREATE TABLE "transaction".address (
	id serial4 NOT NULL,
	customer_id int4 NOT NULL,
	provinsi varchar(255) NULL,
	kabupaten varchar(255) NULL,
	kecamatan varchar(255) NULL,
	kelurahan varchar(255) NULL,
	kode_pos int4 NULL,
	jalan varchar(255) NULL,
	CONSTRAINT address_pkey PRIMARY KEY (id),
	CONSTRAINT address_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "transaction".customer(id) ON DELETE CASCADE
);


-- "transaction".invoice definition

-- Drop table

-- DROP TABLE "transaction".invoice;

CREATE TABLE "transaction".invoice (
	id varchar(50) NOT NULL,
	seller_id int4 NOT NULL,
	customer_id int4 NOT NULL,
	shipment_id int4 NULL,
	insurance_id int4 NULL,
	payment_id int4 NULL,
	CONSTRAINT invoice_pkey PRIMARY KEY (id),
	CONSTRAINT invoice_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "transaction".customer(id) ON DELETE CASCADE,
	CONSTRAINT invoice_insurance_id_fkey FOREIGN KEY (insurance_id) REFERENCES "transaction".insurance(id) ON DELETE SET NULL,
	CONSTRAINT invoice_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES "transaction".payment_method(id) ON DELETE SET NULL,
	CONSTRAINT invoice_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES "transaction".seller(id) ON DELETE CASCADE,
	CONSTRAINT invoice_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES "transaction".shipment(id) ON DELETE SET NULL
);


-- "transaction".product definition

-- Drop table

-- DROP TABLE "transaction".product;

CREATE TABLE "transaction".product (
	id serial4 NOT NULL,
	seller_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	price int4 NOT NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT product_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES "transaction".seller(id) ON DELETE CASCADE
);