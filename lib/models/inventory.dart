import 'package:isar/isar.dart';
part 'inventory.g.dart';

@collection
class Inventory {
  Id? id = Isar.autoIncrement;
  int? shopId;
  int? userId;
  String? documentCode;
  //单据id
  int? documentId;
  //盘点时间
  String? checkTime;
  //创建时间
  String? createTime;
  //产品编号数
  int? prodTotal;
  //盘点数量
  int? total;
  //状态(0:录入中,1:已盘点,2:作废,3:确认)
  int? status;
  String? remark;
  List<OnlineSingleProdInventory>? inventoryList;

  Inventory(
      {this.id,
      this.shopId,
      this.userId,
      this.documentCode,
      this.documentId,
      this.checkTime,
      this.createTime,
      this.prodTotal,
      this.total,
      this.status,
      this.remark,
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
