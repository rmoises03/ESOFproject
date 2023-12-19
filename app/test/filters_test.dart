import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/models/technology_model.dart';
import 'package:myapp/remoteService.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/salary_model.dart';
import 'package:myapp/models/technology_model.dart';

void main() {
  List<Job>? jobs;

  setUp(() {
    // Mock some jobs
    jobs = [
    Job(id: 0, wage: 30000, body: 'We want python experts', allowRemote: true),
    Job(id: 1, body: 'We want java experts', allowRemote: false),
    Job(id: 2, wage: 8500, body: 'We rob you!', allowRemote: false),
    Job(id: 3, wage: 50000, body: 'We want SQL experts', allowRemote: true),
    Job(id: 4, wage: 25000, body: 'We want JavaScript experts', allowRemote: false),
    Job(id: 5, body: 'Come work with US!', allowRemote: true),
    Job(id: 6, wage: 85500, body: 'Senior python developers wanted!', allowRemote: true),
    Job(id: 7, wage: 65000, body: 'We want java experts', allowRemote: false),
    Job(id: 8, wage: 24000, body: 'We want python experts', allowRemote: true),
    Job(id: 9, wage: 55000, body: 'We want javascript experts', allowRemote: true),
    ];
});

  test("Test salaries filters", () async {
    List<Job>? jobsList = jobs;

    List<Salary> salaries = [];

    // Mock some filters
    salaries.add(Salary.salaries[0]); // 5k - 10k
    salaries.add(Salary.salaries[4]); // 60k - 80k

    Filter filters = Filter(salaryFilters: salaries);

    List<Job> filteredJobs = filters.applyFilter(jobs!);

    int? jobsLength = jobsList?.length;
    int filteredJobsLength = filteredJobs.length;

    print("Jobs: $jobsLength");
    print("Filtered jobs: $filteredJobsLength");

    expect(jobsLength! >= filteredJobsLength, isTrue);
    expect(filteredJobsLength == 2, isTrue);

    for (Job job in filteredJobs) {
      expect((job.wage! >= 5000 && job.wage! < 10000) || (job.wage! >= 60000 && job.wage! < 80000), isTrue);
    }
  });

  test("Test technology filters", () async {
    List<Job>? jobsList = jobs;

    List<Technology> technologies = [];

    // Mock some filters
    technologies.add(Technology.technologies[0]); // python
    technologies.add(Technology.technologies[2]); // javascript

    Filter filters = Filter(technologyFilters: technologies);

    List<Job> filteredJobs = filters.applyFilter(jobs!);

    int? jobsLength = jobsList?.length;
    int filteredJobsLength = filteredJobs.length;

    print("Jobs: $jobsLength");
    print("Filtered jobs: $filteredJobsLength");

    expect(jobsLength! >= filteredJobsLength, isTrue);
    expect(filteredJobsLength! == 5, isTrue);
  });

  test("Test remote filter", () async {
    List<Job>? jobsList = jobs;

    Filter filters = Filter(remote: true);

    List<Job> filteredJobs = filters.applyFilter(jobs!);

    int? jobsLength = jobsList?.length;
    int filteredJobsLength = filteredJobs.length;

    print("Jobs: $jobsLength");
    print("Filtered jobs: $filteredJobsLength");

    expect(jobsLength! >= filteredJobsLength, isTrue);
    expect(filteredJobsLength! == 6, isTrue);
  });

  test("Test filters combined", () async {
    List<Job>? jobsList = jobs;

    List<Salary> salaries = [];
    List<Technology> technologies = [];

    // Mock some filters
    salaries.add(Salary.salaries[2]); // 20k - 40k
    salaries.add(Salary.salaries[3]); // 40k - 60k
    technologies.add(Technology.technologies[0]); // python
    technologies.add(Technology.technologies[2]); // javascript

    Filter filters = Filter(salaryFilters: salaries, technologyFilters: technologies, remote: true);

    List<Job> filteredJobs = filters.applyFilter(jobs!);

    int? jobsLength = jobsList?.length;
    int filteredJobsLength = filteredJobs.length;

    print("Jobs: $jobsLength");
    print("Filtered jobs: $filteredJobsLength");

    expect(jobsLength! >= filteredJobsLength, isTrue);
    expect(filteredJobsLength! == 3, isTrue);
  });
}
