import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KNNKualitasController extends GetxController {
  //berapa tetangga terdekat yang menjadi acuan
  int k = 5;

  final box = GetStorage();
  String? kualitas;
  void getKualitas(List edList) {
    var sum = 0;
    final int panjang = (k > edList.length) ? edList.length : k;
    for (var i = 0; i < panjang; i++) {
      sum = edList[i]['kualitas'] + sum;
    }

    if (sum > k / 2) {
      kualitas = 'Layak';
    } else {
      kualitas = 'Tidak Layak';
    }
    update();

    //simpan status kualitas ke get storage
    box.write('kualitas', kualitas);
  }

  Future<void> updateKualitas(String kualitasData) async {
    kualitas = kualitasData;
    update();
  }

  void updateN(int nData) {
    k = nData;
    update();
    box.write('n', k);
  }
}
