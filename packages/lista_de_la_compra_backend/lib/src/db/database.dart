import 'package:drift/drift.dart';
import 'environments.dart';
import 'house_model.dart';
import 'http_server_model.dart';
import 'needed_product_model.dart';
import 'product_model.dart';

part 'database.g.dart';

typedef Environment = Enviroment;

@DriftDatabase(
  tables: [
    Houses,
    NeededProducts,
    Products,
    HttpServer,
    Enviroments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await customStatement('DROP TABLE IF EXISTS product_aisles');
        await customStatement('DROP TABLE IF EXISTS aisles');
        await customStatement('DROP TABLE IF EXISTS super_markets');
      }
      if (from < 3) {
        await customStatement('''
          CREATE TABLE IF NOT EXISTS houses (
            id TEXT NOT NULL PRIMARY KEY,
            name TEXT NOT NULL,
            enviroment_id TEXT NOT NULL REFERENCES enviroments(id),
            updated_at INTEGER NOT NULL,
            deleted_at INTEGER
          )
        ''');
        await customStatement('''
          CREATE TABLE IF NOT EXISTS needed_products (
            id TEXT NOT NULL PRIMARY KEY,
            house_id TEXT NOT NULL REFERENCES houses(id),
            product_id TEXT NOT NULL REFERENCES products(id),
            updated_at INTEGER NOT NULL,
            deleted_at INTEGER
          )
        ''');
        await customStatement('''
          INSERT OR IGNORE INTO houses
            (id, name, enviroment_id, updated_at, deleted_at)
          SELECT
            'default_house_' || e.id,
            'rename_me',
            e.id,
            COALESCE(
              (SELECT MAX(updated_at)
               FROM products
               WHERE enviroment_id = e.id AND needed = 1), 0),
            NULL
          FROM enviroments e
          WHERE EXISTS (
            SELECT 1 FROM products
            WHERE enviroment_id = e.id AND needed = 1
          )
        ''');
        await customStatement('''
          INSERT OR IGNORE INTO needed_products
            (id, house_id, product_id, updated_at, deleted_at)
          SELECT
            'np_' || p.id,
            'default_house_' || p.enviroment_id,
            p.id,
            p.updated_at,
            NULL
          FROM products p
          WHERE p.needed = 1
        ''');
        await customStatement('''
          CREATE TABLE products_new (
            id TEXT NOT NULL PRIMARY KEY,
            name TEXT NOT NULL,
            updated_at INTEGER NOT NULL,
            deleted_at INTEGER,
            enviroment_id TEXT NOT NULL REFERENCES enviroments(id)
          )
        ''');
        await customStatement('''
          INSERT INTO products_new
            (id, name, updated_at, deleted_at, enviroment_id)
          SELECT id, name, updated_at, deleted_at, enviroment_id
          FROM products
        ''');
        await customStatement('DROP TABLE products');
        await customStatement('ALTER TABLE products_new RENAME TO products');
      }
      if (from < 4) {
        await customStatement('ALTER TABLE houses ADD COLUMN color INTEGER');
      }
      if (from < 5) {
        await customStatement(
          'UPDATE houses SET color = 4294198070 WHERE color IS NULL',
        );
      }
      if (from < 6) {
        await customStatement('''
          INSERT OR IGNORE INTO houses
            (id, name, enviroment_id, updated_at, deleted_at, color)
          SELECT DISTINCT
            'default_house_' || r.enviroment_id,
            'rename_me',
            r.enviroment_id,
            0,
            NULL,
            4294198070
          FROM schedule_entries s
          INNER JOIN recipes r ON r.id = s.recipe_id
          WHERE NOT EXISTS (
            SELECT 1 FROM houses h
            WHERE h.enviroment_id = r.enviroment_id
          )
        ''');
        await customStatement(
          'ALTER TABLE schedule_entries ADD COLUMN house_id TEXT REFERENCES houses(id)',
        );
        await customStatement('''
          UPDATE schedule_entries
          SET house_id = (
            SELECT h.id
            FROM houses h
            INNER JOIN recipes r ON r.id = schedule_entries.recipe_id
            WHERE h.enviroment_id = r.enviroment_id
            LIMIT 1
          )
          WHERE house_id IS NULL
        ''');
      }
      if (from < 7) {
        // The stripped-down fork no longer uses recipes, schedules,
        // supermarkets, aisles, product-aisle mappings, or map tiles.
        await customStatement('DROP TABLE IF EXISTS product_aisles');
        await customStatement('DROP TABLE IF EXISTS aisles');
        await customStatement('DROP TABLE IF EXISTS super_markets');
        await customStatement('DROP TABLE IF EXISTS schedule_entries');
        await customStatement('DROP TABLE IF EXISTS recipe_products');
        await customStatement('DROP TABLE IF EXISTS recipes');
        await customStatement('DROP TABLE IF EXISTS map_tiles');
      }
    },
  );
}

class AppDatabaseSingleton {
  static AppDatabase? _instance;

  static AppDatabase get instance => _instance!;

  static setQueryExecutor(QueryExecutor queryExecutor) {
    _instance = AppDatabase(queryExecutor);
  }

  AppDatabaseSingleton._();
}
