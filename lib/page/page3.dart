import 'package:app_cba/page/page3_airport.dart';
import 'package:app_cba/page/page3_flight.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isClick = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isClick = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 100,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Transform.translate(
                  offset: const Offset(20, -10),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isClick = true;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor:
                                isClick ? Colors.black : Colors.white,
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: isClick
                                    ? FontWeight.bold
                                    : FontWeight.normal)),
                        child: const Text("Flights"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isClick = false;
                            });
                          },
                          style: TextButton.styleFrom(
                              foregroundColor:
                                  isClick ? Colors.white : Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: isClick
                                      ? FontWeight.normal
                                      : FontWeight.bold)),
                          child: const Text("Airport"),
                        ),
                      )
                    ],
                  )),
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
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: isClick ? const Page3_Flights() : const Page3_Airport(),
            ),
          )
        ],
      ),
    );
  }
}
