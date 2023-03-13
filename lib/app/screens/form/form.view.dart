import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form.controller.dart';
import '../../model/karyawan.dart';

class FormScreen extends StatelessWidget {
  FormScreen({ super.key });

  final FormController controller = Get.put(FormController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool readOnly = Get.arguments?['readOnly'] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Karyawan'),
        actions: [
          if (!readOnly)
          IconButton(
            onPressed: () {
              if (controller.tempImage.value == '') {
                Get.dialog(
                  const AlertDialog(
                    content: Text('Foto tidak boleh kosong'),
                  ),
                );
                return;
              }

              if (_formKey.currentState!.validate()) {
                if (Get.arguments != null) {
                  controller.edit();
                } else {
                  controller.tambah();
                }
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                readOnly: readOnly,
                controller: controller.nikController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'NIK',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.numbers)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || !value.isNumericOnly) {
                    return 'Harus diisi dengan number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: readOnly,
                controller: controller.namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.person)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Obx(
                () {
                  return IgnorePointer(
                    ignoring: readOnly,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        suffixIcon: Icon(Icons.male)
                      ),
                      child: DropdownButton<JenisKelamin>(
                        value: controller.jenisKelamin.value,
                        onChanged: (JenisKelamin? value) {
                          if (value == null) {
                            return;
                          }
                          controller.jenisKelamin.value = value;
                        },
                        items: JenisKelamin.values.map<DropdownMenuItem<JenisKelamin>>((JenisKelamin value) {
                          return DropdownMenuItem<JenisKelamin>(
                            value: value,
                            child: Text(
                              value == JenisKelamin.lakiLaki
                               ? 'Laki - Laki'
                               : 'Perempuan',
                              ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(height: 10),
              TextFormField(
                focusNode: AlwaysDisabledFocusNode(),
                controller: controller.tanggalLahirController,
                onTap: () {
                  if (readOnly) {
                    return;
                  }
                  controller.selectDate(context);
                },
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.date_range)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: readOnly,
                controller: controller.tempatLahirController,
                decoration: InputDecoration(
                  labelText: 'Tempat Lahir',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.house)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: readOnly,
                controller: controller.alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.home)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: readOnly,
                controller: controller.pekerjaanController,
                decoration: InputDecoration(
                  labelText: 'Pekerjaan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.work)
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: readOnly,
                controller: controller.kewarganegaraanController,
                decoration: InputDecoration(
                  labelText: 'Kewarganegaraan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.flag)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Foto'),
                  if (!readOnly)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: controller.pickImage,
                          child: const Text('Pilih Foto'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () {

                        return Image(
                          image: Uri.parse(controller.tempImage.value).isAbsolute
                            ? NetworkImage(controller.tempImage.value)
                            : FileImage(io.File(controller.tempImage.value)) as ImageProvider,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      }
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}