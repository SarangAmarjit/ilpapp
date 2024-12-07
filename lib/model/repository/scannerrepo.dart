import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../config/apis.dart';
import '../ilpuser.dart';


class IlpRepoImpl{


Future<InnerLinePermitUser?> fetchpermitGet(String permit) async {
  final url = Uri.parse('$api$permit'); // Example API
  print(permit);
  final response = await http.get(url);

  if (response.statusCode >= 200 && response.statusCode<300) {
    // Decode the JSON response
      print("Get");
    return InnerLinePermitUser.fromJson( json.decode(response.body));
  } else {
     print("error");
    // throw Exception('Failed to load data');
    return null;
  }
}
}