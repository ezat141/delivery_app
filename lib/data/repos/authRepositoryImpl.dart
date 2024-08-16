import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failures.dart';
import 'package:delivery_app/core/functions/authService.dart';
import 'package:delivery_app/data/repos/authRepository.dart';
import 'package:dio/dio.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
Future<Either<Failure, bool>> login({required String email, required String password}) async {
    try {
      var response = await authService.login(email: email, password: password);
      // Check the response for successful login
      if (response['status'] == 'success') {
        return Right(true);
      } else {
        return Left(ServerFailure('Invalid credentials'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}
