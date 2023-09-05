import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dropdown_button2/dropdown_button2.dart';

import '../screens/DetailImageScreen.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String? selectedValue;
  List<Map<String, dynamic>> listImage = [
    {
      "imageUrl": "assets/images/EXIT T1.jpg",
      "name": "Sơ đồ lối thoát hiểm tầng 1"
    },
    {
      "imageUrl": "assets/images/EXIT T2.jpg",
      "name": "Sơ đồ lối thoát hiểm tầng 2"
    },
    {"imageUrl": "assets/images/TERMINAL.jpg", "name": "TERMINAL"},
  ];
  List<Map<String, dynamic>> listImage2 = [];
  @override
  void initState() {
    super.initState();
    listImage2.addAll(listImage);
  }

  @override
  Widget build(BuildContext context) {
    double size = 0;
    if (MediaQuery.of(context).size.width > 1000) {
      size = MediaQuery.of(context).size.width * 3 / 4;
    } else if (MediaQuery.of(context).size.width > 680) {
      size = MediaQuery.of(context).size.width * 3 / 4;
    } else {
      size = MediaQuery.of(context).size.width;
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 100,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Transform.translate(
                offset: const Offset(30, -20),
                child: const Row(
                  children: [
                    Text(
                      "CatBi Airport Map",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.blue],
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Image.asset("assets/images/logo_CBI.png"),
                        )
                      ],
                    ),
                  ],
                )),
          ),
          SliverList.builder(
            itemCount: listImage2.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailImageScreen(
                                list: listImage,
                                indexImage: index,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(children: [
                    Image.asset(
                      listImage2[index]["imageUrl"],
                      fit: BoxFit.cover,
                      width: size,
                    ),
                    Text(
                      listImage2[index]["name"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                    )
                  ]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
