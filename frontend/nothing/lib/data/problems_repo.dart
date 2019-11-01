import 'dart:convert';

import 'package:http/http.dart';
import 'package:nothing/data/model/problem.dart';
import 'package:nothing/error/cloud_error.dart';

abstract class ProblemsRepo {
  Future<List<Problem>> fetchProblems(int count);
  Future<void> sendSummary(Map<int, bool> summary);
}

class CloudProblemsRepo extends ProblemsRepo {
  var fetchProblemsUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/GiveProblems';

  Future<List<Problem>> fetchProblems(int count) async {
    try {
      var resp = await post(
        fetchProblemsUrl,
        body: '{"count": $count, "group": "logic"}',
      );
      print(resp.body);
      if (resp.statusCode == 200) {
        List<dynamic> decoded = json.decode(resp.body);
        return decoded.map((f) => Problem.fromJson(f)).toList();
      } else {
        throw null;
      }
    } catch (_) {
      throw CloudError(error: "Coud not fetch problems");
    }
  }

  var sendSummaryUrl =
      'https://us-central1-crystal-factory.cloudfunctions.net/ProcessAnswers';

  Future<void> sendSummary(Map<int, bool> summary) async {
    var summaryStr = summary.map((k, v) => MapEntry(k.toString(), v));
    var summaryJson = json.encode(summaryStr);
    var body =
        '{"id": "FhF0RoQfOZNqOO4PWSD3M1d0HDB2", "group": "logic", "summary":$summaryJson';
    var resp = await post(
      sendSummaryUrl,
      body: body,
    );
    print(resp.statusCode);
  }
}

class LocalProblemsRepo extends ProblemsRepo {
  @override
  Future<List<Problem>> fetchProblems(int count) {
    return Future.delayed(
      Duration(seconds: 4),
      () => List<Problem>.generate(count, (i) {
        return Problem(
          id: i,
          question: "Simulation $i",
          explanation: "It's just a simulation",
          answers: ["Oh, I knew that", "Know", "I know"],
        );
      }),
    );
  }

  Future<void> sendSummary(Map<int, bool> summary) async {}
}
