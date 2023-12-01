import '../database.dart';

class ConsultasTable extends SupabaseTable<ConsultasRow> {
  @override
  String get tableName => 'consultas';

  @override
  ConsultasRow createRow(Map<String, dynamic> data) => ConsultasRow(data);
}

class ConsultasRow extends SupabaseDataRow {
  ConsultasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConsultasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get medico => getField<String>('medico');
  set medico(String? value) => setField<String>('medico', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get queixa => getField<String>('queixa');
  set queixa(String? value) => setField<String>('queixa', value);

  String? get procedimentoRealizado =>
      getField<String>('procedimento_realizado');
  set procedimentoRealizado(String? value) =>
      setField<String>('procedimento_realizado', value);

  String? get anexos => getField<String>('anexos');
  set anexos(String? value) => setField<String>('anexos', value);

  String? get motivoCancelamento => getField<String>('motivo_cancelamento');
  set motivoCancelamento(String? value) =>
      setField<String>('motivo_cancelamento', value);
}
