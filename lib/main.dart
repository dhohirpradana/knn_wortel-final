import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knn_wortel/pages/foundation_page.dart';
import 'getx/image_picker.dart';
import 'getx/knn.dart';
import 'getx/knn_kualitas.dart';
import 'getx/palette_generator.dart';

Future<void> main() async {
  //start get storage (Store Management)
  await GetStorage.init();

  //inisialisasi get yang ada di app
  final controller = Get.put(ImagePickerController());
  final knnController = Get.put(KNNController());
  final knnKualitasController = Get.put(KNNKualitasController());
  final paletteGeneratorController = Get.put(PaletteController());

  //deklarasi get storage/ inisialisasi
  final box = GetStorage();

  //membaca data get storage
  final imagePath = box.read('imagePath');
  final knnData = box.read('knn');
  final kualitasData = box.read('kualitas');
  final rgbhsl = box.read('rgbhsl');
  final n = box.read('n') ?? 3;

  //jika data tidak kosong maka ...
  if (imagePath != null &&
      imagePath != '' &&
      knnData != null &&
      kualitasData != null &&
      rgbhsl != null) {
    controller.updateImagePath(imagePath);
    knnController.updateKNN(knnData);
    paletteGeneratorController.getStorageRGBHSL(rgbhsl);
    knnKualitasController.updateN(n);
    await knnKualitasController.updateKualitas(kualitasData);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KNN WORTEL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoundationPage(),
    );
  }
}
