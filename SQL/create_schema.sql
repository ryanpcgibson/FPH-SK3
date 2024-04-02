-- Manually created 
DROP TABLE IF EXISTS "memory_hearts";
DROP TABLE IF EXISTS "pet_hearts";
DROP TABLE IF EXISTS "pet_memories";
DROP TABLE IF EXISTS "comments";
DROP TABLE IF EXISTS "human_connection";
DROP TABLE IF EXISTS "pet_connection";
DROP TABLE IF EXISTS "viewable_connections";
DROP TABLE IF EXISTS "connections";
DROP TABLE IF EXISTS "viewable_locations";
DROP TABLE IF EXISTS "locations";
DROP TABLE IF EXISTS "viewable_humans";
DROP TABLE IF EXISTS "humans";
DROP TABLE IF EXISTS "viewable_pets";
DROP TABLE IF EXISTS "pets";
DROP TABLE IF EXISTS "users";

DROP TYPE IF EXISTS "connection_types";
DROP TYPE IF EXISTS "location_types";
DROP TYPE IF EXISTS "animal_types";

-- Below is generated from https://dbdiagram.io/d/FPH-v2-Schema-660b8e5f03593b6b61eb773e
CREATE TYPE "animal_types" AS ENUM (
  'Dog',
  'Cat',
  'Fish',
  'Bird',
  'Rabbit',
  'Hamster',
  'Guinea pig',
  'Turtle',
  'Snake',
  'Lizard',
  'Ferret',
  'Hedgehog',
  'Sugar glider',
  'Mouse',
  'Rat',
  'Chinchilla',
  'Frog',
  'Salamander',
  'Spider',
  'Hermit crab'
);

CREATE TYPE "location_types" AS ENUM (
  'Home',
  'Neighborhood',
  'Town'
);

CREATE TYPE "connection_types" AS ENUM (
  'Friend',
  'Relative',
  'Housemate',
  'Neighbor',
  'Playmate',
  'Classmate',
  'Clubmate',
  'Superfan'
);

CREATE TABLE "users" (
  "user_id" varchar PRIMARY KEY,
  "username" varchar,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "pets" (
  "pet_id" integer PRIMARY KEY,
  "name" varchar,
  "animal_type" animal_types
);

CREATE TABLE "viewable_pets" (
  "pet_id" integer,
  "user_id" varchar
);

CREATE TABLE "humans" (
  "human_id" integer PRIMARY KEY,
  "user_id" varchar,
  "name" varchar
);

CREATE TABLE "viewable_humans" (
  "human_id" integer,
  "user_id" varchar
);

CREATE TABLE "locations" (
  "location_id" integer PRIMARY KEY,
  "name" varchar,
  "address" varchar,
  "location_type" location_types
);

CREATE TABLE "viewable_locations" (
  "location_id" integer,
  "user_id" varchar
);

CREATE TABLE "connections" (
  "connection_id" integer PRIMARY KEY,
  "start_date" date,
  "end_date" date,
  "location_id" integer,
  "connection_type" connection_types
);

CREATE TABLE "viewable_connections" (
  "connection_id" integer,
  "user_id" varchar
);

CREATE TABLE "pet_connection" (
  "connection_id" integer,
  "pet_id" integer
);

CREATE TABLE "human_connection" (
  "connection_id" integer,
  "human_id" integer
);

CREATE TABLE "comments" (
  "comment_id" integer PRIMARY KEY,
  "author_id" varchar,
  "memory_id" integer,
  "comment" varchar,
  "hidden" boolean
);

CREATE TABLE "pet_memories" (
  "memory_id" integer PRIMARY KEY,
  "pet_id" integer,
  "img_url" varchar,
  "label" varchar,
  "text" varchar,
  "location_id" integer
);

CREATE TABLE "pet_hearts" (
  "heart_id" integer PRIMARY KEY,
  "author_id" varchar,
  "pet_id" integer
);

CREATE TABLE "memory_hearts" (
  "heart_id" integer PRIMARY KEY,
  "author_id" varchar,
  "memory_id" integer
);

COMMENT ON COLUMN "users"."role" IS 'Creator, Viewer';

ALTER TABLE "viewable_pets" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("pet_id");

ALTER TABLE "viewable_pets" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "humans" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "viewable_humans" ADD FOREIGN KEY ("human_id") REFERENCES "humans" ("human_id");

ALTER TABLE "viewable_humans" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "viewable_locations" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "viewable_locations" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "connections" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "viewable_connections" ADD FOREIGN KEY ("connection_id") REFERENCES "connections" ("connection_id");

ALTER TABLE "viewable_connections" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "pet_connection" ADD FOREIGN KEY ("connection_id") REFERENCES "connections" ("connection_id");

ALTER TABLE "pet_connection" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("pet_id");

ALTER TABLE "human_connection" ADD FOREIGN KEY ("connection_id") REFERENCES "connections" ("connection_id");

ALTER TABLE "human_connection" ADD FOREIGN KEY ("human_id") REFERENCES "humans" ("human_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("memory_id") REFERENCES "pet_memories" ("memory_id");

ALTER TABLE "pet_memories" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("pet_id");

ALTER TABLE "pet_memories" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "pet_hearts" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "pet_hearts" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("pet_id");

ALTER TABLE "memory_hearts" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "memory_hearts" ADD FOREIGN KEY ("memory_id") REFERENCES "pet_memories" ("memory_id");
