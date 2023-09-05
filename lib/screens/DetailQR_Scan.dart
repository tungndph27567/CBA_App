import 'package:flutter/material.dart';

class Detail_QRSCAN extends StatefulWidget {
  final String code;
  final Function() closeScreen;
  const Detail_QRSCAN(
      {super.key, required this.closeScreen, required this.code});

  @override
  State<Detail_QRSCAN> createState() => _Detail_QRSCANState();
}

class _Detail_QRSCANState extends State<Detail_QRSCAN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.closeScreen();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black87,
        ),
      ),
    );
  }
}
