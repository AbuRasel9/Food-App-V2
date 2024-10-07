part of 'auth_repo.dart';
class AuthRepoImpl extends AuthRepo{

  @override
  Future<LoginResponse> login({required LoginRequest body}) async {
    print("------decode  =======");

   try{

     final result=await diApiCall.loginRequest(body: body, baseUrl: ConstantValue.baseUrl, endPoint: ConstantValue.login);
     print("------decode  ${jsonEncode(result)}");
     return result;


   }catch(e){
     print("------ffff  =======");

     throw Exception ("ddd ${e.toString()}");

   }

  }

}