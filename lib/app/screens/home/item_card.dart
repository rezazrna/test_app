import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/model/karyawan.dart';
import 'package:myapp/app/routes/app_routes.dart';
import 'package:myapp/app/screens/home/home.controller.dart';

class ItemCard extends StatelessWidget {

  const ItemCard({
    super.key,
    required this.karyawan,
    required this.index,
  });

  final Karyawan karyawan;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(
              image: Uri.parse(karyawan.photo).isAbsolute
                ? NetworkImage(karyawan.photo)
                : FileImage(io.File(karyawan.photo)) as ImageProvider,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${karyawan.nik}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    karyawan.namaLengkap,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.form,
                      arguments: {
                        'karyawan': karyawan,
                        'index': index,
                      }
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    final HomeController controller = Get.find();

                    controller.listKaryawan.removeAt(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}