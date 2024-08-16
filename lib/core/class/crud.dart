import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failures.dart';
import 'package:delivery_app/core/functions/checkinternet.dart';
import 'package:dio/dio.dart';



class Crud {
  // Future<Either<StatusRequest, Map<String, dynamic>>> postData(
  //     String linkurl, Map<String, dynamic> data) async {
  //   if (await checkInternet()) {
  //     var response = await http.post(Uri.parse(linkurl), body: data);
  //     print(response.statusCode);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map<String, dynamic> responsebody = jsonDecode(response.body);
  //       print(responsebody);
  //       return Right(responsebody);
  //     } else {
  //       return const Left(StatusRequest.serverfailure);
  //     }
  //   } else {
  //     return const Left(StatusRequest.offlinefailure);
  //   }
  // }

//   Future<Either<StatusRequest, Map<String, dynamic>>> postData(String linkurl, Map<String, dynamic> data) async {
//   try {
//     if (await checkInternet()) {
//       var response = await http.post(Uri.parse(linkurl), body: data);
//       print(response.statusCode);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> responseBody = jsonDecode(response.body);
//         print(responseBody);
//         return Right(responseBody);
//       } else {
//         // Handle server errors
//         return Left(StatusRequest.serverfailure);
//       }
//     } else {
//       // Handle network connectivity issues
//       return Left(StatusRequest.offlinefailure);
//     }
//   } catch (e) {
//     // Handle unexpected errors
//     print("Error occurred during HTTP request: $e");
//     return Left(StatusRequest.serverfailure);
//   }
// }
  Future<Either<Failure, Map<String, dynamic>>> postData(
      String linkurl, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final response = await dio.post(linkurl, data: data);

        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseBody = response.data as Map<String, dynamic>;
          print(responseBody);
          return Right(responseBody);
        } else {
          // Handle server errors
          return Left(
              ServerFailure.fromResponse(response.statusCode, response.data));
        }
      } else {
        // Handle network connectivity issues
        return Left(ServerFailure('No Internet Connection'));
      }
    } on DioException catch (e) {
      // Handle Dio errors
      print("Error occurred during HTTP request: $e");
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      // Handle unexpected errors
      print("Unexpected error occurred during HTTP request: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final response = await dio.get(linkurl);

        print(response.statusCode);

        if (response.statusCode == 200) {
          final responseBody = response.data as Map<String, dynamic>;
          print(responseBody);
          return Right(responseBody);
        } else {
          // Handle server errors
          return Left(
              ServerFailure.fromResponse(response.statusCode, response.data));
        }
      } else {
        // Handle network connectivity issues
        return Left(ServerFailure('No Internet Connection'));
      }
    } on DioException catch (e) {
      // Handle Dio errors
      print("Error occurred during HTTP request: $e");
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      // Handle unexpected errors
      print("Unexpected error occurred during HTTP request: $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
