import 'package:postgres/postgres.dart';

class Conection {
  //Realiza la conexion conla base de datos
  final PostgreSQLConnection conn = PostgreSQLConnection(
    '######', //Host Name
    5432, //Port
    '#####', //Database Name
    username: '######', //Username Database
    password: '#########', //Password Database
  );
  void validateConnection() async {
    if (conn.isClosed) {
      await conn.open();
    } else {
      await conn.close();
    }
  }

  Future<void> startDatabase() async {
    conn.useSSL;
    await conn.open();
  }

  Future<void> deleteMeet(int id) async {
    await conn.open();
    await conn.query('DELETE FROM #### WHERE id = @id',
        substitutionValues: {'id': id});
    await conn.close();
  }

//Genera un Select*from
  Future<List<List<dynamic>>> getData() async {
    await conn.open();
    final results = await conn.query('SELECT * FROM #####');
    await conn.close();

    return results.toList();
  }

  //Genera un Select*from #### where code----
  Future<List<List<dynamic>>> getDataWithCode(int doc) async {
    await conn.open();
    final results =
        await conn.query('SELECT * FROM #### WHERE document = ' "$doc" '');
    conn.close();

    return results.toList();
  }

//Inserta nuevos elementos a la base de datos
  Future<void> addElements(
    int idP,
    String nameP,
    int documentP,
    String typeDocumentP,
    String dateMeet,
    String timeMeet,
    int priceMeet,
    String dateFMeet,
    String timeFMeet,
  ) async {
    await conn.open();
    String sql =
        'INSERT INTO ###### (id, name, document, type_document, date_meet, time_meet, price_meet, date_f_meet, time_f_meet) VALUES (@id_param, @name_param, @document_param,@type_param, @date_meet_param, @time_meet_param, @price_param, @date_f_meet, @time_f_meet)';
    Map<String, dynamic> values = {
      'id_param': idP,
      'name_param': nameP,
      'document_param': documentP,
      'type_param': typeDocumentP,
      'date_meet_param': dateMeet,
      'time_meet_param': timeMeet,
      'price_param': priceMeet,
      'date_f_meet': dateFMeet,
      'time_f_meet': timeFMeet
    };

    await conn.execute(sql, substitutionValues: values);
    await conn.close();
  }
}
