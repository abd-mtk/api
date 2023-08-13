import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/posts/data/datasources/local_data_source.dart';
import '../../features/posts/data/datasources/remot_data_source.dart';
import '../core/network/network_info.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;
  late NetworkInfoImplement networkInfo;
  late RemoteDataSource remoteDataSource;
  late LocalDataSource localDataSource;

  Future<Services> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    localDataSource =
        LocalDataSourceImplement(sharedPreferences: sharedPreferences);
    networkInfo = NetworkInfoImplement(InternetConnectionChecker());
    remoteDataSource = RemoteDataSourceImplement(client: Client());
    return this;
  }
}
