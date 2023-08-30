import 'package:isar/isar.dart';
part 'inventory_detail.g.dart';

@collection
class InventoryDetail {
  Id? id = Isar.autoIncrement;
  int? parentId;
  String? code;
  int? num;

  InventoryDetail({this.id, this.parentId, this.code, this.num});
}

//flutter pub run build_runner build
