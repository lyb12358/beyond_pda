import 'package:flutter/material.dart';
import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:get/get.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';

class PdaOfflineScanPage extends StatefulWidget {
  const PdaOfflineScanPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return _MyState();
  }
}

// 第一步：混入ShangmiScanMixin
class _MyState extends State<PdaOfflineScanPage>
    with ShangmiScanMixin<PdaOfflineScanPage> {
  final OfflineScanController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('离线盘点'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print('乱点');
          },
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _dataTable(),
        )));
  }

  DataTable _dataTable() {
    return DataTable(
        showCheckboxColumn: false, columns: _dataColumns(), rows: _dataRows());
  }

  List<DataColumn> _dataColumns() {
    List<DataColumn> columns = [];
    columns.add(const DataColumn(label: Text("产品编号")));
    columns.add(const DataColumn(label: Text("数量")));
    return columns;
  }

  List<DataRow> _dataRows() {
    List<DataRow> rows = [];
    c.codeList.forEach((row) {
      rows.add(DataRow(
        cells: [DataCell(Text('${row.code}')), DataCell(Text('${row.num}'))],
      ));
    });
    return rows;
  }

  @override
  Future<void> shangmiCodeHandle(String code) async {
    /// 编写你的逻辑
    print('扫描到数据：$code');
    c.addCode(code);
  }
}


// class PdaOfflineScanPage extends GetResponsiveView<OfflineScanController> {
//   PdaOfflineScanPage({super.key});
//   @override
//   Widget? builder() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('离线盘点'.tr),
//       ),
//       body: GetX<OfflineScanController>(builder: (controller) {
//         return ListView(
//           children: [],
//         );
//       }),
//     );
//   }
// }
