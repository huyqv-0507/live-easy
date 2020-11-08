import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:liveeasy_huynl/models/repos/product/data.dart';
import 'package:liveeasy_huynl/models/views/product_view.dart';
import 'package:liveeasy_huynl/services/env.dart';

class ProductRepository {
  Future<List<Data>> fetchProducts(ProductView productView) async {
    final res = await http.get(
        Env.dataUrl(
            'products?store-id=${productView.storeId}&page=${productView.page}&size=${productView.size}'),
        headers: {"Authorization": Env.tokenDominos});
    if (res.statusCode == 200) {
      Map<String, dynamic> productMap = jsonDecode(res.body);
      List<dynamic> data = productMap['data'];

      List<Data> products = data.map((json) => Data.fromJson(json)).toList();

      return products;
    } else {
      throw Exception("Failed to fetch Product");
    }
  }
}

final productRepository = ProductRepository();
