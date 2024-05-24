// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChitsTable extends Chits with TableInfo<$ChitsTable, Chit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _peopleMeta = const VerificationMeta('people');
  @override
  late final GeneratedColumn<int> people = GeneratedColumn<int>(
      'people', aliasedName, false,
      check: () => people.isBiggerThan(const Constant(2)).isNotNull(),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _commissionPercentageMeta =
      const VerificationMeta('commissionPercentage');
  @override
  late final GeneratedColumn<double> commissionPercentage =
      GeneratedColumn<double>('commission_percentage', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _frequencyTypeMeta =
      const VerificationMeta('frequencyType');
  @override
  late final GeneratedColumnWithTypeConverter<FrequencyType, int>
      frequencyType = GeneratedColumn<int>('frequency_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<FrequencyType>($ChitsTable.$converterfrequencyType);
  static const VerificationMeta _frequencyNumberMeta =
      const VerificationMeta('frequencyNumber');
  @override
  late final GeneratedColumn<int> frequencyNumber = GeneratedColumn<int>(
      'frequency_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fManAuctionNumberMeta =
      const VerificationMeta('fManAuctionNumber');
  @override
  late final GeneratedColumn<int> fManAuctionNumber = GeneratedColumn<int>(
      'f_man_auction_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        amount,
        people,
        commissionPercentage,
        frequencyType,
        frequencyNumber,
        fManAuctionNumber,
        startDate,
        endDate,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chits';
  @override
  VerificationContext validateIntegrity(Insertable<Chit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('people')) {
      context.handle(_peopleMeta,
          people.isAcceptableOrUnknown(data['people']!, _peopleMeta));
    } else if (isInserting) {
      context.missing(_peopleMeta);
    }
    if (data.containsKey('commission_percentage')) {
      context.handle(
          _commissionPercentageMeta,
          commissionPercentage.isAcceptableOrUnknown(
              data['commission_percentage']!, _commissionPercentageMeta));
    } else if (isInserting) {
      context.missing(_commissionPercentageMeta);
    }
    context.handle(_frequencyTypeMeta, const VerificationResult.success());
    if (data.containsKey('frequency_number')) {
      context.handle(
          _frequencyNumberMeta,
          frequencyNumber.isAcceptableOrUnknown(
              data['frequency_number']!, _frequencyNumberMeta));
    } else if (isInserting) {
      context.missing(_frequencyNumberMeta);
    }
    if (data.containsKey('f_man_auction_number')) {
      context.handle(
          _fManAuctionNumberMeta,
          fManAuctionNumber.isAcceptableOrUnknown(
              data['f_man_auction_number']!, _fManAuctionNumberMeta));
    } else if (isInserting) {
      context.missing(_fManAuctionNumberMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      people: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}people'])!,
      commissionPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}commission_percentage'])!,
      frequencyType: $ChitsTable.$converterfrequencyType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}frequency_type'])!),
      frequencyNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency_number'])!,
      fManAuctionNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}f_man_auction_number'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ChitsTable createAlias(String alias) {
    return $ChitsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FrequencyType, int, int> $converterfrequencyType =
      const EnumIndexConverter<FrequencyType>(FrequencyType.values);
}

class Chit extends DataClass implements Insertable<Chit> {
  final int id;
  final String name;
  final int amount;
  final int people;
  final double commissionPercentage;
  final FrequencyType frequencyType;
  final int frequencyNumber;
  final int fManAuctionNumber;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  const Chit(
      {required this.id,
      required this.name,
      required this.amount,
      required this.people,
      required this.commissionPercentage,
      required this.frequencyType,
      required this.frequencyNumber,
      required this.fManAuctionNumber,
      required this.startDate,
      required this.endDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<int>(amount);
    map['people'] = Variable<int>(people);
    map['commission_percentage'] = Variable<double>(commissionPercentage);
    {
      map['frequency_type'] = Variable<int>(
          $ChitsTable.$converterfrequencyType.toSql(frequencyType));
    }
    map['frequency_number'] = Variable<int>(frequencyNumber);
    map['f_man_auction_number'] = Variable<int>(fManAuctionNumber);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChitsCompanion toCompanion(bool nullToAbsent) {
    return ChitsCompanion(
      id: Value(id),
      name: Value(name),
      amount: Value(amount),
      people: Value(people),
      commissionPercentage: Value(commissionPercentage),
      frequencyType: Value(frequencyType),
      frequencyNumber: Value(frequencyNumber),
      fManAuctionNumber: Value(fManAuctionNumber),
      startDate: Value(startDate),
      endDate: Value(endDate),
      createdAt: Value(createdAt),
    );
  }

  factory Chit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<int>(json['amount']),
      people: serializer.fromJson<int>(json['people']),
      commissionPercentage:
          serializer.fromJson<double>(json['commissionPercentage']),
      frequencyType: $ChitsTable.$converterfrequencyType
          .fromJson(serializer.fromJson<int>(json['frequencyType'])),
      frequencyNumber: serializer.fromJson<int>(json['frequencyNumber']),
      fManAuctionNumber: serializer.fromJson<int>(json['fManAuctionNumber']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<int>(amount),
      'people': serializer.toJson<int>(people),
      'commissionPercentage': serializer.toJson<double>(commissionPercentage),
      'frequencyType': serializer.toJson<int>(
          $ChitsTable.$converterfrequencyType.toJson(frequencyType)),
      'frequencyNumber': serializer.toJson<int>(frequencyNumber),
      'fManAuctionNumber': serializer.toJson<int>(fManAuctionNumber),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Chit copyWith(
          {int? id,
          String? name,
          int? amount,
          int? people,
          double? commissionPercentage,
          FrequencyType? frequencyType,
          int? frequencyNumber,
          int? fManAuctionNumber,
          DateTime? startDate,
          DateTime? endDate,
          DateTime? createdAt}) =>
      Chit(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        people: people ?? this.people,
        commissionPercentage: commissionPercentage ?? this.commissionPercentage,
        frequencyType: frequencyType ?? this.frequencyType,
        frequencyNumber: frequencyNumber ?? this.frequencyNumber,
        fManAuctionNumber: fManAuctionNumber ?? this.fManAuctionNumber,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('people: $people, ')
          ..write('commissionPercentage: $commissionPercentage, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('frequencyNumber: $frequencyNumber, ')
          ..write('fManAuctionNumber: $fManAuctionNumber, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      amount,
      people,
      commissionPercentage,
      frequencyType,
      frequencyNumber,
      fManAuctionNumber,
      startDate,
      endDate,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chit &&
          other.id == this.id &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.people == this.people &&
          other.commissionPercentage == this.commissionPercentage &&
          other.frequencyType == this.frequencyType &&
          other.frequencyNumber == this.frequencyNumber &&
          other.fManAuctionNumber == this.fManAuctionNumber &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdAt == this.createdAt);
}

class ChitsCompanion extends UpdateCompanion<Chit> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> amount;
  final Value<int> people;
  final Value<double> commissionPercentage;
  final Value<FrequencyType> frequencyType;
  final Value<int> frequencyNumber;
  final Value<int> fManAuctionNumber;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<DateTime> createdAt;
  const ChitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.people = const Value.absent(),
    this.commissionPercentage = const Value.absent(),
    this.frequencyType = const Value.absent(),
    this.frequencyNumber = const Value.absent(),
    this.fManAuctionNumber = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int amount,
    required int people,
    required double commissionPercentage,
    required FrequencyType frequencyType,
    required int frequencyNumber,
    required int fManAuctionNumber,
    required DateTime startDate,
    required DateTime endDate,
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        amount = Value(amount),
        people = Value(people),
        commissionPercentage = Value(commissionPercentage),
        frequencyType = Value(frequencyType),
        frequencyNumber = Value(frequencyNumber),
        fManAuctionNumber = Value(fManAuctionNumber),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Chit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? amount,
    Expression<int>? people,
    Expression<double>? commissionPercentage,
    Expression<int>? frequencyType,
    Expression<int>? frequencyNumber,
    Expression<int>? fManAuctionNumber,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (people != null) 'people': people,
      if (commissionPercentage != null)
        'commission_percentage': commissionPercentage,
      if (frequencyType != null) 'frequency_type': frequencyType,
      if (frequencyNumber != null) 'frequency_number': frequencyNumber,
      if (fManAuctionNumber != null) 'f_man_auction_number': fManAuctionNumber,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? amount,
      Value<int>? people,
      Value<double>? commissionPercentage,
      Value<FrequencyType>? frequencyType,
      Value<int>? frequencyNumber,
      Value<int>? fManAuctionNumber,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<DateTime>? createdAt}) {
    return ChitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      people: people ?? this.people,
      commissionPercentage: commissionPercentage ?? this.commissionPercentage,
      frequencyType: frequencyType ?? this.frequencyType,
      frequencyNumber: frequencyNumber ?? this.frequencyNumber,
      fManAuctionNumber: fManAuctionNumber ?? this.fManAuctionNumber,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (people.present) {
      map['people'] = Variable<int>(people.value);
    }
    if (commissionPercentage.present) {
      map['commission_percentage'] =
          Variable<double>(commissionPercentage.value);
    }
    if (frequencyType.present) {
      map['frequency_type'] = Variable<int>(
          $ChitsTable.$converterfrequencyType.toSql(frequencyType.value));
    }
    if (frequencyNumber.present) {
      map['frequency_number'] = Variable<int>(frequencyNumber.value);
    }
    if (fManAuctionNumber.present) {
      map['f_man_auction_number'] = Variable<int>(fManAuctionNumber.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('people: $people, ')
          ..write('commissionPercentage: $commissionPercentage, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('frequencyNumber: $frequencyNumber, ')
          ..write('fManAuctionNumber: $fManAuctionNumber, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChitDatesTable extends ChitDates
    with TableInfo<$ChitDatesTable, ChitDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChitDatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _belongsToMeta =
      const VerificationMeta('belongsTo');
  @override
  late final GeneratedColumn<int> belongsTo = GeneratedColumn<int>(
      'belongs_to', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES chits (id) ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, belongsTo, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chit_dates';
  @override
  VerificationContext validateIntegrity(Insertable<ChitDate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('belongs_to')) {
      context.handle(_belongsToMeta,
          belongsTo.isAcceptableOrUnknown(data['belongs_to']!, _belongsToMeta));
    } else if (isInserting) {
      context.missing(_belongsToMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChitDate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChitDate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      belongsTo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}belongs_to'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $ChitDatesTable createAlias(String alias) {
    return $ChitDatesTable(attachedDatabase, alias);
  }
}

class ChitDate extends DataClass implements Insertable<ChitDate> {
  final int id;
  final int belongsTo;
  final DateTime date;
  const ChitDate(
      {required this.id, required this.belongsTo, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['belongs_to'] = Variable<int>(belongsTo);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ChitDatesCompanion toCompanion(bool nullToAbsent) {
    return ChitDatesCompanion(
      id: Value(id),
      belongsTo: Value(belongsTo),
      date: Value(date),
    );
  }

  factory ChitDate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChitDate(
      id: serializer.fromJson<int>(json['id']),
      belongsTo: serializer.fromJson<int>(json['belongsTo']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'belongsTo': serializer.toJson<int>(belongsTo),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  ChitDate copyWith({int? id, int? belongsTo, DateTime? date}) => ChitDate(
        id: id ?? this.id,
        belongsTo: belongsTo ?? this.belongsTo,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('ChitDate(')
          ..write('id: $id, ')
          ..write('belongsTo: $belongsTo, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, belongsTo, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChitDate &&
          other.id == this.id &&
          other.belongsTo == this.belongsTo &&
          other.date == this.date);
}

class ChitDatesCompanion extends UpdateCompanion<ChitDate> {
  final Value<int> id;
  final Value<int> belongsTo;
  final Value<DateTime> date;
  const ChitDatesCompanion({
    this.id = const Value.absent(),
    this.belongsTo = const Value.absent(),
    this.date = const Value.absent(),
  });
  ChitDatesCompanion.insert({
    this.id = const Value.absent(),
    required int belongsTo,
    required DateTime date,
  })  : belongsTo = Value(belongsTo),
        date = Value(date);
  static Insertable<ChitDate> custom({
    Expression<int>? id,
    Expression<int>? belongsTo,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (belongsTo != null) 'belongs_to': belongsTo,
      if (date != null) 'date': date,
    });
  }

  ChitDatesCompanion copyWith(
      {Value<int>? id, Value<int>? belongsTo, Value<DateTime>? date}) {
    return ChitDatesCompanion(
      id: id ?? this.id,
      belongsTo: belongsTo ?? this.belongsTo,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (belongsTo.present) {
      map['belongs_to'] = Variable<int>(belongsTo.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChitDatesCompanion(')
          ..write('id: $id, ')
          ..write('belongsTo: $belongsTo, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ChitPaymentsTable extends ChitPayments
    with TableInfo<$ChitPaymentsTable, ChitPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChitPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<int> paidAmount = GeneratedColumn<int>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _receivedAmountMeta =
      const VerificationMeta('receivedAmount');
  @override
  late final GeneratedColumn<int> receivedAmount = GeneratedColumn<int>(
      'received_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _belongsToMeta =
      const VerificationMeta('belongsTo');
  @override
  late final GeneratedColumn<int> belongsTo = GeneratedColumn<int>(
      'belongs_to', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES chits (id) ON DELETE CASCADE'));
  static const VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumnWithTypeConverter<PaymentType, int> paymentType =
      GeneratedColumn<int>('payment_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PaymentType>($ChitPaymentsTable.$converterpaymentType);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        paymentDate,
        paidAmount,
        receivedAmount,
        belongsTo,
        paymentType,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chit_payments';
  @override
  VerificationContext validateIntegrity(Insertable<ChitPayment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('received_amount')) {
      context.handle(
          _receivedAmountMeta,
          receivedAmount.isAcceptableOrUnknown(
              data['received_amount']!, _receivedAmountMeta));
    } else if (isInserting) {
      context.missing(_receivedAmountMeta);
    }
    if (data.containsKey('belongs_to')) {
      context.handle(_belongsToMeta,
          belongsTo.isAcceptableOrUnknown(data['belongs_to']!, _belongsToMeta));
    } else if (isInserting) {
      context.missing(_belongsToMeta);
    }
    context.handle(_paymentTypeMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChitPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChitPayment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paid_amount'])!,
      receivedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}received_amount'])!,
      belongsTo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}belongs_to'])!,
      paymentType: $ChitPaymentsTable.$converterpaymentType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}payment_type'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ChitPaymentsTable createAlias(String alias) {
    return $ChitPaymentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PaymentType, int, int> $converterpaymentType =
      const EnumIndexConverter<PaymentType>(PaymentType.values);
}

class ChitPayment extends DataClass implements Insertable<ChitPayment> {
  final int id;
  final DateTime paymentDate;
  final int paidAmount;
  final int receivedAmount;
  final int belongsTo;
  final PaymentType paymentType;
  final DateTime createdAt;
  const ChitPayment(
      {required this.id,
      required this.paymentDate,
      required this.paidAmount,
      required this.receivedAmount,
      required this.belongsTo,
      required this.paymentType,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['paid_amount'] = Variable<int>(paidAmount);
    map['received_amount'] = Variable<int>(receivedAmount);
    map['belongs_to'] = Variable<int>(belongsTo);
    {
      map['payment_type'] = Variable<int>(
          $ChitPaymentsTable.$converterpaymentType.toSql(paymentType));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChitPaymentsCompanion toCompanion(bool nullToAbsent) {
    return ChitPaymentsCompanion(
      id: Value(id),
      paymentDate: Value(paymentDate),
      paidAmount: Value(paidAmount),
      receivedAmount: Value(receivedAmount),
      belongsTo: Value(belongsTo),
      paymentType: Value(paymentType),
      createdAt: Value(createdAt),
    );
  }

  factory ChitPayment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChitPayment(
      id: serializer.fromJson<int>(json['id']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      paidAmount: serializer.fromJson<int>(json['paidAmount']),
      receivedAmount: serializer.fromJson<int>(json['receivedAmount']),
      belongsTo: serializer.fromJson<int>(json['belongsTo']),
      paymentType: $ChitPaymentsTable.$converterpaymentType
          .fromJson(serializer.fromJson<int>(json['paymentType'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'paidAmount': serializer.toJson<int>(paidAmount),
      'receivedAmount': serializer.toJson<int>(receivedAmount),
      'belongsTo': serializer.toJson<int>(belongsTo),
      'paymentType': serializer.toJson<int>(
          $ChitPaymentsTable.$converterpaymentType.toJson(paymentType)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChitPayment copyWith(
          {int? id,
          DateTime? paymentDate,
          int? paidAmount,
          int? receivedAmount,
          int? belongsTo,
          PaymentType? paymentType,
          DateTime? createdAt}) =>
      ChitPayment(
        id: id ?? this.id,
        paymentDate: paymentDate ?? this.paymentDate,
        paidAmount: paidAmount ?? this.paidAmount,
        receivedAmount: receivedAmount ?? this.receivedAmount,
        belongsTo: belongsTo ?? this.belongsTo,
        paymentType: paymentType ?? this.paymentType,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('ChitPayment(')
          ..write('id: $id, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('receivedAmount: $receivedAmount, ')
          ..write('belongsTo: $belongsTo, ')
          ..write('paymentType: $paymentType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, paymentDate, paidAmount, receivedAmount,
      belongsTo, paymentType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChitPayment &&
          other.id == this.id &&
          other.paymentDate == this.paymentDate &&
          other.paidAmount == this.paidAmount &&
          other.receivedAmount == this.receivedAmount &&
          other.belongsTo == this.belongsTo &&
          other.paymentType == this.paymentType &&
          other.createdAt == this.createdAt);
}

class ChitPaymentsCompanion extends UpdateCompanion<ChitPayment> {
  final Value<int> id;
  final Value<DateTime> paymentDate;
  final Value<int> paidAmount;
  final Value<int> receivedAmount;
  final Value<int> belongsTo;
  final Value<PaymentType> paymentType;
  final Value<DateTime> createdAt;
  const ChitPaymentsCompanion({
    this.id = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.receivedAmount = const Value.absent(),
    this.belongsTo = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChitPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime paymentDate,
    required int paidAmount,
    required int receivedAmount,
    required int belongsTo,
    required PaymentType paymentType,
    this.createdAt = const Value.absent(),
  })  : paymentDate = Value(paymentDate),
        paidAmount = Value(paidAmount),
        receivedAmount = Value(receivedAmount),
        belongsTo = Value(belongsTo),
        paymentType = Value(paymentType);
  static Insertable<ChitPayment> custom({
    Expression<int>? id,
    Expression<DateTime>? paymentDate,
    Expression<int>? paidAmount,
    Expression<int>? receivedAmount,
    Expression<int>? belongsTo,
    Expression<int>? paymentType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (receivedAmount != null) 'received_amount': receivedAmount,
      if (belongsTo != null) 'belongs_to': belongsTo,
      if (paymentType != null) 'payment_type': paymentType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChitPaymentsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? paymentDate,
      Value<int>? paidAmount,
      Value<int>? receivedAmount,
      Value<int>? belongsTo,
      Value<PaymentType>? paymentType,
      Value<DateTime>? createdAt}) {
    return ChitPaymentsCompanion(
      id: id ?? this.id,
      paymentDate: paymentDate ?? this.paymentDate,
      paidAmount: paidAmount ?? this.paidAmount,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      belongsTo: belongsTo ?? this.belongsTo,
      paymentType: paymentType ?? this.paymentType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<int>(paidAmount.value);
    }
    if (receivedAmount.present) {
      map['received_amount'] = Variable<int>(receivedAmount.value);
    }
    if (belongsTo.present) {
      map['belongs_to'] = Variable<int>(belongsTo.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<int>(
          $ChitPaymentsTable.$converterpaymentType.toSql(paymentType.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChitPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('receivedAmount: $receivedAmount, ')
          ..write('belongsTo: $belongsTo, ')
          ..write('paymentType: $paymentType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _settingsMeta =
      const VerificationMeta('settings');
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
      'settings', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, settings];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('settings')) {
      context.handle(_settingsMeta,
          settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta));
    } else if (isInserting) {
      context.missing(_settingsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      settings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings'])!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final int id;
  final String settings;
  const UserSetting({required this.id, required this.settings});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['settings'] = Variable<String>(settings);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      id: Value(id),
      settings: Value(settings),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      id: serializer.fromJson<int>(json['id']),
      settings: serializer.fromJson<String>(json['settings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'settings': serializer.toJson<String>(settings),
    };
  }

  UserSetting copyWith({int? id, String? settings}) => UserSetting(
        id: id ?? this.id,
        settings: settings ?? this.settings,
      );
  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('id: $id, ')
          ..write('settings: $settings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, settings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.id == this.id &&
          other.settings == this.settings);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<int> id;
  final Value<String> settings;
  const UserSettingsCompanion({
    this.id = const Value.absent(),
    this.settings = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    this.id = const Value.absent(),
    required String settings,
  }) : settings = Value(settings);
  static Insertable<UserSetting> custom({
    Expression<int>? id,
    Expression<String>? settings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (settings != null) 'settings': settings,
    });
  }

  UserSettingsCompanion copyWith({Value<int>? id, Value<String>? settings}) {
    return UserSettingsCompanion(
      id: id ?? this.id,
      settings: settings ?? this.settings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('id: $id, ')
          ..write('settings: $settings')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ChitsTable chits = $ChitsTable(this);
  late final $ChitDatesTable chitDates = $ChitDatesTable(this);
  late final $ChitPaymentsTable chitPayments = $ChitPaymentsTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  late final ChitDao chitDao = ChitDao(this as AppDatabase);
  late final ChitDatesDao chitDatesDao = ChitDatesDao(this as AppDatabase);
  late final UserSettingsDao userSettingsDao =
      UserSettingsDao(this as AppDatabase);
  late final ChitPaymentsDao chitPaymentsDao =
      ChitPaymentsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chits, chitDates, chitPayments, userSettings];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('chits',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('chit_dates', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('chits',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('chit_payments', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ChitsTableInsertCompanionBuilder = ChitsCompanion Function({
  Value<int> id,
  required String name,
  required int amount,
  required int people,
  required double commissionPercentage,
  required FrequencyType frequencyType,
  required int frequencyNumber,
  required int fManAuctionNumber,
  required DateTime startDate,
  required DateTime endDate,
  Value<DateTime> createdAt,
});
typedef $$ChitsTableUpdateCompanionBuilder = ChitsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> amount,
  Value<int> people,
  Value<double> commissionPercentage,
  Value<FrequencyType> frequencyType,
  Value<int> frequencyNumber,
  Value<int> fManAuctionNumber,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<DateTime> createdAt,
});

class $$ChitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChitsTable,
    Chit,
    $$ChitsTableFilterComposer,
    $$ChitsTableOrderingComposer,
    $$ChitsTableProcessedTableManager,
    $$ChitsTableInsertCompanionBuilder,
    $$ChitsTableUpdateCompanionBuilder> {
  $$ChitsTableTableManager(_$AppDatabase db, $ChitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChitsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChitsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$ChitsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<int> people = const Value.absent(),
            Value<double> commissionPercentage = const Value.absent(),
            Value<FrequencyType> frequencyType = const Value.absent(),
            Value<int> frequencyNumber = const Value.absent(),
            Value<int> fManAuctionNumber = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ChitsCompanion(
            id: id,
            name: name,
            amount: amount,
            people: people,
            commissionPercentage: commissionPercentage,
            frequencyType: frequencyType,
            frequencyNumber: frequencyNumber,
            fManAuctionNumber: fManAuctionNumber,
            startDate: startDate,
            endDate: endDate,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int amount,
            required int people,
            required double commissionPercentage,
            required FrequencyType frequencyType,
            required int frequencyNumber,
            required int fManAuctionNumber,
            required DateTime startDate,
            required DateTime endDate,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ChitsCompanion.insert(
            id: id,
            name: name,
            amount: amount,
            people: people,
            commissionPercentage: commissionPercentage,
            frequencyType: frequencyType,
            frequencyNumber: frequencyNumber,
            fManAuctionNumber: fManAuctionNumber,
            startDate: startDate,
            endDate: endDate,
            createdAt: createdAt,
          ),
        ));
}

class $$ChitsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChitsTable,
    Chit,
    $$ChitsTableFilterComposer,
    $$ChitsTableOrderingComposer,
    $$ChitsTableProcessedTableManager,
    $$ChitsTableInsertCompanionBuilder,
    $$ChitsTableUpdateCompanionBuilder> {
  $$ChitsTableProcessedTableManager(super.$state);
}

class $$ChitsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChitsTable> {
  $$ChitsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get people => $state.composableBuilder(
      column: $state.table.people,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get commissionPercentage => $state.composableBuilder(
      column: $state.table.commissionPercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<FrequencyType, FrequencyType, int>
      get frequencyType => $state.composableBuilder(
          column: $state.table.frequencyType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get frequencyNumber => $state.composableBuilder(
      column: $state.table.frequencyNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fManAuctionNumber => $state.composableBuilder(
      column: $state.table.fManAuctionNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter chitDatesRefs(
      ComposableFilter Function($$ChitDatesTableFilterComposer f) f) {
    final $$ChitDatesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.chitDates,
        getReferencedColumn: (t) => t.belongsTo,
        builder: (joinBuilder, parentComposers) =>
            $$ChitDatesTableFilterComposer(ComposerState(
                $state.db, $state.db.chitDates, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter chitPaymentsRefs(
      ComposableFilter Function($$ChitPaymentsTableFilterComposer f) f) {
    final $$ChitPaymentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.chitPayments,
        getReferencedColumn: (t) => t.belongsTo,
        builder: (joinBuilder, parentComposers) =>
            $$ChitPaymentsTableFilterComposer(ComposerState($state.db,
                $state.db.chitPayments, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChitsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChitsTable> {
  $$ChitsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get people => $state.composableBuilder(
      column: $state.table.people,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get commissionPercentage => $state.composableBuilder(
      column: $state.table.commissionPercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get frequencyType => $state.composableBuilder(
      column: $state.table.frequencyType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get frequencyNumber => $state.composableBuilder(
      column: $state.table.frequencyNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fManAuctionNumber => $state.composableBuilder(
      column: $state.table.fManAuctionNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ChitDatesTableInsertCompanionBuilder = ChitDatesCompanion Function({
  Value<int> id,
  required int belongsTo,
  required DateTime date,
});
typedef $$ChitDatesTableUpdateCompanionBuilder = ChitDatesCompanion Function({
  Value<int> id,
  Value<int> belongsTo,
  Value<DateTime> date,
});

class $$ChitDatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChitDatesTable,
    ChitDate,
    $$ChitDatesTableFilterComposer,
    $$ChitDatesTableOrderingComposer,
    $$ChitDatesTableProcessedTableManager,
    $$ChitDatesTableInsertCompanionBuilder,
    $$ChitDatesTableUpdateCompanionBuilder> {
  $$ChitDatesTableTableManager(_$AppDatabase db, $ChitDatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChitDatesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChitDatesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChitDatesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> belongsTo = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              ChitDatesCompanion(
            id: id,
            belongsTo: belongsTo,
            date: date,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int belongsTo,
            required DateTime date,
          }) =>
              ChitDatesCompanion.insert(
            id: id,
            belongsTo: belongsTo,
            date: date,
          ),
        ));
}

class $$ChitDatesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChitDatesTable,
    ChitDate,
    $$ChitDatesTableFilterComposer,
    $$ChitDatesTableOrderingComposer,
    $$ChitDatesTableProcessedTableManager,
    $$ChitDatesTableInsertCompanionBuilder,
    $$ChitDatesTableUpdateCompanionBuilder> {
  $$ChitDatesTableProcessedTableManager(super.$state);
}

class $$ChitDatesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChitDatesTable> {
  $$ChitDatesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChitsTableFilterComposer get belongsTo {
    final $$ChitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.belongsTo,
        referencedTable: $state.db.chits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChitsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.chits, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChitDatesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChitDatesTable> {
  $$ChitDatesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChitsTableOrderingComposer get belongsTo {
    final $$ChitsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.belongsTo,
        referencedTable: $state.db.chits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChitsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.chits, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ChitPaymentsTableInsertCompanionBuilder = ChitPaymentsCompanion
    Function({
  Value<int> id,
  required DateTime paymentDate,
  required int paidAmount,
  required int receivedAmount,
  required int belongsTo,
  required PaymentType paymentType,
  Value<DateTime> createdAt,
});
typedef $$ChitPaymentsTableUpdateCompanionBuilder = ChitPaymentsCompanion
    Function({
  Value<int> id,
  Value<DateTime> paymentDate,
  Value<int> paidAmount,
  Value<int> receivedAmount,
  Value<int> belongsTo,
  Value<PaymentType> paymentType,
  Value<DateTime> createdAt,
});

class $$ChitPaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChitPaymentsTable,
    ChitPayment,
    $$ChitPaymentsTableFilterComposer,
    $$ChitPaymentsTableOrderingComposer,
    $$ChitPaymentsTableProcessedTableManager,
    $$ChitPaymentsTableInsertCompanionBuilder,
    $$ChitPaymentsTableUpdateCompanionBuilder> {
  $$ChitPaymentsTableTableManager(_$AppDatabase db, $ChitPaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChitPaymentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChitPaymentsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChitPaymentsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<int> paidAmount = const Value.absent(),
            Value<int> receivedAmount = const Value.absent(),
            Value<int> belongsTo = const Value.absent(),
            Value<PaymentType> paymentType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ChitPaymentsCompanion(
            id: id,
            paymentDate: paymentDate,
            paidAmount: paidAmount,
            receivedAmount: receivedAmount,
            belongsTo: belongsTo,
            paymentType: paymentType,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required DateTime paymentDate,
            required int paidAmount,
            required int receivedAmount,
            required int belongsTo,
            required PaymentType paymentType,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ChitPaymentsCompanion.insert(
            id: id,
            paymentDate: paymentDate,
            paidAmount: paidAmount,
            receivedAmount: receivedAmount,
            belongsTo: belongsTo,
            paymentType: paymentType,
            createdAt: createdAt,
          ),
        ));
}

class $$ChitPaymentsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChitPaymentsTable,
    ChitPayment,
    $$ChitPaymentsTableFilterComposer,
    $$ChitPaymentsTableOrderingComposer,
    $$ChitPaymentsTableProcessedTableManager,
    $$ChitPaymentsTableInsertCompanionBuilder,
    $$ChitPaymentsTableUpdateCompanionBuilder> {
  $$ChitPaymentsTableProcessedTableManager(super.$state);
}

class $$ChitPaymentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChitPaymentsTable> {
  $$ChitPaymentsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get paymentDate => $state.composableBuilder(
      column: $state.table.paymentDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get paidAmount => $state.composableBuilder(
      column: $state.table.paidAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get receivedAmount => $state.composableBuilder(
      column: $state.table.receivedAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<PaymentType, PaymentType, int>
      get paymentType => $state.composableBuilder(
          column: $state.table.paymentType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChitsTableFilterComposer get belongsTo {
    final $$ChitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.belongsTo,
        referencedTable: $state.db.chits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChitsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.chits, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChitPaymentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChitPaymentsTable> {
  $$ChitPaymentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get paymentDate => $state.composableBuilder(
      column: $state.table.paymentDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get paidAmount => $state.composableBuilder(
      column: $state.table.paidAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get receivedAmount => $state.composableBuilder(
      column: $state.table.receivedAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get paymentType => $state.composableBuilder(
      column: $state.table.paymentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChitsTableOrderingComposer get belongsTo {
    final $$ChitsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.belongsTo,
        referencedTable: $state.db.chits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChitsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.chits, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$UserSettingsTableInsertCompanionBuilder = UserSettingsCompanion
    Function({
  Value<int> id,
  required String settings,
});
typedef $$UserSettingsTableUpdateCompanionBuilder = UserSettingsCompanion
    Function({
  Value<int> id,
  Value<String> settings,
});

class $$UserSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableProcessedTableManager,
    $$UserSettingsTableInsertCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder> {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserSettingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$UserSettingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> settings = const Value.absent(),
          }) =>
              UserSettingsCompanion(
            id: id,
            settings: settings,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String settings,
          }) =>
              UserSettingsCompanion.insert(
            id: id,
            settings: settings,
          ),
        ));
}

class $$UserSettingsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableProcessedTableManager,
    $$UserSettingsTableInsertCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder> {
  $$UserSettingsTableProcessedTableManager(super.$state);
}

class $$UserSettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get settings => $state.composableBuilder(
      column: $state.table.settings,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserSettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get settings => $state.composableBuilder(
      column: $state.table.settings,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ChitsTableTableManager get chits =>
      $$ChitsTableTableManager(_db, _db.chits);
  $$ChitDatesTableTableManager get chitDates =>
      $$ChitDatesTableTableManager(_db, _db.chitDates);
  $$ChitPaymentsTableTableManager get chitPayments =>
      $$ChitPaymentsTableTableManager(_db, _db.chitPayments);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
