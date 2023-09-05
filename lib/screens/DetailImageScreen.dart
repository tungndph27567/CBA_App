import 'package:flutter/material.dart';

class DetailImageScreen extends StatefulWidget {
  const DetailImageScreen(
      {super.key, required this.list, required this.indexImage});
  final List<Map<String, dynamic>> list;
  final int indexImage;

  @override
  State<DetailImageScreen> createState() => _DetailImageScreenState();
}

class _DetailImageScreenState extends State<DetailImageScreen> {
  late PageController _pageController;
  late TransformationController _transformationController;
  int _currentPage = 0;
  late bool swapPage;
  @override
  void initState() {
    super.initState();
    swapPage = true;
    _currentPage = widget.indexImage;
    _transformationController = TransformationController();
    _pageController = PageController(initialPage: widget.indexImage);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String possition = '${_currentPage + 1}/${widget.list.length}';

    return Scaffold(
        appBar: AppBar(
          title: Text(possition),
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Container(
              child: SizedBox(
                child: PageView.builder(
                  physics: swapPage
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 20),
                          child: InteractiveViewer(
                            transformationController: _transformationController,
                            onInteractionEnd: (details) {
                              if (_transformationController.value
                                      .getMaxScaleOnAxis() ==
                                  1.0) {
                                setState(() {
                                  swapPage = true;
                                });
                              } else {
                                setState(() {
                                  swapPage = false;
                                });
                              }
                            },
                            maxScale: 5,
                            child: Image.asset(
                              widget.list[index]["imageUrl"],
                              // height: orientation=="landscape"? MediaQuery.of(context).size.height*0.7:,
                              height: MediaQuery.of(context).size.height * 0.6,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            widget.list[index]["name"],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
