import 'package:flutter/foundation.dart';
import 'package:readhub/models/job.dart';

@immutable
class JobState {
  final List<Job> jobs;
  final bool isLoading;

  JobState({this.jobs, this.isLoading = true});

  JobState copyWith({List<Job> news, bool isLoading}) {
    return JobState(
        jobs: jobs ?? this.jobs,
        isLoading: isLoading ?? this.isLoading);
  }

  JobState.initialState()
      : jobs = [],
        isLoading = true;
}
