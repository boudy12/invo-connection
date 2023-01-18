
import 'package:invoconnection/shared/network/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
    //  navigateAndFinishSS(context, ShopAppLoginScreen());
    }
  });

}
void signOutECommerce(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
   //   navigateAndFinishSS(context, ECommerceAppLoginScreen());
    }
  });

}

String? token = '';
bool isArabic1 = CacheHelper.getData(key: 'isArabic') ?? false ;
bool isDark1 = CacheHelper.getData(key: 'isDark') ?? false;
 int? userId  ;

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');  // 800 is size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
