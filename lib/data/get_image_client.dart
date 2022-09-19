
import 'dart:async';
import 'dart:convert' show json;
import 'get_image_client.dart';
import 'package:http/http.dart' as http;

import 'image_url_model.dart';

class UnSplashClient {
  final _host = 'api.unsplash.com';


  Future getImages() async {
    final results = await request(path: 'photos/random', parameters: {'query':'dolphin','client_id':'AA2izfJUMLsyej4qkvnHVizd1lg40C-Iv0-Kx-LxYOo'});
    if(results==403){
      return '403';
    }
    return AutoGenerate.fromJson(results).urls?.thumb;
    // return Article.fromJson(data);
  }

   request({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    final uri = Uri.https(_host, '/$path', parameters);
    // print(uri);
    // final res = Uri.parse('https://api.unsplash.com/photos/random?query=dolphin&client_id=AA2izfJUMLsyej4qkvnHVizd1lg40C-Iv0-Kx-LxYOo');
    final results = await http.get(uri);
    if(results.statusCode==403){
      return 403;
    }
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }
}
