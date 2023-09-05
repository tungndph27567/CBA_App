import 'package:app_cba/page/page1.dart';
import 'package:app_cba/page/page2.dart';
import 'package:app_cba/page/page3.dart';
import 'package:app_cba/page/page4.dart';
import 'package:app_cba/page/page5.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

class Bottombar extends StatefulWidget {
  int selectedIndex = 2;
  Bottombar({super.key, required this.selectedIndex});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int currentIndex = 2;
  List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];
  onTapPages(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = widget.selectedIndex;
    onTapPages(widget.selectedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 198, 196, 196),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: BottomBarInspiredFancy(
              onTap: onTapPages,
              indexSelected: currentIndex,
              items: const [
                TabItem(
                  icon: Icons.directions_car,
                ),
                TabItem(
                  icon: Icons.map_outlined,
                ),
                TabItem(
                  icon: Icons.flight,
                ),
                TabItem(
                  icon: Icons.store,
                ),
                TabItem(
                  icon: Icons.menu,
                ),
              ],
              backgroundColor: const Color.fromARGB(255, 198, 196, 196),
              color: Colors.white,
              colorSelected: const Color.fromARGB(255, 90, 171, 237)),
        ),
      ),
    );
  }
}
