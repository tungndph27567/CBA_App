import 'package:app_cba/items/itemShop.dart';
import 'package:flutter/material.dart';

class Page4Shop extends StatefulWidget {
  const Page4Shop({super.key});

  @override
  State<Page4Shop> createState() => _Page4ShopState();
}

class _Page4ShopState extends State<Page4Shop> {
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const itemShop();
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
