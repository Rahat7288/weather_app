import 'package:http/http.dart' as http;

String HttpEerrorHandler(http.Response response) {
  final statusCode = response.statusCode;
  final reasonPhrase = response.reasonPhrase;

  final String erroMessage =
      'request faild\nStatus Code: $statusCode\n Reason: $reasonPhrase';
  return erroMessage;
}
