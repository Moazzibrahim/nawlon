import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/login_screen.dart';
import 'package:flutter_dashboard/model/menu_modal.dart';
import 'package:flutter_dashboard/widgets/profile/profile.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  // ignore: library_private_types_in_public_api
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/profile.svg', title: "ملف شخصي"),
    MenuModel(icon: 'assets/svg/exercise.svg', title: " تقارير"),
    MenuModel(icon: 'assets/svg/setting.svg', title: " اعدادات"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "تسجيل الخروج"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 40 : 80,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  //Image.asset("assets/images/top1.png"),
                ),
              ),
              const SizedBox(
                  height:
                      20), // Adding some space between avatar and menu items
              for (var i = 0; i < menu.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: selected == i
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = i;
                      });
                      widget.scaffoldKey.currentState!.closeDrawer();
                      if (i == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      } else if (i == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      } else if (i == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      } else if (i == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          child: SvgPicture.asset(
                            menu[i].icon,
                            // ignore: deprecated_member_use
                            color: selected == i ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          menu[i].title,
                          style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.black : Colors.grey,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
