import 'package:flutter_auth_app/core/error/exceptions.dart';
import 'package:flutter_auth_app/data/datasources/datasources.dart';
import 'package:flutter_auth_app/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams params);
  Future<LoginResponse> login(LoginParams params);
  Future<UsersResponse> users(UsersParams params);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<RegisterResponse> register(RegisterParams params) async {
    try {
      final response =
          await _client.postRequest(ListApi.register, data: params.toJson());
      final result = RegisterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<LoginResponse> login(LoginParams params) async {
    try {
      final response =
          await _client.postRequest(ListApi.login, data: params.toJson());
      final result = LoginResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UsersResponse> users(UsersParams params) async {
    try {
      final response = await _client.getRequest(ListApi.users,
          queryParameters: params.toJson());
      final result = UsersResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
