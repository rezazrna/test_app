import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_routes.dart';

import 'package:myapp/app/screens/home/home.controller.dart';
import 'package:myapp/app/screens/home/item_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({ super.key });

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () {
            return ListView.builder(
              itemCount: controller.listKaryawan.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  karyawan: controller.listKaryawan[index],
                  index: index,
                );
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.form);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}