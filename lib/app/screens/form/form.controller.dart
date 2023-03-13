import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../home/home.controller.dart';
import '../../model/karyawan.dart';

class FormController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController kewarganegaraanController = TextEditingController();

  RxString tempImage = RxString('');
  Rx<JenisKelamin> jenisKelamin = JenisKelamin.lakiLaki.obs;
  DateTime? selectedDate;

  void _setTextFieldValue() {
    final Karyawan karyawan = Get.arguments['karyawan'];

    namaController.text = karyawan.namaLengkap;
    nikController.text = karyawan.nik.toString();
    tempatLahirController.text = karyawan.tempatLahir;
    tanggalLahirController.text = DateFormat('dd-MM-yyyy').format(karyawan.tanggalLahir);
    selectedDate = karyawan.tanggalLahir;
    alamatController.text = karyawan.alamat;
    pekerjaanController.text = karyawan.pekerjaan ?? '';
    kewarganegaraanController.text = karyawan.kewarganegaraan;
    tempImage = karyawan.photo.obs;
    jenisKelamin = karyawan.jenisKelamin.obs;
  }

  void tambah() {
    final HomeController homeController = Get.find();

    homeController.tambah(
      Karyawan(
        namaLengkap: namaController.text,
        photo: tempImage.value,
        tanggalLahir: selectedDate!,
        alamat: alamatController.text,
        nik: int.parse(nikController.text),
        tempatLahir: tempatLahirController.text,
        jenisKelamin: jenisKelamin.value,
        kewarganegaraan: kewarganegaraanController.text,
      ),
    );

    Get.back();
  }

  void edit() {
    final HomeController homeController = Get.find();

    homeController.edit(
      Get.arguments['index'],
      Karyawan(
        namaLengkap: namaController.text,
        photo: tempImage.value,
        tanggalLahir: selectedDate!,
        alamat: alamatController.text,
        nik: int.parse(nikController.text),
        tempatLahir: tempatLahirController.text,
        jenisKelamin: jenisKelamin.value,
        kewarganegaraan: kewarganegaraanController.text,
      ),
    );

    Get.back();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      tempImage.value = image.path;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate != null 
          ? selectedDate!
          : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return child ?? const SizedBox.shrink();
        });

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      tanggalLahirController.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
        // ..selection = TextSelection.fromPosition(TextPosition(
        //     offset: textEditingController.text.length,
        //     affinity: TextAffinity.upstream));
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      _setTextFieldValue();
    }
    super.onInit();
  }
}