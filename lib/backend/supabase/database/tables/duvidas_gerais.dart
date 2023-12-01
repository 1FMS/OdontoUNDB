import '../database.dart';

class DuvidasGeraisTable extends SupabaseTable<DuvidasGeraisRow> {
  @override
  String get tableName => 'duvidas_gerais';

  @override
  DuvidasGeraisRow createRow(Map<String, dynamic> data) =>
      DuvidasGeraisRow(data);
}

class DuvidasGeraisRow extends SupabaseDataRow {
  DuvidasGeraisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DuvidasGeraisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get informacao => getField<String>('informacao');
  set informacao(String? value) => setField<String>('informacao', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);
}
