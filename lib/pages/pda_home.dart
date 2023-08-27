import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Column(
            children: [
              Icon(
                Icons.wifi_outlined,
                size: 80,
                color: Colors.lightBlue,
              ),
              Text(
                "在线盘点",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 15,
                ),
              )
            ],
          ),
          onPressed: () {},
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          child: const Column(
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: 80,
                color: Colors.orange,
              ),
              Text(
                "离线盘点",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                ),
              )
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
