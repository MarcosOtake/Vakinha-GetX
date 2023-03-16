import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/ui/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';

import '../../core/exceptions/user_notfound_exception.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post("/auth/register", {
      "name": name,
      "email": email,
      "password": password,
    });
    if (result.hasError) {
      var message = "Erro ao registrar usuario";
      if (result.statusCode == 400) {
        message = result.body["error"];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient
    .post("/auth/",{
      "email":email,
      "password":password,
    });
    if(result.hasError){
      if(result.statusCode == 403){
        log("Usuario ou senha invalidos",
        error: result.statusText,
        stackTrace: StackTrace.current
        );
        throw UserNotFoundException();
      }
      log("Erro ao autenticar o usuario(${result.statusCode}) ",
      error: result.statusText,
      stackTrace: StackTrace.current
      );
      throw RestClientException("Erro ao autenticar usuario");
    }
    return UserModel.fromMap(result.body);
  }
}
