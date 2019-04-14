import 'package:flutter/foundation.dart';
import 'package:readhub/models/job.dart';

@immutable
class JobState {
  final List<Job> jobs;
  final bool fetching;

  JobState({this.jobs, this.fetching = true});

  JobState copyWith({List<Job> news, bool fetching}) {
    return JobState(
        jobs: jobs ?? this.jobs,
        fetching: fetching ?? this.fetching);
  }

  JobState.initialState()
      : jobs = [],
        fetching = true;
}
