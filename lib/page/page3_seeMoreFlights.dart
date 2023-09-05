import 'package:app_cba/items/itemArrival.dart';
import 'package:app_cba/items/itemDepature.dart';
import 'package:flutter/material.dart';

class Page3_seeMore extends StatefulWidget {
  const Page3_seeMore({super.key});

  @override
  State<Page3_seeMore> createState() => _Page3_seeMoreState();
}

class _Page3_seeMoreState extends State<Page3_seeMore> {
  bool isClickFlights = true;
  bool isClickAirport = false;
  bool isClickAll = true;
  bool isClickDepature = false;
  bool isClickArrival = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toàn bộ lịch bay"),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 3.7 / 5,
                      height: 40,
                      child: const TextField(
                        decoration: InputDecoration(
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
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                                "assets/images/teenyicons_scan-solid.png")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 20, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isClickAll = true;
                              isClickDepature = false;
                              isClickArrival = false;
                            });
                          },
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                decoration: isClickAll
                                    ? TextDecoration.underline
                                    : TextDecoration.none),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClickAll = false;
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
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isClickAll = false;
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
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
