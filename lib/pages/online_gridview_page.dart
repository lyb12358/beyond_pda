import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class OnlineGridviewPage extends StatelessWidget {
  const OnlineGridviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.only(left: 40, top: 150, right: 40),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.barcode_reader,
                    size: 50,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "扫码",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 50,
                    color: Colors.purple,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "盘点挂单",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {
                BrnLoadingDialog.show(context, barrierDismissible: false);
                Future.delayed(Duration(seconds: 5)).then((_) {
                  BrnLoadingDialog.dismiss(context, 'dismiss 定时取消');
                });
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work_history,
                    size: 50,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "历史盘点",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 50,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "离线盘点",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
