import 'package:clean_api_integration/src/core/services/network_service/routes/api_routes.dart';
import 'package:clean_api_integration/src/modules/feature-mock/presentation/controllers/mock_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockScreen extends StatelessWidget {
  const MockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API integration')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.put(MockController()).fetchProducts();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder(
              init: MockController(),
              initState: (controller) {
                Get.put(MockController()).fetchProducts();
              },
              builder: (MockController controller) {
                if (controller.hasLoader(ApiRoutes.products)) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  itemCount: controller.productModel?.products?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    var data = controller.productModel?.products?[i];
                    return ListTile(
                      title: Text(data?.title ?? ''),
                      subtitle: Text("${data?.price ?? 0}"),
                    );
                  },
                  separatorBuilder: (_, i) {
                    return SizedBox(height: 8);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
