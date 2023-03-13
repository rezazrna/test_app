class Karyawan {
  Karyawan({
    required this.namaLengkap,
    required this.photo,
    required this.tanggalLahir,
    required this.alamat,
    required this.nik,
    required this.tempatLahir,
    required this.jenisKelamin,
    this.pekerjaan,
    required this.kewarganegaraan,
  });
  
  int nik;
  String namaLengkap;
  String photo;
  String tempatLahir;
  DateTime tanggalLahir;
  JenisKelamin jenisKelamin;
  String alamat;
  String? pekerjaan;
  String kewarganegaraan;
}

enum JenisKelamin {
  lakiLaki,
  perempuan
}
