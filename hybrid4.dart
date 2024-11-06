import "dart:ffi";

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import "dart:async";

void main() async {
  var url = Uri.parse("https://random-data-api.com/api/v2/users?size=12");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonRes = convert.jsonDecode(response.body) as List<dynamic>;

    jsonRes.forEach((item) {
      var uid = item['uid'];
      var fname = item['first_name'];
      var lname = item['last_name'];

      print('$uid,$fname,$lname');
    });
  } else {
    print("Sorry Error");
  }
}
