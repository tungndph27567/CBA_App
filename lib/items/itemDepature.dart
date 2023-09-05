import 'package:flutter/material.dart';

class itemDepature extends StatefulWidget {
  const itemDepature({super.key});

  @override
  State<itemDepature> createState() => _itemDepatureState();
}

class _itemDepatureState extends State<itemDepature> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/images/Vector.png"),
                ),
                Image.asset("assets/images/Rectangle 32.png"),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 75),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HPH-SGN",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 29, 107, 172))),
                          Text("VNA321",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 29, 107, 172))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "12:00",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 29, 107, 172)),
                          ),
                          Text("Depature",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 29, 107, 172))),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
