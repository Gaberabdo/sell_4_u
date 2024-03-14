import 'package:flutter/material.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Details',style: TextStyle(
          color: Colors.blue
        ),
        ),
        actions:
        [
          IconButton(onPressed: (){}, icon: const Icon(Icons.power_settings_new_sharp,color: Colors.blue,size: 28,))
        ],
      ),
      body: Column(
        children:
        [
          Stack(
            children:[
              Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: Align(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children:
                  [
                    Stack(
                      children:[
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                            ),
                            IconButton(onPressed: (){}, icon:const Icon(Icons.mode_edit_outline_sharp))

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
            padding: EdgeInsets.symmetric(horizontal: 70,vertical: 10),
            child: Row(
              children:
              [
                Column(
                  children:
                  [
                    Text('1'),
                    Text('Followers'),
                  ],
                ),
               Spacer(),
                Column(
                  children:
                  [
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
              children:
              [
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
                    children:
                    [
                      Icon(Icons.phone_android_rounded,size: 28,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Text('Mobile',),
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
                    children:
                    [
                      Icon(Icons.wallet,size: 28,),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Text('My wallet',),
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
                    children:
                    [
                      Icon(Icons.verified_user_sharp,size: 28,),
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
        ],
      ),
    );
  }
}
