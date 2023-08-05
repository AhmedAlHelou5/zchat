import '../network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    if (value) {
      // navigateAndFinish(context, LoginScreen());
    }
  });
}
//
// // method to print full text
void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
//
//
// String token = '';
 String? uId = '';



