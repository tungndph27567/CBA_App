import 'package:app_cba/items/itemAirPortGuides.dart';
import 'package:app_cba/items/itemAirPortService.dart';
import 'package:flutter/material.dart';

class Page3_Airport extends StatefulWidget {
  const Page3_Airport({super.key});

  @override
  State<Page3_Airport> createState() => _Page3_AirportState();
}

class _Page3_AirportState extends State<Page3_Airport> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    if (MediaQuery.of(context).size.width < 600) {
      count = 2;
    } else if (MediaQuery.of(context).size.width < 1000) {
      count = 3;
    } else {
      count = 4;
    }
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 25),
              child: Row(
                children: [
                  Expanded(
                      flex: 50,
                      child: Text(
                        "AIRPORT GUIDES",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const itemAirPortGuides();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Ellipse 159.png"),
                      const Text("Free Water")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Ellipse 160.png"),
                      const Text("Free Wifi")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Ellipse 161.png"),
                      const Text("Wheelchair")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Ellipse 162.png"),
                      const Text("Media Services")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 9,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count),
                itemBuilder: (context, index) {
                  return const itemAirPortService();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
