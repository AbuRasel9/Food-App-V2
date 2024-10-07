
import 'dart:convert';

import 'package:food_app/dataModel/auth/login_request.dart';
import 'package:food_app/dataModel/auth/login_response.dart';
import 'package:food_app/utils/constant_value.dart';

import '../../utils/service/di_service.dart';
import '../api.dart';

part"auth_repo_impl.dart";
abstract class AuthRepo{
  final diApiCall=di.get<Api>();

  Future login({required LoginRequest body});



}