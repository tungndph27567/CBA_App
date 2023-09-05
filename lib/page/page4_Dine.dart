import 'package:flutter/material.dart';

import '../items/itemDine.dart';

class Page4Dine extends StatefulWidget {
  const Page4Dine({super.key});

  @override
  State<Page4Dine> createState() => _Page4DineState();
}

class _Page4DineState extends State<Page4Dine> {
  List<Map<String, dynamic>> listDine = [
    {"type": "KFC", "name": "ABC", "img": "assets/images/Rectangle 35.png"},
    {
      "type": "Hamberger",
      "name": "XYZ",
      "img": "assets/images/Rectangle 35.png"
    },
    {"type": "KFC", "name": "ABC", "img": "assets/images/Rectangle 35.png"},
    {
      "type": "Hamberger",
      "name": "XYZ",
      "img": "assets/images/Rectangle 35.png"
    },
    {"type": "KFC", "name": "ABC", "img": "assets/images/Rectangle 35.png"},
    {
      "type": "Hamberger",
      "name": "XYZ",
      "img": "assets/images/Rectangle 35.png"
    },
    {"type": "KFC", "name": "ABC", "img": "assets/images/Rectangle 35.png"},
    {
      "type": "Hamberger",
      "name": "XYZ",
      "img": "assets/images/Rectangle 35.png"
    },
  ];
  List<Map<String, dynamic>> foundList = [];

  @override
  void initState() {
    super.initState();
    foundList.addAll(listDine);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 80,
                    child: Container(
                      child: SizedBox(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 20,
                      child: Icon(
                        Icons.search_sharp,
                        size: 40,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listDine.length,
                  itemBuilder: (context, index) {
                    return itemDine(
                      type: listDine[index]["type"],
                      name: listDine[index]["name"],
                      img: listDine[index]["img"],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
