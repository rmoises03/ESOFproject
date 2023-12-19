import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/remoteService.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/widgets/gradientBackground.dart';
import 'package:myapp/views/widgets/navBar.dart';
import 'package:myapp/views/widgets/scrollJobs.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/salary_model.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Job>? jobs;

  @override
  Widget build(BuildContext context) {

    // Get job list
    final jobsProvider = Provider.of<JobsProvider>(context);
    jobs = jobsProvider.jobs;

    // Get filters
    final filter = Provider.of<Filter>(context, listen: false);

    jobs = filter.applyFilter(jobs!);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: const Key("offersScreen"),
      bottomNavigationBar: const NavBar(
        pageNumber: 0,
      ),
      body: Stack(
        children: [
          // Grading background
          GradientBackground(screenHeight: screenHeight),
          // Number of results
          Positioned(
            top: screenHeight * 0.27,
            left: screenWidth * 0.1,
            child: Text(
              '${jobs?.length ?? '0'} resultados',
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          // scroll jobs
              ScrollJobs(jobs: jobs!),
          // Text
          Positioned(
            top: screenHeight * 0.12,
            left: 0,
            right: 0,
            child: Text(
              'Aqui podes encontrar todas as\npropostas de emprego!\nClica em qualquer uma para\nsaber mais.',
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
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
