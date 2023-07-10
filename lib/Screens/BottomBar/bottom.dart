
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/Screens/Home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../mainscreen.dart';

class ContainerStrokeAnimation extends StatefulWidget {
  @override
  _ContainerStrokeAnimationState createState() =>
      _ContainerStrokeAnimationState();
}

class _ContainerStrokeAnimationState extends State<ContainerStrokeAnimation> {
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentscreen=HomePage();
  List<Widget> screens=[
    HomePage(),
    MainScreen()
  ];
     int _currentIndex = 0;
  int currenttab=0;
  Widget? _child;
  @override
  void initState() {
    _child = HomePage();
    super.initState();
  }
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body:  PageStorage(bucket: bucket,
           child: currentscreen,

         ),







         bottomNavigationBar: BottomAppBar(

           color: Colors.transparent,elevation: 0,
           height: 80,

           shape: CircularNotchedRectangle(),
           notchMargin: 0,
           clipBehavior: Clip.antiAliasWithSaveLayer,
           child: Container(
             height: 56,
             decoration: BoxDecoration(

               borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
               gradient: const LinearGradient(
                 colors: [
                   Color(0xFF6633FF),
                   Color(0xFF20BD52),
                 ],
                 begin: Alignment.centerLeft,
                 end: Alignment.centerRight,
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.1),
                   blurRadius: 4,
                   offset: Offset(0, -2),
                 ),
               ],
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buildBottomNavItem('assets/home-Regular.png', 'assets/home-Filled.png', AppLocalizations.of(context)!.home, 0),
                 buildBottomNavItem('assets/order_regular.png', 'assets/order-Filled.png', AppLocalizations.of(context)!.order, 1),
                 buildBottomNavItem('assets/chat.png', 'assets/chat-filled.png', AppLocalizations.of(context)!.chat, 2),
                 buildBottomNavItem('assets/user-Regular.png', 'assets/user-Filled.png', AppLocalizations.of(context)!.profile, 3),
               ],
             ),
           ),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton: FloatingActionButton(
           hoverElevation: 0,
           splashColor: Colors.transparent,
           backgroundColor: Colors.transparent,


           // elevation: 4,
           child: Image.asset("assets/mainbtn.png",width: 100,),
           onPressed: () => setState(() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
           //  _selectedPageIndex = 2;
           }),
         ),

       );
     }

     Widget buildBottomNavItem(String unselectedImage, String selectedImage, String label, int index) {
       final isSelected = _currentIndex == index;

       return GestureDetector(
         onTap: () {
           setState(() {
             _currentIndex = index;
           });
         },
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset(
               isSelected ? selectedImage : unselectedImage,
               color: isSelected ? Colors.white : Colors.grey,
             ),
             SizedBox(height: 4),
             Text(
               label,
               style: TextStyle(
                 color: isSelected ? Colors.white : Colors.grey,
                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
               ),
             ),
           ],
         ),
       );
     }
   }

