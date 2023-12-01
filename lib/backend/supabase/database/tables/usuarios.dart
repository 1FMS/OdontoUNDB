import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'Usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get sobrenome => getField<String>('sobrenome');
  set sobrenome(String? value) => setField<String>('sobrenome', value);

  String? get cargo => getField<String>('cargo');
  set cargo(String? value) => setField<String>('cargo', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);

  String? get primeiroNome => getField<String>('Primeiro_nome');
  set primeiroNome(String? value) => setField<String>('Primeiro_nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);
}
