import 'package:get_it/get_it.dart';
import 'package:quiz_app/data/data_source/remote_data_source/quiz_remote_data_source.dart';
import 'package:quiz_app/domain/repository/base_quiz_repo.dart';
import 'package:quiz_app/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app/presentation/controller/question_bloc.dart';

import '../data/repository/quiz_repo.dart';

final sl = GetIt.instance;
class ServiceLocator{
  void init(){
    sl.registerFactory(() => QuestionBloc(sl()));
    sl.registerLazySingleton<BaseQuizRemoteDataSource>(() => QuizRemoteDataSource());
    sl.registerLazySingleton<BaseQuizRepo>(() => QuizRepo(sl()));
    sl.registerLazySingleton(() => GetQuizUseCase(sl()));
    
  }
}