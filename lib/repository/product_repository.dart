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
              Options(receiveTimeout: const Duration(milliseconds: 30000)));
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
          // queryParameters: {'page': 1, 'limit': 5000, 'shopId': shopId},
          // data: {'page': 1, 'limit': 1000, 'shopId': shopId});
          queryParameters: {'shopId': shopId},
          data: {'shopId': shopId});
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

  //在线盘点单详情
  Future getOnlineInventoryDetail(int id) async {
    try {
      final response =
          await _httpService.get('/shop-storage/shopStorageCheck/$id');
      if (response.data['code'] == 200) {
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

  //修改盘点单
  Future updateOnlineInventory(int id, String docmentCode, int shopId,
      String remark, List<OnlineSingleProdInventory> list) async {
    try {
      final response =
          await _httpService.post('/shop-storage/shopStorageCheck/', data: {
        'id': id,
        'documentCode': docmentCode,
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

  //修改在线盘点单状态
  Future changeOnlineInventoryStatus(int id, int action) async {
    try {
      final response = await _httpService.put(
          '/shop-storage/shopStorageCheck/status/',
          queryParameters: {'id': id, 'action': action});
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

  //在线盘点单操作记录列表
  Future getOnlineOperationLogList(int id) async {
    try {
      final response = await _httpService.post(
          '/shop-storage/operationLog/list',
          queryParameters: {'page': 1, 'limit': 1000},
          data: {'page': 1, 'limit': 1000, 'objectId': id, 'type': '库存盘点'});
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

  //盘点挂单列表
  Future getHoldonInventoryList(int shopId) async {
    return await _isar.inventorys
        .where(sort: Sort.desc)
        .anyId()
        .filter()
        .shopIdEqualTo(shopId)
        .and()
        .not()
        .statusEqualTo(4)
        .findAll();
  }

  //离线挂单列表
  Future getOfflineInventoryList() async {
    return await _isar.inventorys
        .where(sort: Sort.desc)
        .anyId()
        .filter()
        .statusEqualTo(4)
        .findAll();
  }

  // 创建/修改盘点挂单/离线单
  Future<void> putInventory(Inventory inventory) async {
    await _isar.writeTxn(() async {
      await _isar.inventorys.put(inventory);
    });
  }

  Future<void> deleteInventory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.inventorys.delete(id);
    });
  }

  //产品查询
  Future getOnlineProdList(Map form) async {
    try {
      final response = await _httpService.post('/shop-storage/product/list',
          queryParameters: {'page': form['page'], 'limit': form['limit']},
          data: form);
      if (response.data['code'] == 200) {
        return response.data['data']['data'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
    }
  }

  //产品分类树
  Future getProdClass() async {
    try {
      final response = await _httpService.get(
        '/pm/prodClasses/tree/bigType',
      );
      // final response = await _httpService.get(
      //   '/shop-storage/product/productClass/tree',
      // );
      if (response.data['code'] == 200) {
        return response.data['data'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
    }
  }

  //库存查询
  Future inventoryQuery(Map form) async {
    try {
      final response = await _httpService.post(
          '/query/dataSet/shopStorage/pda/list',
          queryParameters: {'page': form['page'], 'limit': form['limit']},
          data: form);
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
}
