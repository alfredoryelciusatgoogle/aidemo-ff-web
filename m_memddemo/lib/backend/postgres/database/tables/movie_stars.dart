import '../database.dart';

class MovieStarsTable extends PostgresTable<MovieStarsRow> {
  @override
  String get tableName => 'movie_stars';

  @override
  MovieStarsRow createRow(Map<String, dynamic> data) => MovieStarsRow(data);
}

class MovieStarsRow extends PostgresDataRow {
  MovieStarsRow(Map<String, dynamic> data) : super(data);

  @override
  PostgresTable get table => MovieStarsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get birthdate => getField<DateTime>('birthdate');
  set birthdate(DateTime? value) => setField<DateTime>('birthdate', value);

  double? get height => getField<double>('height');
  set height(double? value) => setField<double>('height', value);

  String? get nationality => getField<String>('nationality');
  set nationality(String? value) => setField<String>('nationality', value);
}
