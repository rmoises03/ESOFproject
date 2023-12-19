import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/remoteService.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Job>? jobs;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data from API
    getData();
  }

  getData() async {
    // getJobsList is not yet functional
    jobs = await RemoteService().getJobs();
    if (jobs != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: isLoaded
            ? ListView.builder(
            itemCount: jobs?.length,
            itemBuilder: (context, index) {
              return Text(jobs![index].title ?? '');
            })
            : const Center(child: CircularProgressIndicator()));
  }

}
