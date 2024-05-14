import 'package:flutter/material.dart';

import '../widgets/icon_text_card_widget.dart';
import 'package:iconsax/iconsax.dart'; // <------------ import iconsax

class ResumeListSectionsPage extends StatelessWidget {
  const ResumeListSectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text("Sections", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
            ],
          ),
          Expanded(
            /*child: ListView.builder(
              itemCount: 100, // Example list item count
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'));
              },
            ),*/
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  IconTextCard(icon: Icons.person_2_outlined , text: 'Personal Details', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.menu_book_sharp, text: 'Education', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.work, text: 'Experience', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.lightbulb_sharp, text: 'Skills', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.assignment, text: 'Objective', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.book, text: 'Reference', iconColor: Colors.blue,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("More Sections", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  IconTextCard(icon: Icons.build, text: 'Projects', iconColor: Colors.blue,),
                  IconTextCard(icon: Icons.description_outlined, text: 'Cover Letter', iconColor: Colors.blue,),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 50, // Height of the sticky bottom container
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
                SizedBox(width: 10,),
                Text('View CV', style: TextStyle(color: Colors.white, fontSize: 16),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
