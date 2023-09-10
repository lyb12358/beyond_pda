import 'package:beyond_pda/models/inventory.dart';
import 'package:beyond_pda/models/product_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/service/http_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ProductRepository extends GetxService {
  late HttpService _httpService;
  late Isar _isar;

  Future<ProductRepository> init() async {
    _isar = await open();
    _httpService = Get.find<HttpService>();
    return this;
  }

  GetStorage box = GetStorage();

  // 获取 Isar 实例
  Future<Isar> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [ProductDataSchema, InventorySchema],
      directory: dir.path,
    );
    return isar;
  }

  Future getPdaData() async {
    try {
      final response = await _httpService.get('/pm/v1/pdaData',
          options:
              Options(receiveTimeout: const Duration(milliseconds: 20000)));
      if (response.data['code'] == 200) {
        box.write('updateTime',
            DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()));
        return response.data['data'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
    }
  }

  // 批量添加产品资料
  Future<void> batchInset(List<ProductData> prodList) async {
    await _isar.writeTxn(() async {
      await _isar.productDatas.putAll(prodList);
    });
  }

  // 获取一个产品资料
  getSingleProd(String code) async {
    ProductData? prod;
    prod = await _isar.productDatas.where().prodCodeEqualTo(code).findFirst();
    return prod;
  }

  //门店库存
  Future getOnlineInventory(int shopId) async {
    try {
      final response = await _httpService.post('/shop-storage/shopStorage/list',
          queryParameters: {'page': 1, 'limit': 1000, 'shopId': shopId},
          data: {'page': 1, 'limit': 1000, 'shopId': shopId});
      if (response.data['code'] == 200) {
        return response.data['data']['data'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
    }
  }

  //在线盘点列表
  Future getOnlineInventoryList(int shopId) async {
    try {
      final response = await _httpService.post(
          '/shop-storage/shopStorageCheck/list',
          queryParameters: {'page': 1, 'limit': 1000, 'shopId': shopId},
          data: {'page': 1, 'limit': 1000, 'shopId': shopId});
      if (response.data['code'] == 200) {
        return response.data['data']['data'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
    }
  }

  //创建盘点单
  Future addOnlineInventory(int brandId, int shopId, String remark,
      List<OnlineSingleProdInventory> list) async {
    try {
      final response = await _httpService
          .post('/shop-storage/shopStorageCheck/', data: {
        'brandId': brandId,
        'shopId': shopId,
        'remark': remark,
        'details': list
      });
      if (response.data['code'] == 200) {
        return true;
      } else {
        Get.snackbar('警告', response.data['msg']);
        return false;
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
      return false;
    }
  }

  //盘点挂单列表
  Future getHoldonInventoryList(int shopId) async {
    return await _isar.inventorys
        .where(sort: Sort.desc)
        .anyId()
        .filter()
        .shopIdEqualTo(shopId)
        .findAll();
  }

  // 创建/修改盘点挂单
  Future<void> putHoldonInventory(Inventory inventory) async {
    await _isar.writeTxn(() async {
      await _isar.inventorys.put(inventory);
    });
  }

  Future<void> deleteHoldonInventory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.inventorys.delete(id);
    });
  }
}
