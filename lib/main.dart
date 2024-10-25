import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/db_code/db_code.dart';
import 'package:qrcode/pages/code_first/code_first_binding.dart';
import 'package:qrcode/pages/code_first/code_first_view.dart';
import 'package:qrcode/pages/code_first/do_code_show/do_code_show_binding.dart';
import 'package:qrcode/pages/code_first/do_code_show/do_code_show_view.dart';
import 'package:qrcode/pages/code_first/do_input_content/do_input_code.dart';
import 'package:qrcode/pages/code_first/do_input_content/do_input_content_binding.dart';
import 'package:qrcode/pages/code_first/do_input_content/do_input_content_view.dart';
import 'package:qrcode/pages/code_first/do_out/do_out_binding.dart';
import 'package:qrcode/pages/code_first/do_out/do_out_view.dart';
import 'package:qrcode/pages/code_second/code_scan_result/code_scan_result_binding.dart';
import 'package:qrcode/pages/code_second/code_scan_result/code_scan_result_view.dart';
import 'package:qrcode/pages/code_second/code_second_binding.dart';
import 'package:qrcode/pages/code_second/code_second_view.dart';
import 'package:qrcode/pages/code_second/scan_records/scan_records_binding.dart';
import 'package:qrcode/pages/code_second/scan_records/scan_records_view.dart';
import 'package:qrcode/pages/code_tab/code_tab_binding.dart';
import 'package:qrcode/pages/code_tab/code_tab_view.dart';
import 'package:qrcode/pages/code_third/code_third_binding.dart';
import 'package:qrcode/pages/code_third/code_third_view.dart';

Color primaryColor = const Color(0xff00818f);
Color bgColor = const Color(0xffeff3f4);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBCode().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Resion,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Resion = [
  GetPage(name: '/', page: () => const DoOutView(), binding: DoOutBinding()),
  GetPage(name: '/code_tab', page: () => CodeTabPage(), binding: CodeTabBinding()),
  GetPage(name: '/code_out', page: () => const DoInputCode()),
  GetPage(name: '/code_first', page: () => CodeFirstPage(),binding: CodeFirstBinding()),
  GetPage(name: '/code_second', page: () => const CodeSecondPage(),binding: CodeSecondBinding()),
  GetPage(name: '/code_third', page: () => CodeThirdPage(),binding: CodeThirdBinding()),
  GetPage(name: '/code_scan_result', page: () => CodeScanResultPage(),binding: CodeScanResultBinding()),
  GetPage(name: '/scan_records', page: () => ScanRecordsPage(), binding: ScanRecordsBinding()),
  GetPage(name: '/do_input_content', page: () => DoInputContentPage(), binding: DoInputContentBinding()),
  GetPage(name: '/do_code_show', page: () => DoCodeShowPage(), binding: DoCodeShowBinding()),
];

