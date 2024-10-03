import 'package:http/http.dart';
import 'package:school_route/utilities/consts.dart';



Future<Response> getResponse(String endPoint,Map<String,dynamic> body) async{

  Response response;
  response = await post(
    Uri.parse('https://reqres.in$endPoint'),
    body: {
      'email' : body[Consts.EMAIL],
      'password' : body[Consts.PASSWORD],
    }
  );

  return response;
}