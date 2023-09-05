import 'package:flutter/material.dart';

class itemAirPortService extends StatefulWidget {
  const itemAirPortService({super.key});

  @override
  State<itemAirPortService> createState() => _itemAirPortServiceState();
}

class _itemAirPortServiceState extends State<itemAirPortService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 60,
                child: Image.asset(
                  "assets/images/Rectangle 29.png",
                  fit: BoxFit.cover,
                )),
            const Expanded(
              flex: 30,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Food Service",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
