import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/app/model/karyawan.dart';
import 'package:myapp/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final RxList<Karyawan> listKaryawan = [
    Karyawan(
      namaLengkap: 'Joko Widodo', 
      photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Joko_Widodo_2014_official_portrait.jpg/1200px-Joko_Widodo_2014_official_portrait.jpg', 
      tanggalLahir: DateTime(1985, 12, 03), 
      alamat: 'Jalan Merdeka No 13 RT 02 Rw 03 Kelurahan Sukaasih Kecamatan Bojongloa Kaler', 
      nik: 1234567, 
      tempatLahir: 'Solo', 
      jenisKelamin: JenisKelamin.lakiLaki, 
      pekerjaan: 'Presiden',
      kewarganegaraan: 'Indonesia',
    ),
    Karyawan(
      namaLengkap: "Ma'ruf Amin", 
      photo: 'https://pbs.twimg.com/profile_images/1186108202808565760/Mk4yocJn_400x400.jpg', 
      tanggalLahir: DateTime(1970, 07, 13), 
      alamat: 'Jalan Veteran No 20 RT 02 Rw 03 Kelurahan Sukaasih Kecamatan Bojongloa Kaler', 
      nik: 11212132, 
      tempatLahir: 'Bogor', 
      jenisKelamin: JenisKelamin.lakiLaki, 
      pekerjaan: 'Wakil Presiden',
      kewarganegaraan: 'Indonesia',
    ),
    Karyawan(
      namaLengkap: "Megawati", 
      photo: 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Megawati_Sukarnoputri_official_portrait.jpg', 
      tanggalLahir: DateTime(1960, 02, 22), 
      alamat: 'Jalan Soekarno Hatta No 20 RT 02 Rw 03 Kelurahan Sukaasih Kecamatan Bojongloa Kaler', 
      nik: 32162181, 
      tempatLahir: 'Jakarta', 
      jenisKelamin: JenisKelamin.perempuan, 
      pekerjaan: 'Presiden ke-4',
      kewarganegaraan: 'Indonesia',
    ),
    Karyawan(
      namaLengkap: "Dewi Sartika", 
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Raden_Dewi_Sartika.jpg', 
      tanggalLahir: DateTime(1988, 01, 02), 
      alamat: 'Jalan Dewi Sartika No 20 RT 02 Rw 03 Kelurahan Sukaasih Kecamatan Bojongloa Kaler', 
      nik: 33262532, 
      tempatLahir: 'Bandung', 
      jenisKelamin: JenisKelamin.perempuan,
      kewarganegaraan: 'Indonesia',
    ),
    Karyawan(
      namaLengkap: "BJ Habibie", 
      photo: 'https://upload.wikimedia.org/wikipedia/commons/2/2a/B._J._Habibie%2C_President_of_Indonesia_portrait.jpg', 
      tanggalLahir: DateTime(1955, 01, 29), 
      alamat: 'Jalan Kebangsaan No 11 RT 02 Rw 08 Kelurahan Sukaasih Kecamatan Bojongloa Kaler', 
      nik: 11212132, 
      tempatLahir: 'Surabaya', 
      jenisKelamin: JenisKelamin.lakiLaki, 
      pekerjaan: 'Presiden ke-3',
      kewarganegaraan: 'Indonesia',
    ),
  ].obs;

  void delete(int index) {
    listKaryawan.removeAt(index);
  }

  void edit(int index, Karyawan newValue) {
    listKaryawan[index] = newValue;
  }

  void tambah(Karyawan value) {
    listKaryawan.add(value);
  }

  Future<void> logout() async {
    final Box myBox = await Hive.openBox('myBox');

    await myBox.delete('hasSignIn');

    Get.offAllNamed(AppRoutes.login);
  }
}