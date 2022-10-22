import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/core/error/error.dart';
import 'package:flutter_auth_app/data/datasources/datasources.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/di/di.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final PostLogin _postLogin;

  AuthCubit(this._postLogin) : super(const AuthState());

  Future<void> login(LoginParams params) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final data = await _postLogin.call(params);

    data.fold((failure) {
      if (failure is ServerFailure) {
        emit(state.copyWith(
            status: AuthStatus.failure, message: failure.message));
      }
    }, (login) {
      sl<PrefManager>().isLogin = true;
      sl<PrefManager>().token = login.token;
      emit(state.copyWith(status: AuthStatus.success, login: login));
    });
  }
}
