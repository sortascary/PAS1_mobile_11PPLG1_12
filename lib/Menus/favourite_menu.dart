import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/task_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/teamData_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycard.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycolors.dart';

class FavouriteMenu extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TeamdataController league = Get.put(TeamdataController());

  @override
  Widget build(BuildContext context) {
    taskController.loadTasks(); // Load tasks when the screen opens

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Favorites',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colortextW),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: colorheader,
        ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return MyCard(
                    image: task.image,
                    teamname: task.title,
                    onTap: () {

                      league.togglelike(task.num);
                      taskController.deleteTask(task.id!);
                    },
                    facebook: task.facebook,
                    website: task.website,
                    twitter: task.twitter,
                    liked: (task.liked == 1).obs, 
                    num: task.num, // Ensure this is correct
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
