import 'package:flutter/cupertino.dart';
import 'package:myapp/models/salary_model.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/models/technology_model.dart';

class Filter extends ChangeNotifier {
  late List<Salary> salaryFilters;
  late bool remote;
  late List<Technology> technologyFilters;

  Filter({List<Salary>? salaryFilters, bool? remote, List<Technology>? technologyFilters}) {
    this.salaryFilters = salaryFilters ?? Salary.noFilterSalary;
    this.remote = remote ?? false;
    this.technologyFilters = technologyFilters ?? [const Technology(id: 0, string: ' ')];
  }

  Filter copyWith({
    List<Salary>? salaryFilters,
    bool? remote,
    List<Technology>? technologyFilters,
    List<Technology>? userTechnologyFilters,
  }) {
    return Filter(
      salaryFilters: salaryFilters ?? this.salaryFilters,
      remote: remote ?? this.remote,
      technologyFilters: technologyFilters ?? this.technologyFilters,
    );
  }

  void updateFilterSalary(int index, bool checked) {

    if (checked) {
      // Checkbox is checked, add the selected salary to the filters
      salaryFilters.add(Salary.salaries[index]);
    } else {
      // Checkbox is unchecked, remove the selected salary from the filters
      salaryFilters.remove(Salary.salaries[index]);
    }

    // Notify the listeners of the change
    notifyListeners();
  }

  void updateFilterRemote(bool checked) {
    // Update the remote filter parameter
    remote = checked;

    print(remote);

    notifyListeners();
  }

  void updateFilterTechnology(int index, bool checked) {

    if (checked) {
      // Checkbox is checked, add the selected technology to the filters
      technologyFilters.add(Technology.technologies[index]);
    } else {
      // Checkbox is unchecked, remove the selected technology from the filters
      technologyFilters.remove(Technology.technologies[index]);
    }

    if (technologyFilters.isEmpty) {
      technologyFilters.add(const Technology(id: 0, string: ' '));
    }
    else {
      technologyFilters.remove(const Technology(id: 0, string: ' '));
    }

    print(technologyFilters);

    // Notify the listeners of the change
    notifyListeners();
  }

  // Applies the filters in a list of jobs
  List<Job> applyFilter(List<Job> jobs) {

    // salary filter
    List<Job> newJobsSalaryFilter = [];

    for (var salary in salaryFilters) {
      if (salary.id != 0) {
        for (var job in jobs) {
          if (job.wage == null) continue;
          if (job.wage! >= salary.salaryRange[0] &&
              job.wage! < salary.salaryRange[1]) {
            newJobsSalaryFilter.add(job);
          }
        }
      }
    }

    // If salary id 0 is applied, it returns all jobs. This is because there are a lot of jobs without salary
    if (salaryFilters.length == 1) newJobsSalaryFilter = jobs;

    // remote filter
    List<Job> newJobsRemoteFilter = [];
    if (remote == true) {
      for (var job in newJobsSalaryFilter) {
        if (job.allowRemote == true) {
          newJobsRemoteFilter.add(job);
        }
      }
    }
    else {
      newJobsRemoteFilter = newJobsSalaryFilter;
    }
    
    // technologies filter
    List<Job> newJobsTechnologyFilter = [];
    for (var job in newJobsRemoteFilter) {
      for (var technology in technologyFilters) {
        if (job.body != null &&
            job.body!.toLowerCase().contains(technology.string.toLowerCase())) {
            newJobsTechnologyFilter.add(job);
        }
      }
    }

    // If no filter is applied
    if (technologyFilters == []) {
      newJobsTechnologyFilter = newJobsRemoteFilter;
    }

    return newJobsTechnologyFilter;
  }
}
