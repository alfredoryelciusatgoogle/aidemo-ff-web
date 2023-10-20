import '../database.dart';

class LocationMasterTable extends PostgresTable<LocationMasterRow> {
  @override
  String get tableName => 'location_master';

  @override
  LocationMasterRow createRow(Map<String, dynamic> data) =>
      LocationMasterRow(data);
}

class LocationMasterRow extends PostgresDataRow {
  LocationMasterRow(Map<String, dynamic> data) : super(data);

  @override
  PostgresTable get table => LocationMasterTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);

  String? get locationImageUrl => getField<String>('location_image_url');
  set locationImageUrl(String? value) =>
      setField<String>('location_image_url', value);
}
