import 'movie_details_model.dart';
import 'movie_model.dart';
import 'network.dart';

class Repository {
  Repository(this.network);
  final Network network;

  Future getData({String type}) async {
    return network.fetchData(type: type);
  }

  Future<MovieDetails> getDetailsData({String id}) async {
    return network.fetchDetailsData(id: id);
  }
}
