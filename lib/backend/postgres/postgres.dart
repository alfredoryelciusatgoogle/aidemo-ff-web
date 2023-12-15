import 'package:postgrest/postgrest.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

export 'database/database.dart';

const _kPostgresUrl = 'https://pgsql-demo.fluttermet.com';
const _kPostgresAnonKey = '';

class FFPostgresClient {
  FFPostgresClient._();

  static FFPostgresClient? _instance;
  static FFPostgresClient get instance => _instance ??= FFPostgresClient._();

  FlutterSecureStorage secureStorage = FlutterSecureStorage();

  var _postgres = _fromToken(_kPostgresAnonKey);
  static PostgrestClient get client => instance._postgres;
  String? token;

  static Future initialize() async {
    instance.token =
        await instance.secureStorage.read(key: 'ff_postgres_token');
    if (instance.token != null) {
      instance._postgres = _fromToken(instance.token!);
    }
  }

  setToken(String token) {
    this.token = token;
    instance._postgres = _fromToken(token);
    instance.secureStorage.write(key: 'ff_postgres_token', value: token);
  }

  PostgrestQueryBuilder<T> from<T>(String table) => PostgrestQueryBuilder<T>(
        '${FFPostgresClient.client.url}/$table',
        headers: FFPostgresClient.instance._headers,
        schema: FFPostgresClient.client.schema,
        httpClient: FFPostgresClient.client.httpClient,
      );

  static PostgrestClient _fromToken(String token) => PostgrestClient(
        _kPostgresUrl,
        headers: {
          if (token.isNotEmpty) 'Authorization': 'Bearer ' + token,
        },
      );

  Map<String, String> get _headers => {
        if (token?.isNotEmpty ?? false) 'Authorization': 'Bearer ' + token!,
      };
}
