import 'dart:convert';

import 'package:food_app/data/sharePrefs/share_prefs.dart';
import 'package:food_app/dataModel/auth/login_request.dart';
import 'package:food_app/dataModel/auth/login_response.dart';
import 'package:http/http.dart';

import '../utils/service/di_service.dart';


class Api {
  final diSharePrefs=di.get<SharePrefs>();

  //post method

  Future<LoginResponse> loginRequest( {required LoginRequest  body,required String baseUrl, required endPoint}) async {
    print(baseUrl+endPoint);

    try{

      Response response = await post(Uri.parse(baseUrl+endPoint),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          // "token":diSharePrefs.token ?? ""
        },

        body: jsonEncode(body,),

      );
      if(response.statusCode==200){
        return LoginResponse.fromJson(jsonDecode(response.body));
      }else{
        throw Exception("api call failed");
      }
    }catch(e){

      throw Exception("Api Call Error ${e}");


    }


  }


  //post method

  Future postRequest( {required  body,required String baseUrl, required endPoint}) async {

    try{

      Response response = await post(Uri.parse(baseUrl+endPoint),
        headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "token":diSharePrefs.token ?? ""
      },

        body: jsonEncode(body,),

      );
      if(response.statusCode==200){
        return response.body;
      }else{
        throw Exception("api call failed");
      }

    }catch(e){

      throw Exception("Api Call Error ${e}");


    }


  }
  //get method

  Future<dynamic> getRequest( {required String baseUrl, required endPoint}) async {
    try{
      Response response = await get(Uri.parse(baseUrl+endPoint),
        headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "token":diSharePrefs.token ?? ""
      },
      );
      return dataStatusCheck(response);
    }catch(e){
      throw Exception("Api Call Error $e");


    }


  }


  //get method

   dataStatusCheck(Response response){


    if(response.statusCode==200){
      print("---------response \n ${response.body}");
      return response.body;
    }else{
      throw Exception("Api Call Error status code ${response.statusCode}");
    }
  }

}