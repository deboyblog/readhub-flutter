import 'package:flutter/foundation.dart';
import 'package:readhub/redux/states/topic.dart';
import 'package:readhub/redux/states/news.dart';
import 'package:readhub/redux/states/tech.dart';
import 'package:readhub/redux/states/blockChain.dart';
import 'package:readhub/redux/states/job.dart';

@immutable
class ReduxState {
  final TopicState topics;
  final NewsState news;
  final TechState techNews;
  final BlockChainState blockChainNews;
  final JobState jobs;

  const ReduxState(
      {this.topics, this.news, this.techNews, this.blockChainNews, this.jobs, NewsState tech});
}
