import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller_class_getx.dart';
import 'model_class_company.dart';

class contactpage extends StatefulWidget {
  final Datum company;

   contactpage({super.key, required this.company});


  @override
  State<contactpage> createState() => _contactpageState();
}

class _contactpageState extends State<contactpage> {
  @override
  var textColor=Colors.blueGrey;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, title: Text("View Contect")),
      body: Center(
        child: GetBuilder(
            init: ViewData(),
            builder: (Intance) => Card(
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(children: [
                                CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://thumbs.dreamstime.com/z/mountain-view-ca-usa-may-exterior-googleplex-building-corporate-headquarters-complex-google-its-parent-company-136447366.jpg?w=992"),
                                    maxRadius: 40),


                                StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                                  return  InkWell(
                                    onHover: (value){
                                      if(value){
                                        textColor = Colors.blue;
                                      }else{
                                        textColor = Colors.cyan;
                                      }
                                      setState((){});

                                    },
                                    onTap: () {
                                      var a = widget.company;
                                      launch("${a.website}");
                                    },
                                    child:  Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Tooltip(
                                        message: ' ${widget.company.website} ',
                                        child: Text(
                                          ' ${widget.company.website} ',style: TextStyle(color: textColor,decoration: TextDecoration.underline),
                                          // textDirection: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  );
                                },),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${widget.company.vat}"),
                                    Text("${widget.company.contact}"),
                                    Text("${widget.company.phone}"),
                                    Text("${widget.company.name}"),
                                  ],
                                )
                              ])
                            ]),
                      ),
                      Text("Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Divider(
                        color: Colors.black38,
                      ),
                      Expanded(child: Getmethod()),
                      Text("Contact",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Divider(
                        color: Colors.black38,
                      ),
                      Text("${widget.company.contact?.firstname}"),
                      Text("${widget.company.contact?.id}"),
                      Text("${widget.company.contact?.birthday}"),
                      Text("${widget.company.contact?.lastname}"),
                      Text("${widget.company.contact?.gender}"),
                      Text("${widget.company.contact?.email}"),
                    ],
                  ),
                )),
      ),
    );
  }

  Getmethod() {
    var Data = widget.company.addresses ?? List<Address>.empty();
    return ListView.builder(
        itemCount: Data.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${Data[index].zipcode}"),
                  Text("${Data[index].city}"),
                  Text("${Data[index].longitude}"),
                  Text("${Data[index].street}"),
                  Text("${Data[index].streetName}"),
                ],
              ),
          );
        });
  }
}
