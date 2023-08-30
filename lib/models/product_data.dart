import 'package:isar/isar.dart';
part 'product_data.g.dart';

@collection
class ProductData {
  Id? id;
  int? codeId;
  int? styleId;
  @Index()
  String? prodCode;
  String? prodName;
  String? catName;
  String? speName;
  String? codeThumbnail;

  ProductData(
      {this.id,
      this.codeId,
      this.styleId,
      this.prodCode,
      this.prodName,
      this.catName,
      this.speName,
      this.codeThumbnail});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      codeId: json['codeId'],
      styleId: json['styleId'],
      prodCode: json['prodCode'],
      prodName: json['prodName'],
      catName: json['catName'],
      speName: json['speName'],
      codeThumbnail: json['codeThumbnail'],
    );
  }
}
