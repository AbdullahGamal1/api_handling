import 'package:apis/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'web_serveses.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUser();

  @GET('users/{id}')
  Future<User> getUserById(@Path('id') int id);

  @POST("users")
  Future<User> creatNewUser(
      @Body() User newUser, @Header('Authorization') String token);

  @DELETE('users/{id}')
  Future<dynamic> deleteUser(
      @Path() String id, @Header('Authorization') String token);
}
