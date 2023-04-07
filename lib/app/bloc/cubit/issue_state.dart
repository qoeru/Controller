part of 'issue_cubit.dart';

@immutable
abstract class IssueState {}

class IssueNew extends IssueState {}

class IssueAllowed extends IssueState {}

class IssueNotAllowed extends IssueState {}

class IssueStatusIsRequested extends IssueState {}
