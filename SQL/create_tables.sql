DROP TABLE IF EXISTS "hearts" CASCADE;
DROP TABLE IF EXISTS "comments" CASCADE;
DROP TABLE IF EXISTS "memories" CASCADE;
DROP TABLE IF EXISTS "viewable_connections" CASCADE;
DROP TABLE IF EXISTS "connections" CASCADE;
DROP TABLE IF EXISTS "viewable_locations" CASCADE;
DROP TABLE IF EXISTS "locations" CASCADE;
DROP TABLE IF EXISTS "viewable_beings" CASCADE;
DROP VIEW IF EXISTS "pets" CASCADE;
DROP VIEW IF EXISTS "humans" CASCADE;
DROP TABLE IF EXISTS "beings" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;

DROP TYPE IF EXISTS "user_types" CASCADE;
DROP TYPE IF EXISTS "connection_types" CASCADE;
DROP TYPE IF EXISTS "location_types" CASCADE;
DROP TYPE IF EXISTS "animal_types" CASCADE;
DROP TYPE IF EXISTS "being_types" CASCADE;

CREATE TYPE "being_types" AS ENUM (
  'pet',
  'human'
);

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
  'Town',
  'Class',
  'Hike'
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

CREATE TYPE "user_types" AS ENUM(
    'Creator',
    'Viewer'
);


CREATE TABLE "users" (
  "user_id" VARCHAR PRIMARY KEY,
  "username" VARCHAR,
  "role" user_types,
  "created_at" TIMESTAMP
);

CREATE TABLE "beings" (
  "being_id" INTEGER PRIMARY KEY,
  "being_type" BEING_TYPES,
  "name" TEXT,
  "start_date" DATE,
  "end_date" DATE,
  "human_user_id" VARCHAR REFERENCES "users" ("user_id"),
  "pet_animal_type" ANIMAL_TYPES
);

CREATE VIEW "humans" AS
SELECT
  "being_id",
  "name",
  "start_date",
  "end_date",
  "human_user_id" AS user_id
FROM
  "beings"
WHERE
  "being_type" = 'human';

CREATE VIEW "pets" AS
SELECT
  "being_id" AS id,
  "name",
  "start_date",
  "end_date",
  "pet_animal_type" AS animal_type
FROM
  "beings"
WHERE
  "being_type" = 'pet';

CREATE TABLE "viewable_beings" (
  "being_id" INTEGER REFERENCES "beings" ("being_id") ON DELETE CASCADE,
  "user_id" VARCHAR REFERENCES "users" ("user_id") ON DELETE CASCADE
);

CREATE TABLE "locations" (
  "location_id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "address" TEXT,
  "location_type" LOCATION_TYPES
);

CREATE TABLE "viewable_locations" (
  "location_id" INTEGER REFERENCES "locations" ("location_id"),
  "user_id" VARCHAR REFERENCES "users" ("user_id") ON DELETE CASCADE
);

CREATE TABLE "connections" (
  "connection_id" INTEGER PRIMARY KEY,
  "being_id" INTEGER REFERENCES "beings" ("being_id") ON DELETE CASCADE,
  "connected_being_id" INTEGER REFERENCES "beings" ("being_id") ON DELETE CASCADE,
  "connected_location_id" INTEGER REFERENCES "locations" ("location_id"),
  "connection_type" CONNECTION_TYPES,
  "start_date" DATE,
  "end_date" DATE
);

CREATE TABLE "viewable_connections" (
  "connection_id" INTEGER REFERENCES "connections" ("connection_id"),
  "user_id" VARCHAR REFERENCES "users" ("user_id") ON DELETE CASCADE
);

CREATE TABLE "memories" (
  "memory_id" INTEGER PRIMARY KEY,
  "being_id" INTEGER REFERENCES "beings" ("being_id") ON DELETE CASCADE,
  "img_url" TEXT,
  "label" TEXT,
  "memory_text" TEXT,
  "location_id" INTEGER REFERENCES "locations" ("location_id")
);

CREATE TABLE "comments" (
  "comment_id" INTEGER PRIMARY KEY,
  "author_id" VARCHAR REFERENCES "users" ("user_id"),
  "memory_id" INTEGER REFERENCES "memories" ("memory_id") ON DELETE CASCADE,
  "comment" TEXT,
  "hidden" BOOLEAN
);

CREATE TABLE "hearts" (
  "heart_id" INTEGER PRIMARY KEY,
  "author_id" TEXT REFERENCES "users" ("user_id") ON DELETE CASCADE,
  "being_id" INTEGER REFERENCES "beings" ("being_id") ON DELETE CASCADE,
  "memory_id" INTEGER REFERENCES "memories" ("memory_id") ON DELETE CASCADE,
  CHECK (
    (being_id IS NOT NULL AND memory_id IS NULL) OR
    (being_id IS NULL AND memory_id IS NOT NULL)
  )
);
