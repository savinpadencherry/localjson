import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shop_t/core/logger.dart';
import 'package:shop_t/core/models/shop.dart';

class ShopService with LogMixin {
  final List<Shop> shops = [];

  Future<List<Shop>> getShopData() async {
    final String response = await rootBundle.loadString('assets/json.json');
    final data = await json.decode(response) as List<dynamic>;
    warningLog('$data');
    for (var shop in data) {
      shops.add(
        Shop.fromMap(shop),
      );
    }
    warningLog('$shops');
    return shops;
  }

  Future<File> get _localFile async {
    return File('assets/json.json');
  }

  addQuantityDataToLocalJSon({required final String quantity}) async {
    final file = await _localFile;
    return file.writeAsString(json.encode(quantity));
  }
}
