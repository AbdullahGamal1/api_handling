import 'package:apis/api_result.dart';
import 'package:apis/network_exceptions.dart';
import 'package:apis/user.dart';
import 'package:apis/web_serveses.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUser();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
    //var response = await webServices.getAllUser();
    // return response
    //     .map((userDataFromJson) => User.fromJson(userDataFromJson.toJson()))
    //     .toList();
  }

  Future<User> getUsersById(int userId) async {
    return await webServices.getUserById(userId);
    //   var response = await webServices.getUserById(userId);
    //   return User.fromJson(response.toJson());
    //
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.creatNewUser(newUser,
          'Bearer 3b8a46a5e3acf6e645b0c53346589283b15a5f9584fc8ebec117d804a4e7a9c7');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<dynamic> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer 3b8a46a5e3acf6e645b0c53346589283b15a5f9584fc8ebec117d804a4e7a9c7');
  }
}
