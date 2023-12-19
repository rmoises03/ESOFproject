import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:html/parser.dart';
import '../../utils.dart';
import '../widgets/navBar.dart';
import 'company-details-screen.dart';


class JobDetailsScreen extends StatelessWidget {
  final Job job;

  JobDetailsScreen({required this.job});

  Map<int, String> idDistrict = {
    0: 'Undefined',
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

  String? _parseHtmlString(String? htmlString) {
    var document = parse(htmlString);
    String? parsedString =
        parse(document.body?.text ?? '').documentElement?.text; // Use null assertion here
    return parsedString;
  }

  String _writeSalary() {
    String salary = "Salary: ";
    if (job.wage == null)
      salary += "Undefined";
    else
      salary += job.wage.toString() + "€";
    return salary;
  }

  String _writeRemote() {
    String remote = "Remote: ";
    if (job.allowRemote == true)
      remote += "Yes";
    else
      remote += "No";
    return remote;
  }

  String _writeLocation() {
    String location = "Location: ";
    String space = "\n             ->";
    if (job.locationId == null) {
      return location + "None";
    }
    for (int i = 0; i < job.locationId!.length; i++) {
      location += job.locationId![i]['name'].toString() + space;
    }
    return location.substring(0, location.length - space.length);
  }

  String _writeTypes() {
    String type = "Type: ";
    String space = "\n          ->";
    if (job.typeId == null) {
      return type + "None";
    }
    for (int i = 0; i < job.typeId!.length; i++) {
      type += job.typeId![i]['name'].toString() + space;
    }
    return type.substring(0, type.length - space.length);
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;


    return Scaffold(
      key: const Key('jobDetailsScreen'),
      bottomNavigationBar: const NavBar(
        pageNumber: 1,
      ),
      body: Stack(
        children: [
          GradientBackground(screenHeight: screenHeight),

          Positioned(
            top: 0.05 * screenHeight,
            left: 0.1 * screenWidth,
            child: SizedBox (
              width: screenWidth * 0.8,
              height: screenHeight *0.2,

              child: Text(
                job.title ?? "No name",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
              child: const Divider(
                color: Colors.white, // Set the color of the line to white
                thickness: 2.0, // Set the thickness of the line
              ),
          ),

          Positioned(
              top: 0.17 * screenHeight,
              left: 0.1 * screenWidth,
              child: SizedBox (
                width: screenWidth * 0.6,
                height: screenHeight *0.1,
                child:  Text(
                  "Description:",
                  textAlign: TextAlign.left,
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffffffff),
                  ),
              ),
           ),
          ),

            Positioned(
              top: 0.22* screenHeight,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment(0, -0.001 * screenHeight),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  child: SingleChildScrollView(
                    child: Text(
                      _parseHtmlString(job.body ?? "No Description")!,
                      textAlign: TextAlign.left,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffffffff),

                        ),
                      ),
                    ),
                ),
              ),
            ),
          Positioned(
            top: 0.54 * screenHeight,
            right: 0.05 * screenWidth,

              child: SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.1,
                  child: Text(
                    _writeSalary(),
                    textAlign: TextAlign.left,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
            ),
          Positioned(
            top: 0.54 * screenHeight,
            left: 0.1 * screenWidth,

            child: SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.1,
              child: Text(
                _writeRemote(),
                textAlign: TextAlign.left,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffffffff),

                ),
              ),
            ),
          ),
          Positioned(
            top: 0.60  * screenHeight,
            right: 0.02 * screenWidth,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.1,
                child: Text(
                  _writeLocation(),
                  textAlign: TextAlign.left,
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffffffff),

                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.60 * screenHeight,
            left: 0.05 * screenWidth,
            right: 0,


              child: SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.1,
                child: SingleChildScrollView(
                  child: Text(
                    _writeTypes(),
                    textAlign: TextAlign.left,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.80,
            left: 0,
            right: 0,
            child: const Divider(
              color: Colors.white, // Set the color of the line to white
              thickness: 2.0, // Set the thickness of the line
            ),
          ),
          Positioned(
            top: 0.82 * screenHeight,
            left: 0.1 * screenWidth,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyDetailsScreen(company: job.company!, job: job),
                  ),
                );
              },
              child: SizedBox (
                width: screenWidth * 0.8,
                height: screenHeight *0.2,

                child: Text(
                  job.company?.name ?? "No name",
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),

        ]
        ),
      backgroundColor: Colors.black,

    );
  }
}
