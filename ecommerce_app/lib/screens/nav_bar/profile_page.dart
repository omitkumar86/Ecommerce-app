import 'package:ecommerce_app/const/api_link.dart';
import 'package:ecommerce_app/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProfileProvider>(context, listen: false).getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileList = Provider.of<ProfileProvider>(context).profileList;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5).withOpacity(0.6),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   backgroundImage: NetworkImage(
          //     "${imageUrl}${profileList[0].image}",
          //   ),
          // ),
          Text("${profileList[0].name}"),
        ],
      ),
    );
  }
}
