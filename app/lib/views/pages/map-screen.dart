import 'package:flutter/material.dart';
import 'package:myapp/views/pages/offers-screen.dart';
import 'package:myapp/views/widgets/mapImage.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/navBar.dart';
import 'package:myapp/views/pages/filter-screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      key: const Key("mapScreen"),
      bottomNavigationBar: const NavBar(
        pageNumber: 1,
      ),
      body: Stack(children: [
        // Gradient background
        GradientBackground(screenHeight: screenHeight),
        // row de filtro e settings
        Positioned(
          left: 0,
          right: 0,
          top: screenHeight / 12,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              key: const Key("filterButton"),
              onPressed: () {
                // Changes to the other screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FilterScreen()),
                );
              },
              child: SizedBox(
                width: screenWidth * 0.10,
                height: screenWidth * 0.10,
                child: Image.asset(
                  'assets/page-1/images/buttonfilter.png',
                  width: screenWidth * 0.10,
                  height: screenWidth * 0.10,
                ),
              ),
            ),
            SizedBox(width: screenWidth - screenWidth / 2.5),
            TextButton(
              onPressed: () {
                // Changes to the other screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OffersScreen()),
                );
              },
              child: SizedBox(
                width: screenWidth * 0.10,
                height: screenWidth * 0.10,
                child: Image.asset(
                  'assets/page-1/images/buttonsettings.png',
                  width: screenWidth * 0.10,
                  height: screenWidth * 0.10,
                ),
              ),
            ),
          ]),
        ),
        const MapImage(),
      ]),
      backgroundColor: Colors.black,
    );
  }
}
