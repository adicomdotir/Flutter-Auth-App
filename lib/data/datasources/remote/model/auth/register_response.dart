import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final int? id;
  final String token;
  final String? error;

  const RegisterResponse({required this.token, this.id, this.error});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
          token: json["token"], id: json["id"], error: json["error"]);

  Map<String, dynamic> toJson() => {"token": token, "id": id, "error": error};

  @override
  List<Object?> get props => [token, id, error];
}
