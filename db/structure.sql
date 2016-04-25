CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "zone" varchar, "picture_url" varchar, "minutes_offset" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "drinks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "image_url" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "drink_country_mappings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "country_id" integer, "drink_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_drink_country_mappings_on_drink_id_and_country_id" ON "drink_country_mappings" ("drink_id", "country_id");
CREATE UNIQUE INDEX "index_drink_country_mappings_on_country_id_and_drink_id" ON "drink_country_mappings" ("country_id", "drink_id");
INSERT INTO schema_migrations (version) VALUES ('20151101041924');

INSERT INTO schema_migrations (version) VALUES ('20151102174617');

INSERT INTO schema_migrations (version) VALUES ('20151102174932');

