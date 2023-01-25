//flutter pub run build_runner watch
//flutter pub run build_runner build

//pra funcionar tem que adicionar primeiramente um factory dentro da class

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greengrocer/src/models/user_model.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(UserModel user) = Success;
  factory AuthResult.error(String message) = Error;
}
