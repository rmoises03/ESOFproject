import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/remoteService.dart';

void main() {
  RemoteService remoteService = RemoteService();

  // Test the call to the API
  test("API Call is Working", () async {
    final jobs = await remoteService.getJobs();
    expect(jobs, isNotNull);
    expect(jobs, isInstanceOf<List<dynamic>>());
  });

  // Tests if by giving a query (q parameter) to the API, it returns all jobs from that the location is that district
  // This test fails in some cases which is expected as the name of the district could be in the job body
  // This test was important for us because it made us change the logic of getting jobs from a district
  test("District Search is working", () async {
    List<Job>? aveiroList = await remoteService.getJobs(q: "Aveiro");

    aveiroList?.forEach((obj) {
      print(obj.locationId?.any((loc) => loc['id'] == "1"));
      print('Job Title: ${obj.title}');
      print('Location ID:');
      obj.locationId?.forEach((loc) => print('  id: ${loc['id']}'));
      print('Job Description: ${obj.id}');
      print('-------------------------------------');
    });

    expect(
        aveiroList?.every((obj) =>
            obj.locationId != null &&
            obj.locationId!.any((loc) => loc['id'] == "1")),
        isTrue);
  });
}
