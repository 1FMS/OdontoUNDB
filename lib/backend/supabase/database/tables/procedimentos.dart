import '../database.dart';

class ProcedimentosTable extends SupabaseTable<ProcedimentosRow> {
  @override
  String get tableName => 'procedimentos';

  @override
  ProcedimentosRow createRow(Map<String, dynamic> data) =>
      ProcedimentosRow(data);
}

class ProcedimentosRow extends SupabaseDataRow {
  ProcedimentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProcedimentosTable();

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
