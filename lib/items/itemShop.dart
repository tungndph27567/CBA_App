import 'package:flutter/material.dart';

class itemShop extends StatefulWidget {
  const itemShop({super.key});

  @override
  State<itemShop> createState() => _itemShopState();
}

class _itemShopState extends State<itemShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/Rectangle 36).png"),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SHOP A",
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 107, 172),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Terminal A",
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 107, 172),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                color: Colors.grey,
                child: SizedBox(
                    height: 1, width: MediaQuery.of(context).size.width),
              ),
            )
          ],
        ),
      ),
    );
  }
}
