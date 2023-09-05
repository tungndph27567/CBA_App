import 'package:app_cba/items/itemArrival.dart';
import 'package:app_cba/items/itemDepature.dart';
import 'package:app_cba/items/itemWeather.dart';
import 'package:app_cba/page/page3_seeMoreFlights.dart';
import 'package:app_cba/screens/QR_ScanScreen.dart';
import 'package:flutter/material.dart';

class Page3_Flights extends StatefulWidget {
  const Page3_Flights({super.key});

  @override
  State<Page3_Flights> createState() => _Page3_FlightsState();
}

class _Page3_FlightsState extends State<Page3_Flights> {
  bool isClickDepature = true;
  bool isClickArrival = false;
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                child: itemWeather(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/Rectangle 12.png"),
                      Image.asset("assets/images/Rectangle 13.png"),
                      Image.asset("assets/images/Rectangle 14.png")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 3.7 / 5,
                      child: TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 1 / 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const QR_Scan_Screen();
                                  },
                                ));
                              },
                              child: Image.asset(
                                "assets/images/teenyicons_scan-solid.png",
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 25, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isClickDepature = true;
                              isClickArrival = false;
                            });
                          },
                          child: Text(
                            "Depature",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                decoration: isClickDepature
                                    ? TextDecoration.underline
                                    : TextDecoration.none),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClickDepature = false;
                                isClickArrival = true;
                              });
                            },
                            child: Text(
                              "Arrival",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: isClickArrival
                                      ? TextDecoration.underline
                                      : TextDecoration.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Page3_seeMore();
                              },
                            ));
                          },
                          child: const Text(
                            "See more >>",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 540,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return isClickDepature
                        ? const itemDepature()
                        : const itemArrival();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
