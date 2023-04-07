import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:controler_app/data/auth_provider.dart';
part 'issue_state.dart';

class IssueCubit extends Cubit<IssueState> {
  IssueCubit() : super(IssueNew());

  AuthProvider authProvider = AuthProvider();

  void getState() async {
    // String issueStatus = await authProvider.getIssueStatus();
    // return issueStatus;
  }
}
