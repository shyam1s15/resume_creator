import 'package:get/get.dart';
import 'package:resume_creator/pages/ResumeListSectionsPage.dart';
import 'package:resume_creator/pages/home_page.dart';
import 'package:resume_creator/pages/splash_screen_page.dart';
 
class Routes {
  ///root page 
  static const String home = "/";

  static const String splash = "/splash";

  static const String resume_list_section = "/resume_list_sections";
 
  ///pages map 
  static final List<GetPage> getPages = [ 
    GetPage(name: home, page: () => ResumeListSectionsPage()),
    GetPage(name: splash, page: () => OnboardingPage2()),
    GetPage(name: resume_list_section, page: () => ResumeListSectionsPage())
  ]; 
}