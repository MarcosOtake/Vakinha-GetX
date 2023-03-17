import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;
  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    var user = {"email": "ferreira.kellen@gmail.com", "password": "123456"};
    final auth = await _restClient.post('/auth', user);
    debugPrint(auth.statusCode.toString());
    final result = await _restClient.get("/products");

    if (result.hasError) {
      log(
        "Erro ao buscar produtos ${result.statusCode}",
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException("Erro ao buscar produtos");
    }
    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
