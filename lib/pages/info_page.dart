import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width - 20,
        child: Column(
          children: const [
            Text(
              'Aplikasi ini dibuat untuk mengetahui kualitas wortel yang layak jual sehingga mempermudah pemilihan wortel yang bagus dan layak konsumsi meliputi warna bentuk dan ukuran.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
