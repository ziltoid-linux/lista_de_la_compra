// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $EnviromentsTable extends Enviroments
    with TableInfo<$EnviromentsTable, Enviroment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnviromentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enviroments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Enviroment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Enviroment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enviroment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EnviromentsTable createAlias(String alias) {
    return $EnviromentsTable(attachedDatabase, alias);
  }
}

class Enviroment extends DataClass implements Insertable<Enviroment> {
  final String id;
  final String name;
  final int updatedAt;
  const Enviroment({
    required this.id,
    required this.name,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  EnviromentsCompanion toCompanion(bool nullToAbsent) {
    return EnviromentsCompanion(
      id: Value(id),
      name: Value(name),
      updatedAt: Value(updatedAt),
    );
  }

  factory Enviroment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enviroment(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Enviroment copyWith({String? id, String? name, int? updatedAt}) => Enviroment(
    id: id ?? this.id,
    name: name ?? this.name,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Enviroment copyWithCompanion(EnviromentsCompanion data) {
    return Enviroment(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Enviroment(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enviroment &&
          other.id == this.id &&
          other.name == this.name &&
          other.updatedAt == this.updatedAt);
}

class EnviromentsCompanion extends UpdateCompanion<Enviroment> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const EnviromentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnviromentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Enviroment> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnviromentsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return EnviromentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnviromentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HousesTable extends Houses with TableInfo<$HousesTable, House> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HousesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enviromentIdMeta = const VerificationMeta(
    'enviromentId',
  );
  @override
  late final GeneratedColumn<String> enviromentId = GeneratedColumn<String>(
    'enviroment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES enviroments (id)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0xFFF44336,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    enviromentId,
    updatedAt,
    deletedAt,
    color,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'houses';
  @override
  VerificationContext validateIntegrity(
    Insertable<House> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('enviroment_id')) {
      context.handle(
        _enviromentIdMeta,
        enviromentId.isAcceptableOrUnknown(
          data['enviroment_id']!,
          _enviromentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enviromentIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  House map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return House(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      enviromentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enviroment_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
    );
  }

  @override
  $HousesTable createAlias(String alias) {
    return $HousesTable(attachedDatabase, alias);
  }
}

class House extends DataClass implements Insertable<House> {
  final String id;
  final String name;
  final String enviromentId;
  final int updatedAt;
  final int? deletedAt;
  final int color;
  const House({
    required this.id,
    required this.name,
    required this.enviromentId,
    required this.updatedAt,
    this.deletedAt,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['enviroment_id'] = Variable<String>(enviromentId);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['color'] = Variable<int>(color);
    return map;
  }

  HousesCompanion toCompanion(bool nullToAbsent) {
    return HousesCompanion(
      id: Value(id),
      name: Value(name),
      enviromentId: Value(enviromentId),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      color: Value(color),
    );
  }

  factory House.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return House(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      enviromentId: serializer.fromJson<String>(json['enviromentId']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'enviromentId': serializer.toJson<String>(enviromentId),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'color': serializer.toJson<int>(color),
    };
  }

  House copyWith({
    String? id,
    String? name,
    String? enviromentId,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    int? color,
  }) => House(
    id: id ?? this.id,
    name: name ?? this.name,
    enviromentId: enviromentId ?? this.enviromentId,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    color: color ?? this.color,
  );
  House copyWithCompanion(HousesCompanion data) {
    return House(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      enviromentId: data.enviromentId.present
          ? data.enviromentId.value
          : this.enviromentId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('House(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enviromentId: $enviromentId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, enviromentId, updatedAt, deletedAt, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is House &&
          other.id == this.id &&
          other.name == this.name &&
          other.enviromentId == this.enviromentId &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.color == this.color);
}

class HousesCompanion extends UpdateCompanion<House> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> enviromentId;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<int> color;
  final Value<int> rowid;
  const HousesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.enviromentId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HousesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String enviromentId,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       enviromentId = Value(enviromentId);
  static Insertable<House> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? enviromentId,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (enviromentId != null) 'enviroment_id': enviromentId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HousesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? enviromentId,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<int>? color,
    Value<int>? rowid,
  }) {
    return HousesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      enviromentId: enviromentId ?? this.enviromentId,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (enviromentId.present) {
      map['enviroment_id'] = Variable<String>(enviromentId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HousesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('enviromentId: $enviromentId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enviromentIdMeta = const VerificationMeta(
    'enviromentId',
  );
  @override
  late final GeneratedColumn<String> enviromentId = GeneratedColumn<String>(
    'enviroment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES enviroments (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    updatedAt,
    deletedAt,
    enviromentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('enviroment_id')) {
      context.handle(
        _enviromentIdMeta,
        enviromentId.isAcceptableOrUnknown(
          data['enviroment_id']!,
          _enviromentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enviromentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
      enviromentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enviroment_id'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;
  final int updatedAt;
  final int? deletedAt;
  final String enviromentId;
  const Product({
    required this.id,
    required this.name,
    required this.updatedAt,
    this.deletedAt,
    required this.enviromentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    map['enviroment_id'] = Variable<String>(enviromentId);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      enviromentId: Value(enviromentId),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
      enviromentId: serializer.fromJson<String>(json['enviromentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
      'enviromentId': serializer.toJson<String>(enviromentId),
    };
  }

  Product copyWith({
    String? id,
    String? name,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
    String? enviromentId,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    enviromentId: enviromentId ?? this.enviromentId,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      enviromentId: data.enviromentId.present
          ? data.enviromentId.value
          : this.enviromentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('enviromentId: $enviromentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, updatedAt, deletedAt, enviromentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.enviromentId == this.enviromentId);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<String> enviromentId;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.enviromentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String enviromentId,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       enviromentId = Value(enviromentId);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<String>? enviromentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (enviromentId != null) 'enviroment_id': enviromentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<String>? enviromentId,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      enviromentId: enviromentId ?? this.enviromentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (enviromentId.present) {
      map['enviroment_id'] = Variable<String>(enviromentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('enviromentId: $enviromentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NeededProductsTable extends NeededProducts
    with TableInfo<$NeededProductsTable, NeededProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NeededProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES houses (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    productId,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'needed_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<NeededProduct> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NeededProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NeededProduct(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $NeededProductsTable createAlias(String alias) {
    return $NeededProductsTable(attachedDatabase, alias);
  }
}

class NeededProduct extends DataClass implements Insertable<NeededProduct> {
  final String id;
  final String houseId;
  final String productId;
  final int updatedAt;
  final int? deletedAt;
  const NeededProduct({
    required this.id,
    required this.houseId,
    required this.productId,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['product_id'] = Variable<String>(productId);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  NeededProductsCompanion toCompanion(bool nullToAbsent) {
    return NeededProductsCompanion(
      id: Value(id),
      houseId: Value(houseId),
      productId: Value(productId),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory NeededProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NeededProduct(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      productId: serializer.fromJson<String>(json['productId']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      deletedAt: serializer.fromJson<int?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'productId': serializer.toJson<String>(productId),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'deletedAt': serializer.toJson<int?>(deletedAt),
    };
  }

  NeededProduct copyWith({
    String? id,
    String? houseId,
    String? productId,
    int? updatedAt,
    Value<int?> deletedAt = const Value.absent(),
  }) => NeededProduct(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    productId: productId ?? this.productId,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  NeededProduct copyWithCompanion(NeededProductsCompanion data) {
    return NeededProduct(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      productId: data.productId.present ? data.productId.value : this.productId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NeededProduct(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('productId: $productId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, houseId, productId, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NeededProduct &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.productId == this.productId &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class NeededProductsCompanion extends UpdateCompanion<NeededProduct> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<String> productId;
  final Value<int> updatedAt;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const NeededProductsCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.productId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NeededProductsCompanion.insert({
    this.id = const Value.absent(),
    required String houseId,
    required String productId,
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : houseId = Value(houseId),
       productId = Value(productId);
  static Insertable<NeededProduct> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<String>? productId,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (productId != null) 'product_id': productId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NeededProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<String>? productId,
    Value<int>? updatedAt,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return NeededProductsCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      productId: productId ?? this.productId,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NeededProductsCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('productId: $productId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HttpServerTable extends HttpServer
    with TableInfo<$HttpServerTable, HttpServerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HttpServerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _httpHostMeta = const VerificationMeta(
    'httpHost',
  );
  @override
  late final GeneratedColumn<String> httpHost = GeneratedColumn<String>(
    'http_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _httpPortMeta = const VerificationMeta(
    'httpPort',
  );
  @override
  late final GeneratedColumn<int> httpPort = GeneratedColumn<int>(
    'http_port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nickMeta = const VerificationMeta('nick');
  @override
  late final GeneratedColumn<String> nick = GeneratedColumn<String>(
    'nick',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, httpHost, httpPort, nick];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'http_server';
  @override
  VerificationContext validateIntegrity(
    Insertable<HttpServerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('http_host')) {
      context.handle(
        _httpHostMeta,
        httpHost.isAcceptableOrUnknown(data['http_host']!, _httpHostMeta),
      );
    } else if (isInserting) {
      context.missing(_httpHostMeta);
    }
    if (data.containsKey('http_port')) {
      context.handle(
        _httpPortMeta,
        httpPort.isAcceptableOrUnknown(data['http_port']!, _httpPortMeta),
      );
    } else if (isInserting) {
      context.missing(_httpPortMeta);
    }
    if (data.containsKey('nick')) {
      context.handle(
        _nickMeta,
        nick.isAcceptableOrUnknown(data['nick']!, _nickMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HttpServerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HttpServerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      httpHost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}http_host'],
      )!,
      httpPort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}http_port'],
      )!,
      nick: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nick'],
      ),
    );
  }

  @override
  $HttpServerTable createAlias(String alias) {
    return $HttpServerTable(attachedDatabase, alias);
  }
}

class HttpServerData extends DataClass implements Insertable<HttpServerData> {
  final String id;
  final String httpHost;
  final int httpPort;
  final String? nick;
  const HttpServerData({
    required this.id,
    required this.httpHost,
    required this.httpPort,
    this.nick,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['http_host'] = Variable<String>(httpHost);
    map['http_port'] = Variable<int>(httpPort);
    if (!nullToAbsent || nick != null) {
      map['nick'] = Variable<String>(nick);
    }
    return map;
  }

  HttpServerCompanion toCompanion(bool nullToAbsent) {
    return HttpServerCompanion(
      id: Value(id),
      httpHost: Value(httpHost),
      httpPort: Value(httpPort),
      nick: nick == null && nullToAbsent ? const Value.absent() : Value(nick),
    );
  }

  factory HttpServerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HttpServerData(
      id: serializer.fromJson<String>(json['id']),
      httpHost: serializer.fromJson<String>(json['httpHost']),
      httpPort: serializer.fromJson<int>(json['httpPort']),
      nick: serializer.fromJson<String?>(json['nick']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'httpHost': serializer.toJson<String>(httpHost),
      'httpPort': serializer.toJson<int>(httpPort),
      'nick': serializer.toJson<String?>(nick),
    };
  }

  HttpServerData copyWith({
    String? id,
    String? httpHost,
    int? httpPort,
    Value<String?> nick = const Value.absent(),
  }) => HttpServerData(
    id: id ?? this.id,
    httpHost: httpHost ?? this.httpHost,
    httpPort: httpPort ?? this.httpPort,
    nick: nick.present ? nick.value : this.nick,
  );
  HttpServerData copyWithCompanion(HttpServerCompanion data) {
    return HttpServerData(
      id: data.id.present ? data.id.value : this.id,
      httpHost: data.httpHost.present ? data.httpHost.value : this.httpHost,
      httpPort: data.httpPort.present ? data.httpPort.value : this.httpPort,
      nick: data.nick.present ? data.nick.value : this.nick,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HttpServerData(')
          ..write('id: $id, ')
          ..write('httpHost: $httpHost, ')
          ..write('httpPort: $httpPort, ')
          ..write('nick: $nick')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, httpHost, httpPort, nick);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HttpServerData &&
          other.id == this.id &&
          other.httpHost == this.httpHost &&
          other.httpPort == this.httpPort &&
          other.nick == this.nick);
}

class HttpServerCompanion extends UpdateCompanion<HttpServerData> {
  final Value<String> id;
  final Value<String> httpHost;
  final Value<int> httpPort;
  final Value<String?> nick;
  final Value<int> rowid;
  const HttpServerCompanion({
    this.id = const Value.absent(),
    this.httpHost = const Value.absent(),
    this.httpPort = const Value.absent(),
    this.nick = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HttpServerCompanion.insert({
    this.id = const Value.absent(),
    required String httpHost,
    required int httpPort,
    this.nick = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : httpHost = Value(httpHost),
       httpPort = Value(httpPort);
  static Insertable<HttpServerData> custom({
    Expression<String>? id,
    Expression<String>? httpHost,
    Expression<int>? httpPort,
    Expression<String>? nick,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (httpHost != null) 'http_host': httpHost,
      if (httpPort != null) 'http_port': httpPort,
      if (nick != null) 'nick': nick,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HttpServerCompanion copyWith({
    Value<String>? id,
    Value<String>? httpHost,
    Value<int>? httpPort,
    Value<String?>? nick,
    Value<int>? rowid,
  }) {
    return HttpServerCompanion(
      id: id ?? this.id,
      httpHost: httpHost ?? this.httpHost,
      httpPort: httpPort ?? this.httpPort,
      nick: nick ?? this.nick,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (httpHost.present) {
      map['http_host'] = Variable<String>(httpHost.value);
    }
    if (httpPort.present) {
      map['http_port'] = Variable<int>(httpPort.value);
    }
    if (nick.present) {
      map['nick'] = Variable<String>(nick.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HttpServerCompanion(')
          ..write('id: $id, ')
          ..write('httpHost: $httpHost, ')
          ..write('httpPort: $httpPort, ')
          ..write('nick: $nick, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EnviromentsTable enviroments = $EnviromentsTable(this);
  late final $HousesTable houses = $HousesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $NeededProductsTable neededProducts = $NeededProductsTable(this);
  late final $HttpServerTable httpServer = $HttpServerTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    enviroments,
    houses,
    products,
    neededProducts,
    httpServer,
  ];
}

typedef $$EnviromentsTableCreateCompanionBuilder =
    EnviromentsCompanion Function({
      Value<String> id,
      required String name,
      Value<int> updatedAt,
      Value<int> rowid,
    });
typedef $$EnviromentsTableUpdateCompanionBuilder =
    EnviromentsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$EnviromentsTableReferences
    extends BaseReferences<_$AppDatabase, $EnviromentsTable, Enviroment> {
  $$EnviromentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HousesTable, List<House>> _housesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.houses,
    aliasName: 'enviroments__id__houses__enviroment_id',
  );

  $$HousesTableProcessedTableManager get housesRefs {
    final manager = $$HousesTableTableManager(
      $_db,
      $_db.houses,
    ).filter((f) => f.enviromentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_housesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: 'enviroments__id__products__enviroment_id',
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.enviromentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EnviromentsTableFilterComposer
    extends Composer<_$AppDatabase, $EnviromentsTable> {
  $$EnviromentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> housesRefs(
    Expression<bool> Function($$HousesTableFilterComposer f) f,
  ) {
    final $$HousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.enviromentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableFilterComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.enviromentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnviromentsTableOrderingComposer
    extends Composer<_$AppDatabase, $EnviromentsTable> {
  $$EnviromentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnviromentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnviromentsTable> {
  $$EnviromentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> housesRefs<T extends Object>(
    Expression<T> Function($$HousesTableAnnotationComposer a) f,
  ) {
    final $$HousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.enviromentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableAnnotationComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.enviromentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnviromentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnviromentsTable,
          Enviroment,
          $$EnviromentsTableFilterComposer,
          $$EnviromentsTableOrderingComposer,
          $$EnviromentsTableAnnotationComposer,
          $$EnviromentsTableCreateCompanionBuilder,
          $$EnviromentsTableUpdateCompanionBuilder,
          (Enviroment, $$EnviromentsTableReferences),
          Enviroment,
          PrefetchHooks Function({bool housesRefs, bool productsRefs})
        > {
  $$EnviromentsTableTableManager(_$AppDatabase db, $EnviromentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnviromentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnviromentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnviromentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnviromentsCompanion(
                id: id,
                name: name,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnviromentsCompanion.insert(
                id: id,
                name: name,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EnviromentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({housesRefs = false, productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (housesRefs) db.houses,
                if (productsRefs) db.products,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (housesRefs)
                    await $_getPrefetchedData<
                      Enviroment,
                      $EnviromentsTable,
                      House
                    >(
                      currentTable: table,
                      referencedTable: $$EnviromentsTableReferences
                          ._housesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EnviromentsTableReferences(
                            db,
                            table,
                            p0,
                          ).housesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.enviromentId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (productsRefs)
                    await $_getPrefetchedData<
                      Enviroment,
                      $EnviromentsTable,
                      Product
                    >(
                      currentTable: table,
                      referencedTable: $$EnviromentsTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EnviromentsTableReferences(
                            db,
                            table,
                            p0,
                          ).productsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.enviromentId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EnviromentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnviromentsTable,
      Enviroment,
      $$EnviromentsTableFilterComposer,
      $$EnviromentsTableOrderingComposer,
      $$EnviromentsTableAnnotationComposer,
      $$EnviromentsTableCreateCompanionBuilder,
      $$EnviromentsTableUpdateCompanionBuilder,
      (Enviroment, $$EnviromentsTableReferences),
      Enviroment,
      PrefetchHooks Function({bool housesRefs, bool productsRefs})
    >;
typedef $$HousesTableCreateCompanionBuilder =
    HousesCompanion Function({
      Value<String> id,
      required String name,
      required String enviromentId,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<int> color,
      Value<int> rowid,
    });
typedef $$HousesTableUpdateCompanionBuilder =
    HousesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> enviromentId,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<int> color,
      Value<int> rowid,
    });

final class $$HousesTableReferences
    extends BaseReferences<_$AppDatabase, $HousesTable, House> {
  $$HousesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EnviromentsTable _enviromentIdTable(_$AppDatabase db) =>
      db.enviroments.createAlias('houses__enviroment_id__enviroments__id');

  $$EnviromentsTableProcessedTableManager get enviromentId {
    final $_column = $_itemColumn<String>('enviroment_id')!;

    final manager = $$EnviromentsTableTableManager(
      $_db,
      $_db.enviroments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_enviromentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NeededProductsTable, List<NeededProduct>>
  _neededProductsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.neededProducts,
    aliasName: 'houses__id__needed_products__house_id',
  );

  $$NeededProductsTableProcessedTableManager get neededProductsRefs {
    final manager = $$NeededProductsTableTableManager(
      $_db,
      $_db.neededProducts,
    ).filter((f) => f.houseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_neededProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HousesTableFilterComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  $$EnviromentsTableFilterComposer get enviromentId {
    final $$EnviromentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableFilterComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> neededProductsRefs(
    Expression<bool> Function($$NeededProductsTableFilterComposer f) f,
  ) {
    final $$NeededProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.neededProducts,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NeededProductsTableFilterComposer(
            $db: $db,
            $table: $db.neededProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HousesTableOrderingComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  $$EnviromentsTableOrderingComposer get enviromentId {
    final $$EnviromentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableOrderingComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HousesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  $$EnviromentsTableAnnotationComposer get enviromentId {
    final $$EnviromentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableAnnotationComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> neededProductsRefs<T extends Object>(
    Expression<T> Function($$NeededProductsTableAnnotationComposer a) f,
  ) {
    final $$NeededProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.neededProducts,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NeededProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.neededProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HousesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HousesTable,
          House,
          $$HousesTableFilterComposer,
          $$HousesTableOrderingComposer,
          $$HousesTableAnnotationComposer,
          $$HousesTableCreateCompanionBuilder,
          $$HousesTableUpdateCompanionBuilder,
          (House, $$HousesTableReferences),
          House,
          PrefetchHooks Function({bool enviromentId, bool neededProductsRefs})
        > {
  $$HousesTableTableManager(_$AppDatabase db, $HousesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HousesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HousesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HousesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> enviromentId = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HousesCompanion(
                id: id,
                name: name,
                enviromentId: enviromentId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required String enviromentId,
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HousesCompanion.insert(
                id: id,
                name: name,
                enviromentId: enviromentId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$HousesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({enviromentId = false, neededProductsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (neededProductsRefs) db.neededProducts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (enviromentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.enviromentId,
                                    referencedTable: $$HousesTableReferences
                                        ._enviromentIdTable(db),
                                    referencedColumn: $$HousesTableReferences
                                        ._enviromentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (neededProductsRefs)
                        await $_getPrefetchedData<
                          House,
                          $HousesTable,
                          NeededProduct
                        >(
                          currentTable: table,
                          referencedTable: $$HousesTableReferences
                              ._neededProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HousesTableReferences(
                                db,
                                table,
                                p0,
                              ).neededProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.houseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HousesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HousesTable,
      House,
      $$HousesTableFilterComposer,
      $$HousesTableOrderingComposer,
      $$HousesTableAnnotationComposer,
      $$HousesTableCreateCompanionBuilder,
      $$HousesTableUpdateCompanionBuilder,
      (House, $$HousesTableReferences),
      House,
      PrefetchHooks Function({bool enviromentId, bool neededProductsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      required String name,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      required String enviromentId,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<String> enviromentId,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EnviromentsTable _enviromentIdTable(_$AppDatabase db) =>
      db.enviroments.createAlias('products__enviroment_id__enviroments__id');

  $$EnviromentsTableProcessedTableManager get enviromentId {
    final $_column = $_itemColumn<String>('enviroment_id')!;

    final manager = $$EnviromentsTableTableManager(
      $_db,
      $_db.enviroments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_enviromentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NeededProductsTable, List<NeededProduct>>
  _neededProductsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.neededProducts,
    aliasName: 'products__id__needed_products__product_id',
  );

  $$NeededProductsTableProcessedTableManager get neededProductsRefs {
    final manager = $$NeededProductsTableTableManager(
      $_db,
      $_db.neededProducts,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_neededProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EnviromentsTableFilterComposer get enviromentId {
    final $$EnviromentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableFilterComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> neededProductsRefs(
    Expression<bool> Function($$NeededProductsTableFilterComposer f) f,
  ) {
    final $$NeededProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.neededProducts,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NeededProductsTableFilterComposer(
            $db: $db,
            $table: $db.neededProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EnviromentsTableOrderingComposer get enviromentId {
    final $$EnviromentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableOrderingComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$EnviromentsTableAnnotationComposer get enviromentId {
    final $$EnviromentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enviromentId,
      referencedTable: $db.enviroments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnviromentsTableAnnotationComposer(
            $db: $db,
            $table: $db.enviroments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> neededProductsRefs<T extends Object>(
    Expression<T> Function($$NeededProductsTableAnnotationComposer a) f,
  ) {
    final $$NeededProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.neededProducts,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NeededProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.neededProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({bool enviromentId, bool neededProductsRefs})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<String> enviromentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                name: name,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                enviromentId: enviromentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                required String enviromentId,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                name: name,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                enviromentId: enviromentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({enviromentId = false, neededProductsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (neededProductsRefs) db.neededProducts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (enviromentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.enviromentId,
                                    referencedTable: $$ProductsTableReferences
                                        ._enviromentIdTable(db),
                                    referencedColumn: $$ProductsTableReferences
                                        ._enviromentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (neededProductsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          NeededProduct
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._neededProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).neededProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({bool enviromentId, bool neededProductsRefs})
    >;
typedef $$NeededProductsTableCreateCompanionBuilder =
    NeededProductsCompanion Function({
      Value<String> id,
      required String houseId,
      required String productId,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<int> rowid,
    });
typedef $$NeededProductsTableUpdateCompanionBuilder =
    NeededProductsCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<String> productId,
      Value<int> updatedAt,
      Value<int?> deletedAt,
      Value<int> rowid,
    });

final class $$NeededProductsTableReferences
    extends BaseReferences<_$AppDatabase, $NeededProductsTable, NeededProduct> {
  $$NeededProductsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HousesTable _houseIdTable(_$AppDatabase db) =>
      db.houses.createAlias('needed_products__house_id__houses__id');

  $$HousesTableProcessedTableManager get houseId {
    final $_column = $_itemColumn<String>('house_id')!;

    final manager = $$HousesTableTableManager(
      $_db,
      $_db.houses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_houseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('needed_products__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NeededProductsTableFilterComposer
    extends Composer<_$AppDatabase, $NeededProductsTable> {
  $$NeededProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HousesTableFilterComposer get houseId {
    final $$HousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableFilterComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NeededProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $NeededProductsTable> {
  $$NeededProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HousesTableOrderingComposer get houseId {
    final $$HousesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableOrderingComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NeededProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NeededProductsTable> {
  $$NeededProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$HousesTableAnnotationComposer get houseId {
    final $$HousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableAnnotationComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NeededProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NeededProductsTable,
          NeededProduct,
          $$NeededProductsTableFilterComposer,
          $$NeededProductsTableOrderingComposer,
          $$NeededProductsTableAnnotationComposer,
          $$NeededProductsTableCreateCompanionBuilder,
          $$NeededProductsTableUpdateCompanionBuilder,
          (NeededProduct, $$NeededProductsTableReferences),
          NeededProduct,
          PrefetchHooks Function({bool houseId, bool productId})
        > {
  $$NeededProductsTableTableManager(
    _$AppDatabase db,
    $NeededProductsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NeededProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NeededProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NeededProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NeededProductsCompanion(
                id: id,
                houseId: houseId,
                productId: productId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String houseId,
                required String productId,
                Value<int> updatedAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NeededProductsCompanion.insert(
                id: id,
                houseId: houseId,
                productId: productId,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NeededProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({houseId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (houseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.houseId,
                                referencedTable: $$NeededProductsTableReferences
                                    ._houseIdTable(db),
                                referencedColumn:
                                    $$NeededProductsTableReferences
                                        ._houseIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$NeededProductsTableReferences
                                    ._productIdTable(db),
                                referencedColumn:
                                    $$NeededProductsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NeededProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NeededProductsTable,
      NeededProduct,
      $$NeededProductsTableFilterComposer,
      $$NeededProductsTableOrderingComposer,
      $$NeededProductsTableAnnotationComposer,
      $$NeededProductsTableCreateCompanionBuilder,
      $$NeededProductsTableUpdateCompanionBuilder,
      (NeededProduct, $$NeededProductsTableReferences),
      NeededProduct,
      PrefetchHooks Function({bool houseId, bool productId})
    >;
typedef $$HttpServerTableCreateCompanionBuilder =
    HttpServerCompanion Function({
      Value<String> id,
      required String httpHost,
      required int httpPort,
      Value<String?> nick,
      Value<int> rowid,
    });
typedef $$HttpServerTableUpdateCompanionBuilder =
    HttpServerCompanion Function({
      Value<String> id,
      Value<String> httpHost,
      Value<int> httpPort,
      Value<String?> nick,
      Value<int> rowid,
    });

class $$HttpServerTableFilterComposer
    extends Composer<_$AppDatabase, $HttpServerTable> {
  $$HttpServerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get httpHost => $composableBuilder(
    column: $table.httpHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get httpPort => $composableBuilder(
    column: $table.httpPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nick => $composableBuilder(
    column: $table.nick,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HttpServerTableOrderingComposer
    extends Composer<_$AppDatabase, $HttpServerTable> {
  $$HttpServerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get httpHost => $composableBuilder(
    column: $table.httpHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get httpPort => $composableBuilder(
    column: $table.httpPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nick => $composableBuilder(
    column: $table.nick,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HttpServerTableAnnotationComposer
    extends Composer<_$AppDatabase, $HttpServerTable> {
  $$HttpServerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get httpHost =>
      $composableBuilder(column: $table.httpHost, builder: (column) => column);

  GeneratedColumn<int> get httpPort =>
      $composableBuilder(column: $table.httpPort, builder: (column) => column);

  GeneratedColumn<String> get nick =>
      $composableBuilder(column: $table.nick, builder: (column) => column);
}

class $$HttpServerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HttpServerTable,
          HttpServerData,
          $$HttpServerTableFilterComposer,
          $$HttpServerTableOrderingComposer,
          $$HttpServerTableAnnotationComposer,
          $$HttpServerTableCreateCompanionBuilder,
          $$HttpServerTableUpdateCompanionBuilder,
          (
            HttpServerData,
            BaseReferences<_$AppDatabase, $HttpServerTable, HttpServerData>,
          ),
          HttpServerData,
          PrefetchHooks Function()
        > {
  $$HttpServerTableTableManager(_$AppDatabase db, $HttpServerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HttpServerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HttpServerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HttpServerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> httpHost = const Value.absent(),
                Value<int> httpPort = const Value.absent(),
                Value<String?> nick = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HttpServerCompanion(
                id: id,
                httpHost: httpHost,
                httpPort: httpPort,
                nick: nick,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String httpHost,
                required int httpPort,
                Value<String?> nick = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HttpServerCompanion.insert(
                id: id,
                httpHost: httpHost,
                httpPort: httpPort,
                nick: nick,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HttpServerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HttpServerTable,
      HttpServerData,
      $$HttpServerTableFilterComposer,
      $$HttpServerTableOrderingComposer,
      $$HttpServerTableAnnotationComposer,
      $$HttpServerTableCreateCompanionBuilder,
      $$HttpServerTableUpdateCompanionBuilder,
      (
        HttpServerData,
        BaseReferences<_$AppDatabase, $HttpServerTable, HttpServerData>,
      ),
      HttpServerData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EnviromentsTableTableManager get enviroments =>
      $$EnviromentsTableTableManager(_db, _db.enviroments);
  $$HousesTableTableManager get houses =>
      $$HousesTableTableManager(_db, _db.houses);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$NeededProductsTableTableManager get neededProducts =>
      $$NeededProductsTableTableManager(_db, _db.neededProducts);
  $$HttpServerTableTableManager get httpServer =>
      $$HttpServerTableTableManager(_db, _db.httpServer);
}
