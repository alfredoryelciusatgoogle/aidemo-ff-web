import '../database.dart';

class SampleTableTable extends PostgresTable<SampleTableRow> {
  @override
  String get tableName => 'sample_table';

  @override
  SampleTableRow createRow(Map<String, dynamic> data) => SampleTableRow(data);
}

class SampleTableRow extends PostgresDataRow {
  SampleTableRow(Map<String, dynamic> data) : super(data);

  @override
  PostgresTable get table => SampleTableTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get column1 => getField<String>('column1');
  set column1(String? value) => setField<String>('column1', value);

  String? get column2 => getField<String>('column2');
  set column2(String? value) => setField<String>('column2', value);

  String? get column3 => getField<String>('column3');
  set column3(String? value) => setField<String>('column3', value);

  String? get column4 => getField<String>('column4');
  set column4(String? value) => setField<String>('column4', value);
}
