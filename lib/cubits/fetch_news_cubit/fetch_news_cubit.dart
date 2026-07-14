import 'package:bloc/bloc.dart';
import 'package:iti_flutter_newsapp/cubits/fetch_news_cubit/fetch_news_state.dart';
import 'package:iti_flutter_newsapp/services/fetch_news_services.dart';

class FetchNewsCubit extends Cubit<FetchNewsState> {
  FetchNewsCubit() : super(InitialState());

  FetchNewsServices fetchNewsServices = FetchNewsServices();

  var newsList = [];
  void fetchNews({required String category}) async {
    emit(FetchNewsLoading());
    try {
      newsList = await fetchNewsServices.newsList(category: category);
      emit(FetchNewsSuccess());
    } catch (e) {
      print(e.toString());
      emit(FetchNewsFailed());
    }
  }
}
