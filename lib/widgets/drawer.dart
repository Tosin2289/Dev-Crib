import 'package:flutter/material.dart';

import 'my_text_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? ProfileTap;
  final void Function()? OnSignout;
  const MyDrawer({Key? key, required this.ProfileTap, required this.OnSignout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    "assets/pro1.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                MyTextTile(
                  icon: Icons.home,
                  text: "H O M E",
                  onTap: () => Navigator.pop(context),
                ),
                MyTextTile(
                  icon: Icons.person,
                  text: "P R O F I L E",
                  onTap: ProfileTap,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyTextTile(
                icon: Icons.logout,
                text: "L O G O U T",
                onTap: OnSignout,
              ),
            ),
          ],
        ));
  }
}
