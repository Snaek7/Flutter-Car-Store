import 'package:http/http.dart' as http;

class LoremIpsumApi {
  static Future<String> getLorem() async {
    var url = 'https://loripsum.net/api';

    try {
      var response = await http.get(url);

      String text = response.body;

      text = text.replaceAll("<p>", "");
      text = text.replaceAll("</p>", "");

      return text;
    } catch (e) {
      print(e);
      return 'Erro ao carregar descrição';
    }
  }
}
