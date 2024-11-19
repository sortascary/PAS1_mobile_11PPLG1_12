import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/teamData_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Models/Team_model.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycard.dart';

class TeamsMenu extends StatelessWidget {
  final TeamdataController controller = Get.put(TeamdataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'English Teams',
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final league = controller.teams[index] as TeamModel;

            return MyCard(
              image: league.image,
              teamname: league.teamName,
              onTap: () => controller.togglelike(index),
              facebook: league.facebook,
              website: league.website,
              twitter: league.twitter,
              liked: controller.liked[index],
              num: index,
            );
          },
        );
      }),
    );
  }
}