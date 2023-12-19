import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/remoteService.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/scrollJobs.dart';

class DistrictJobsScreen extends StatefulWidget {
  int id;
  List<Job>? jobs;

  DistrictJobsScreen({Key? key, required this.id, required this.jobs}) : super(key: key);

  @override
  State<DistrictJobsScreen> createState() => _DistrictJobsScreenState();
}

class _DistrictJobsScreenState extends State<DistrictJobsScreen> {
  Map<int, String> idDistrict = {
    1: 'Aveiro',
    3: 'Beja',
    4: 'Braga',
    5: 'Bragança',
    6: 'Castelo Branco',
    8: 'Coimbra',
    9: 'Faro',
    10: 'Évora',
    11: 'Guarda',
    12: 'Portalegre',
    13: 'Leiria',
    14: 'Lisboa',
    16: 'Viseu',
    17: 'Setúbal',
    18: 'Porto',
    20: 'Santarém',
    21: 'Vila Real',
    22: 'Viana do Castelo',
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          GradientBackground(screenHeight: screenHeight),
          // Go back arrow
          Positioned(
            top: screenHeight * 0.12,
            left: screenWidth * 0.12,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapScreen()),
                );
              },
              child:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 40),
            ),
          ),
          // District name
          Positioned(
            top: screenHeight * 0.17,
            left: screenWidth * 0.12,
            child: Text(
              idDistrict[widget.id]!, // get district name from id
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          // Empregos (texto)
          Positioned(
            top: screenHeight * 0.22,
            left: screenWidth * 0.12,
            child: Text(
              'Empregos', // get district name from id
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          // scroll jobs
          ScrollJobs(jobs: widget.jobs!)
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
