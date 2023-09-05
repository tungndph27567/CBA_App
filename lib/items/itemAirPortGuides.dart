import 'package:flutter/material.dart';

class itemAirPortGuides extends StatefulWidget {
  const itemAirPortGuides({super.key});

  @override
  State<itemAirPortGuides> createState() => _itemAirPortGuidesState();
}

class _itemAirPortGuidesState extends State<itemAirPortGuides> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: SizedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const SizedBox(
              width: 130,
              height: 155,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 199, 196, 196)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 23,
              child: Column(
                children: [
                  Image.asset("assets/images/Rectangle 8.png"),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Passenger Guide",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
