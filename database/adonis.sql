-- Adminer 4.7.1 PostgreSQL dump

DROP TABLE IF EXISTS "adonis_schema";
DROP SEQUENCE IF EXISTS adonis_schema_id_seq;
CREATE SEQUENCE adonis_schema_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."adonis_schema" (
    "id" integer DEFAULT nextval('adonis_schema_id_seq') NOT NULL,
    "name" character varying(255),
    "batch" integer,
    "migration_time" timestamptz DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "adonis_schema_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "adonis_schema" ("id", "name", "batch", "migration_time") VALUES
(1,	'1503248427885_user',	1,	'2019-06-26 14:22:06.024569+07'),
(2,	'1503248427886_token',	1,	'2019-06-26 14:22:06.43373+07'),
(3,	'1523982733759_posts_schema',	1,	'2019-06-26 14:22:06.652029+07'),
(4,	'1524031858632_password_reset_schema',	1,	'2019-06-26 14:22:06.836634+07');

DROP TABLE IF EXISTS "password_resets";
DROP SEQUENCE IF EXISTS password_resets_id_seq;
CREATE SEQUENCE password_resets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."password_resets" (
    "id" integer DEFAULT nextval('password_resets_id_seq') NOT NULL,
    "mail" character varying(255),
    "token" character varying(255),
    "created_at" timestamptz,
    "updated_at" timestamptz,
    CONSTRAINT "password_resets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "posts";
DROP SEQUENCE IF EXISTS posts_id_seq;
CREATE SEQUENCE posts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."posts" (
    "id" integer DEFAULT nextval('posts_id_seq') NOT NULL,
    "title" character varying(255),
    "body" character varying(255),
    "created_at" timestamptz,
    "updated_at" timestamptz,
    CONSTRAINT "posts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tokens";
DROP SEQUENCE IF EXISTS tokens_id_seq;
CREATE SEQUENCE tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tokens" (
    "id" integer DEFAULT nextval('tokens_id_seq') NOT NULL,
    "user_id" integer,
    "token" character varying(255) NOT NULL,
    "type" character varying(80) NOT NULL,
    "is_revoked" boolean DEFAULT false,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    CONSTRAINT "tokens_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "tokens_token_unique" UNIQUE ("token"),
    CONSTRAINT "tokens_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "tokens_token_index" ON "public"."tokens" USING btree ("token");


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "username" character varying(80) NOT NULL,
    "email" character varying(254) NOT NULL,
    "password" character varying(60) NOT NULL,
    "confirmation_token" character varying(255),
    "is_active" boolean DEFAULT false,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    CONSTRAINT "users_email_unique" UNIQUE ("email"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_username_unique" UNIQUE ("username")
) WITH (oids = false);

INSERT INTO "users" ("id", "username", "email", "password", "confirmation_token", "is_active", "created_at", "updated_at") VALUES
(1,	'admin',	'annaftrna16@gmail.com',	'$2a$10$afc6M5Bd31ms5PNjzrHhXuNngXev2wG3tAtaccZoWH6SUNcVYpGem',	'UJFPdD4XDFr91yLMlw7t7A0HqvYdWD7y12xWiqIE',	'f',	'2019-06-26 14:23:49+07',	'2019-06-26 14:23:49+07'),
(2,	'adminadmin',	'annalucu16@gmail.com',	'$2a$10$4XElaWHRW8rAvtIdDshDyuzhJL/QQo0ny6zcrmIHrGqsBZJ18BjEi',	'ZbHVBYzFO1jDOoJEMU3WT1wmJfkqFR7Wss5WE8oo',	'f',	'2019-06-26 14:34:39+07',	'2019-06-26 14:34:39+07'),
(3,	'nnaftr',	'annaaaaaaaaalucu16@gmail.com',	'$2a$10$ctDTnFlXEHCmYsgSAfdBcuUZE65ydMJ1LvxKSzS1Vtn5lgiFwh6mq',	'jeGZDbVztX8qPenZZV4Xfe9F3WzP2oc4ii4elR1V',	'f',	'2019-06-26 14:34:55+07',	'2019-06-26 14:34:55+07'),
(4,	'ris',	'ris22@gmail.com',	'$2a$10$hWmB4orvsbmKkmkIT5bBueXuHbEuWzaiRt6.WDxHKuTzuYcjSUpfy',	NULL,	't',	'2019-06-26 15:27:01+07',	'2019-06-26 15:28:36+07'),
(5,	'hiyahiya',	'hiyaaaa@gmail.com',	'$2a$10$LHNRl641czPVUlU6htA1YeJRvlG9YuC1L.5ljgTT0jSIGg/z9CUNi',	NULL,	't',	'2019-06-26 15:29:13+07',	'2019-06-26 15:29:25+07');

-- 2019-07-01 17:04:38.998383+07
