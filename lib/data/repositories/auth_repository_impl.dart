import 'package:flutter_auth_app/core/error/error.dart';
import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/data/datasources/datasources.dart';
import 'package:flutter_auth_app/domain/entities/auth/login.dart';
import 'package:flutter_auth_app/domain/entities/auth/register.dart';
import 'package:flutter_auth_app/domain/entities/auth/users.dart';
import 'package:flutter_auth_app/domain/repositories/auth_repository.dart';
import 'package:flutter_auth_app/domain/usecases/auth/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    try {
      final result = await _datasource.login(params);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async {
    try {
      final result = await _datasource.register(params);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, Users>> users(UsersParams params) async {
    try {
      final result = await _datasource.users(params);
      if (result.data?.isEmpty ?? true) {
        return Left(NoDataFailure());
      }
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }
}
