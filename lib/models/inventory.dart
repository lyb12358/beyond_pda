import 'package:isar/isar.dart';
part 'inventory.g.dart';

@collection
class Inventory {
  Id? id = Isar.autoIncrement;
  int? shopId;
  int? userId;
  String? documentCode;
  List<OnlineSingleProdInventory>? inventoryList;

  Inventory(
      {this.id,
      this.shopId,
      this.userId,
      this.documentCode,
      this.inventoryList});
}

@embedded
class OnlineSingleProdInventory {
  String? code;
  String? prodName;
  String? catName;
  String? speName;
  String? codeThumbnail;
  int? codeId;
  String? styleThumbnail;
  String? typeName;
  String? yearName;
  int? styleId;
  //数量
  int? num;
  int? onlineNum;
  int? diffNum;

  // OnlineSingleProdInventory(
  //     this.code,
  //     this.prodName,
  //     this.catName,
  //     this.speName,
  //     this.codeThumbnail,
  //     this.styleId,
  //     this.num,
  //     this.onlineNum,
  //     this.diffNum);
}
//flutter pub run build_runner build
