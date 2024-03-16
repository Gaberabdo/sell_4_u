import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_4_u/Features/setting/model/user_model.dart';
import 'package:sell_4_u/Features/setting/model/user_provider.dart';
import 'package:sell_4_u/Features/setting/view/screens/edit_profile.dart';
import 'package:sell_4_u/Features/setting/view/screens/notifications.dart';
import 'package:sell_4_u/Features/setting/view/screens/recently_viewed.dart';
import 'package:sell_4_u/Features/setting/view/screens/saved_searched.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
void initState()
{
  Provider.of<UserProvider>(context,listen: false).getDetails();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
  UserModel userModel=Provider.of<UserProvider>(context).userModel!;
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const Notifications()));
            }, icon: const Icon(Icons.notification_add_outlined)),
          ),
        ],
      ),
      body:
       SingleChildScrollView(
         child: Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 8.0),
           child: Column(
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 28,
                    child:  const Text(
                      ' ',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(userModel.name,style: TextStyle(
                        fontWeight:FontWeight.bold
                      ),),
                      Text('login to buy and sell anything'),
                    ],
                  ),
                ],
                     ),
               const SizedBox(
                 height: 15,
               ),
               Container(
                 height: 90,
                 width: 400,
                 decoration: BoxDecoration(
                   border: Border.all(
                       color: Colors.grey,
                       width: 1.0,
                       style: BorderStyle.solid),
                 ),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     const Text('My Account',style: TextStyle(
                         color: Colors.blue,
                         fontSize: 14
                     ),),
                     Row(
                       children:
                       [
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const EditProfile()));
                           },
                           child: Container(
                             height: 65,
                             width: 390,
                             child: const Row(
                               children:
                               [
                                 Icon(Icons.edit,size: 28,),
                                 SizedBox(
                                   width: 7,
                                 ),
                                 Text('Edit Profile',style: TextStyle(
                                     fontSize: 20
                                 ),),
                                 Spacer(),
                                 Icon(Icons.arrow_forward_ios_outlined),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),

                   child: const Row(
                     children:
                     [
                       Icon(Icons.library_books_sharp,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('My Listeings',style: TextStyle(
                         fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),

                   child: const Row(
                     children:
                     [
                       Icon(Icons.chat,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('Chat',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),

                   child: const Row(
                     children:
                     [
                       Icon(Icons.payment_outlined,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('My Payments',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),

                   child: const Row(
                     children:
                     [
                       Icon(Icons.favorite_border,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('My Favorites',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const SavedSearched()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.grey,
                       width: 1.0,
                       style: BorderStyle.solid),
                   ),

                   child: const Row(
                     children:
                     [
                       Icon(Icons.save_rounded,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('Saved Searches',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               Container(
                 height: 90,
                 width: 400,
                 decoration: BoxDecoration(
                   border: Border.all(
                       color: Colors.grey,
                       width: 1.0,
                       style: BorderStyle.solid),
                 ),
           child:Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:
             [
               const Text('Settings',style: TextStyle(
                 color: Colors.blue,
                 fontSize: 14
               ),),
               Row(
                 children:
                 [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
              },
              child: Container(
                height: 65,
                width: 390,
                child: const Row(
                  children:
                  [
                    Icon(Icons.language,size: 28,),
                    SizedBox(
                      width: 7,
                    ),
                    Text('Language ',style: TextStyle(
                        fontSize: 20
                    ),),
                    Spacer(),
                    Text('العربيه',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
                 ],
               ),
             ],
           ),
               ),
               const SizedBox(height: 5,),
               Container(
                 height: 90,
                 width: 400,
                 decoration: BoxDecoration(
                   border: Border.all(
                       color: Colors.grey,
                       width: 1.0,
                       style: BorderStyle.solid),
                 ),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     const Text('Contact us',style: TextStyle(
                         color: Colors.blue,
                         fontSize: 14
                     ),),
                     Row(
                       children:
                       [
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                           },
                           child: Container(
                             height: 65,
                             width: 390,
                             child: const Row(
                               children:
                               [
                                 Icon(Icons.person_pin_circle_outlined,size: 28,),
                                 SizedBox(
                                   width: 7,
                                 ),
                                 Text('Agents ',style: TextStyle(
                                     fontSize: 20
                                 ),),
                                 Spacer(),
                                 Icon(Icons.arrow_forward_ios_outlined),
                               ],
                             ),
                           ),
                         ),

                       ],
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),
                   child: const Row(
                     children:
                     [
                       Icon(Icons.headset_outlined,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('Support ',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 5,),
               Container(
                 height: 90,
                 width: 400,
                 decoration: BoxDecoration(
                   border: Border.all(
                       color: Colors.grey,
                       width: 1.0,
                       style: BorderStyle.solid),
                 ),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     const Text('Others',style: TextStyle(
                         color: Colors.blue,
                         fontSize: 14
                     ),),
                     Row(
                       children:
                       [
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                           },
                           child: Container(
                             height: 65,
                             width: 390,
                             child: const Row(
                               children:
                               [
                                 Icon(Icons.verified_user_outlined,size: 28,),
                                 SizedBox(
                                   width: 7,
                                 ),
                                 Text('Terms and Conditions ',style: TextStyle(
                                     fontSize: 20
                                 ),),
                                 Spacer(),
                                 Icon(Icons.arrow_forward_ios_outlined),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecentlyViewed()));
                 },
                 child: Container(
                   height: 65,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.grey,
                         width: 1.0,
                         style: BorderStyle.solid),
                   ),
                   child: const Row(
                     children:
                     [
                       Icon(Icons.info_outline,size: 28,),
                       SizedBox(
                         width: 7,
                       ),
                       Text('About Us ',style: TextStyle(
                           fontSize: 20
                       ),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios_outlined),
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
