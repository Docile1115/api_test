import 'dart:async';
import 'dart:convert' show JSON, LineSplitter, UTF8;
import 'dart:io';

import 'package:flutter_app/model/github_repo.dart';


class GithubClient {

  Future<List<GithubRepo>> get(String query) async {
    var url = 'http://153.126.145.215/loglog/MlWebApi/Mst0010?user_cd=00000070';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url + query));
      var response = await request.close();

      if (response.statusCode != HttpStatus.OK) {
        return null;
      }

      var json = await response.transform(UTF8.decoder).join();
      return GithubRepo.fromJson(json);

    } catch (exception) {
      return null;
    }
  }
}
