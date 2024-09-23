import 'package:bottombar/bottom_nav_btn.dart';
import 'package:bottombar/clipper.dart';
import 'package:bottombar/constants.dart';
import 'package:bottombar/size_config.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late final PageController pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: PageView(
              controller: pageController,
              children: screens,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: buildBottomNaveBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomNaveBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.blockSizeHorizontal * 4.5,
        0,
        AppSizes.blockSizeHorizontal * 4.5,
        50,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
            width: AppSizes.screenWidth,
            height: AppSizes.blockSizeHorizontal * 15,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: AppSizes.blockSizeHorizontal * 3,
                  right: AppSizes.blockSizeHorizontal * 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomNavBtn(
                        icon: IconlyLight.home,
                        currentIndex: _currentIndex,
                        index: 0,
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                      ),
                      BottomNavBtn(
                        icon: IconlyLight.search,
                        currentIndex: _currentIndex,
                        index: 1,
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                      ),
                      BottomNavBtn(
                        icon: IconlyLight.category,
                        currentIndex: _currentIndex,
                        index: 2,
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                      ),
                      BottomNavBtn(
                        icon: IconlyLight.setting,
                        currentIndex: _currentIndex,
                        index: 3,
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                      ),
                      BottomNavBtn(
                        icon: IconlyLight.profile,
                        currentIndex: _currentIndex,
                        index: 4,
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                    child: Column(
                      children: [
                        Container(
                          height: AppSizes.blockSizeHorizontal * 1.0,
                          width: AppSizes.blockSizeHorizontal * 12,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            height: AppSizes.blockSizeHorizontal * 15,
                            width: AppSizes.blockSizeHorizontal * 12,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: gradent,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        )
                      ],
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                    left: animatedPositionedLeftValue(_currentIndex))
              ],
            )),
      ),
    );
  }
}
