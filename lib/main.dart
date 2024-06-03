import 'package:compny_getdata/show_data_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("fIRST"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blueGrey,

          onPressed: (){
            Get.to(SecondViewPage());
          },
          child: Text("Company"),
        ),
      ),
    );
  }
}

