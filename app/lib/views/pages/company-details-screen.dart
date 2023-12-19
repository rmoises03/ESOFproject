import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:html/parser.dart';
import '../../utils.dart';
import '../widgets/navBar.dart';
import 'job-details-screen.dart';


class CompanyDetailsScreen extends StatelessWidget {
  final Company company;
  final Job job;

  CompanyDetailsScreen({required this.company, required this.job});

  String writeTwitter() {
    if (company.urlTwitter == null)
      return " No twitter";
    int index = company.urlTwitter!.indexOf(".com/");
    return company.urlTwitter!.substring(index + 5, company.urlTwitter!.length);
  }

  String writeFacebook() {
    if (company.urlFacebook == null)
      return " No facebook";
    int index = company.urlFacebook!.indexOf(".com/");
    return company.urlFacebook![company.urlFacebook!.length - 1] == "/" ? company.urlFacebook!.substring(index + 5, company.urlFacebook!.length - 1) : company.urlFacebook!.substring(index + 5, company.urlFacebook!.length);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double aspectRatio = MediaQuery
        .of(context)
        .size
        .aspectRatio;


    return Scaffold(
      bottomNavigationBar: const NavBar(
        pageNumber: 1,
      ),
      body: Stack(
          children: [
            GradientBackground(screenHeight: screenHeight),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.08, left: screenWidth * 0.05),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailsScreen(job: job),
                      ),
                    );
                  },
                  child: const Icon(Icons.arrow_back,
                  color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.08, right: screenWidth * 0.05),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailsScreen(job: job),
                      ),
                    );
                  },
                  child: Text (
                    "Id: ${company.id}",
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
            Positioned(
              top: 0.13 * screenHeight,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.1,
                  child: Text(
                    company.name!,
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
            ),
            Positioned(
              top: 0.25 * screenHeight,
              left: 0.1 * screenWidth,

                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.1,
                  child: Text(
                    "About us:",
                    textAlign: TextAlign.left,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),

            Positioned(
              top: 0.30 * screenHeight,
              left: 0.1 * screenWidth,

              child: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.36,
                child: SingleChildScrollView(
                  child: Text(
                    company.description ?? "0",
                    textAlign: TextAlign.left,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.15 * screenHeight,
              left: 0.3 * screenWidth,

              child: SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.2,
                  child: Image.network(
                      company.logo!
                    ),
                ),
              ),

            Positioned(
              top: screenHeight * 0.67,
              left: 0,
              right: 0,
              child: const Divider(
                color: Colors.white, // Set the color of the line to white
                thickness: 2.0, // Set the thickness of the line
              ),
            ),

            Positioned(
              top: 0.70 * screenHeight,
              left: 0.06 * screenWidth,
              child:
                  Row(
                        children: [
                        Image.asset(
                        "assets/icons-img/twitter.png",
                        scale: 10,
                          ),
                        Text(
                              writeTwitter(),
                              style: SafeGoogleFont(
                              'Poppins',
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w400,

                              color: const Color(0xffffffff)
                              )
                        )
                      ]
                  ),
            ),
            Positioned(
              top: 0.76 * screenHeight,
              left: 0.06 * screenWidth,
              child:
              Row(
                  children: [
                    Image.asset(
                      "assets/icons-img/facebook.png",
                      scale: 40,
                    ),
                    Text(
                        writeFacebook(),
                        style: SafeGoogleFont(
                            'Poppins',
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w400,

                            color: const Color(0xffffffff)
                        )
                    )
                  ]
              ),
            ),
            Positioned(
              top: 0.76 * screenHeight,
              left: 0.55 * screenWidth,
              child:
              Row(
                  children: [
                    Image.asset(
                      "assets/icons-img/email.png",
                      scale: 33,
                    ),
                    Text(
                        writeTwitter(),
                        style: SafeGoogleFont(
                            'Poppins',
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w400,

                            color: const Color(0xffffffff)
                        )
                    )
                  ]
              ),
            ),
            Positioned(
              top: 0.70 * screenHeight,
              left: 0.55 * screenWidth,
              child:
              Row(
                  children: [
                    Image.asset(
                      "assets/icons-img/linkedin.png",
                      scale: 22,
                    ),
                    Text(
                        writeTwitter(),
                        style: SafeGoogleFont(
                            'Poppins',
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w400,

                            color: const Color(0xffffffff)
                        )
                    )

                  ]
              ),
            ),
            Positioned(
              top: 0.82 * screenHeight,
              left: 0.25 * screenWidth,
              child:
              Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: screenWidth * 0.08),
                    Text(
                        company.phone != null ? company.phone.toString() : "Not Available",
                        style: SafeGoogleFont(
                            'Poppins',
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w400,

                            color: const Color(0xffffffff)
                        )
                    )

                  ]
              ),
            ),
          ]
      ),
      backgroundColor: Colors.black,

    );
  }
}