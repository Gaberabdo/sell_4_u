import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_4_u/Features/setting/model/user_model.dart';
import 'package:sell_4_u/Features/setting/model/user_provider.dart';
import 'package:sell_4_u/core/constant.dart';
import 'package:sell_4_u/core/helper/component/component.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? file;

  @override
  Widget build(BuildContext context) {
    return Provider<UserProvider>(
      create: (context) => UserProvider()..getDetails(),
      builder: (context, child) {
        var emailController = TextEditingController();
        var nameController = TextEditingController();


        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Account Details',
              style: TextStyle(color: Colors.blue),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.power_settings_new_sharp,
                    color: Colors.blue,
                    size: 28,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.blue,
                      child: Align(
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Stack(
                              children: [
                                Stack(
                                  children: [
                                    file == null
                                        ? CircleAvatar(
                                            radius: 65,
                                            backgroundImage: NetworkImage(
                                                'https://www.freepik.com/free-vector/illustration-user-avatar-icon_2606572.htm#fromView=search&page=1&position=47&uuid=ea28f8ef-cff6-485a-8f1a-efde5332f9a1'),
                                            //backgroundImage: DecorationImage(image: MemoryImage(file)),
                                          )
                                        : CircleAvatar(
                                            radius: 65,
                                            backgroundImage: MemoryImage(file!),
                                          ),
                                    IconButton(
                                      onPressed: () async {
                                        Uint8List myFile = await pickImage();
                                        setState(() {
                                          file = myFile;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.mode_edit_outline_sharp,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('1'),
                          Text('Followers'),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('0'),
                          Text('Following'),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.phone_android_rounded,
                              size: 28,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile',
                                ),
                                Text('+54545152'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.wallet,
                              size: 28,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My wallet',
                                ),
                                Row(
                                  children: [
                                    Text('Free credit:'),
                                    Text(' 3.0'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Premium credit:'),
                                    Text(' 0.0'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.verified_user_sharp,
                              size: 28,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Text('Member since:'),
                                Text(' 04 Dec 2020'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'More information',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Buttonhelper(
                  title: 'Save',
                  onchange: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
