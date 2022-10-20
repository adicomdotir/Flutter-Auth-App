import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final int? id;
  final String token;
  final String? error;

  const LoginResponse({required this.token, this.id, this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(token: json["token"], id: json["id"], error: json["error"]);

  Map<String, dynamic> toJson() => {"token": token, "id": id, "error": error};

  @override
  List<Object?> get props => [token, id, error];
}
