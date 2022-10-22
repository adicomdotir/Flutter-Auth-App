import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/core/core.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams params);
  Future<Either<Failure, Register>> register(RegisterParams params);
  Future<Either<Failure, Users>> users(UsersParams params);
}
