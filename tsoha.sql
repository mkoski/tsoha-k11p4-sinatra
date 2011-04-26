CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL
    )
CREATE UNIQUE INDEX "unique_users_username" ON "users" (
    "username"
    )
CREATE TABLE "compact_discs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" VARCHAR(255) NOT NULL,
    "artist" VARCHAR(255) NOT NULL,
    "released" INTEGER,
    "record_company" VARCHAR(255),
    "genre" VARCHAR(255),
    "picture" TEXT
    )
CREATE TABLE "artists" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" VARCHAR(255) NOT NULL,
    "bio" TEXT
    )