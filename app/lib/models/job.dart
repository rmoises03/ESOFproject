import 'package:flutter/cupertino.dart';
import 'company.dart';
import 'package:myapp/remoteService.dart';

class Job {
  // ? -> optional / nullable
  int id;
  String? title;
  String? body;
  var ref;
  int? wage;
  List<dynamic>? typeId;
  List<dynamic>? locationId;
  bool? allowRemote;
  String? publishedAt;
  String? updatedAt;
  String? slug;
  Company? company;

  Job({
    required this.id,
    this.title,
    this.body,
    this.ref,
    this.wage,
    this.typeId,
    this.locationId,
    this.allowRemote,
    this.publishedAt,
    this.updatedAt,
    this.slug,
    this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'] ,
      body: json['body'],
      ref: json['ref'], // for some reason ref sometimes is int :/
      wage: json['wage'],
      typeId: json['types'],
      locationId: json['locations'],
      allowRemote: json['allowRemote'],
      publishedAt: json['publishedAt'],
      updatedAt: json['updatedAt'],
      slug: json['slug'],
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );
  }
}


class Company {
  int? id;
  String? name;
  String? logo;
  String? description;
  String? address;
  var phone;
  int? fax;
  String? email;
  String? url;
  String? urlTwitter;
  String? urlFacebook;
  String? urlLinkedin;
  String? slug;

  Company({
    this.id,
    this.name,
    this.logo,
    this.description,
    this.address,
    this.phone,
    this.fax,
    this.email,
    this.url,
    this.urlTwitter,
    this.urlFacebook,
    this.urlLinkedin,
    this.slug,
  });


  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      url: json['url'],
      urlTwitter: json['url_twitter'],
      urlFacebook: json['url_facebook'],
      urlLinkedin: json['url_linkedin'],
      slug: json['slug']
    );
  }
}


class JobsProvider with ChangeNotifier {
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  set jobs(List<Job> value) {
    _jobs = value;
    notifyListeners();
  }

  RemoteService remoteService = RemoteService();

  Future<void> fetchJobs() async {
    List<Job>? fetchedJobs = await remoteService.getJobs();
    _jobs = fetchedJobs!;

    print('jobs loaded');
  }
}
