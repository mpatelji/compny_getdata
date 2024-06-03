import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'contact_page.dart';
import 'controller_class_getx.dart';

class SecondViewPage extends StatefulWidget {
  SecondViewPage({
    super.key,
  });

  @override
  State<SecondViewPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "ViewPage",
            style: TextStyle(color: Colors.white),
          )),
      body: Column(children: [
        Expanded(
            child: Center(
              // child: Obx(() => Text("data")),
          child: GetBuilder(
            init: ViewData(),
            builder: (controller2) {
              if (controller2.listData.isEmpty) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller2.listData.length,
                  itemBuilder: (context, index) {
                    var data = controller2.listData[index];
                    return InkWell(
                        onTap: () {
                          Get.to(contactpage(
                            company: data,
                          ));
                        },
                        child: Container(
                            width: 300,
                            child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "https://thumbs.dreamstime.com/z/mountain-view-ca-usa-may-exterior-googleplex-building-corporate-headquarters-complex-google-its-parent-company-136447366.jpg?w=992"),
                                            maxRadius: 40),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("${data.phone}"),
                                        Text("${data.email}"),
                                        Text("${data.website}"),
                                      ],
                                    )
                                  ],
                                ))));
                  },
                );
              }
            },
          ),
        ))
      ]),
    );
  }
}
