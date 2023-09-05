import 'package:flutter/material.dart';

class itemDine extends StatefulWidget {
  String type, name, img;

  itemDine(
      {super.key, required this.type, required this.name, required this.img});

  @override
  State<itemDine> createState() => _itemDineState();
}

class _itemDineState extends State<itemDine> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(widget.img),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.type,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 29, 107, 172),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
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
