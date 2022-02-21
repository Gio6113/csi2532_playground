CREATE TABLE schema_migrations (
 migration varchar(255),
 migrated_at time,
 PRIMARY KEY (migration)
);
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220214214412-create-athletes.sql', '2022-02-14 21:44:12');
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220217151234-create-migrations.sql', '2022-02-17 15:12:24');