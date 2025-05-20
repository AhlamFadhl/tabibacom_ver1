import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:tabibacom_ver1/widgets/my_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      // color: Colors.grey.shade100,
      child: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            title: Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.person_2_rounded),
                title: MyText('حسابي'),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
                //  value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.favorite),
                title: Text('المفضلة'),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SettingsSection(
            title: Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.support_agent_outlined),
                title: MyText('مساعدة'),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
                //  value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.logout),
                title: Text('تسجيل خروج'),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    /*
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: primaryColor,
                  ),
                  title: Text('حسابي'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.question_mark_outlined,
                    color: primaryColor,
                  ),
                  title: Text('أسئلتي'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: primaryColor,
                  ),
                  title: Text('المفضلة'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.support_agent_outlined,
                    color: primaryColor,
                  ),
                  title: Text('مساعدة'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: primaryColor,
                  ),
                  title: Text('إعدادات'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
    /*   InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red.shade300,
                  ),
                  title: Text('تسجيل خروج'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),*/
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
 
 */
  }
}
