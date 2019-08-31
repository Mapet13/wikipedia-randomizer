import 'package:url_launcher/url_launcher.dart' as url_launcher;

void launchURL(String url) async {
  if (await url_launcher.canLaunch(url)) {
    await url_launcher.launch(url);
  } else {
    throw 'Could not launch $url';
  }
}