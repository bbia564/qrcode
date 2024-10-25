import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/pages/code_first/code_first_view.dart';
import 'package:qrcode/pages/code_second/code_second_view.dart';
import 'package:qrcode/pages/code_third/code_third_view.dart';

import 'code_tab_logic.dart';

class CodeTabPage extends GetView<CodeTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          CodeFirstPage(),
          const CodeSecondPage(),
          CodeThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navCodeBars()),
    );
  }

  Widget _navCodeBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Manufacture',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Scan code',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item2Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
