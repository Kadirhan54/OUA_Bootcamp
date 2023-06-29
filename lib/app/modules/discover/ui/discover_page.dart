import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/discover/controller/discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover Page')),
      body: Column(
        children: [
          GetBuilder<DiscoverController>(builder: (controller) {
            return Expanded(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.topics[index]),
                    titleAlignment: ListTileTitleAlignment.bottom,
                    trailing: Text('10 Ader Veri'),
                    leading: Text('10 Ader Veri'),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
