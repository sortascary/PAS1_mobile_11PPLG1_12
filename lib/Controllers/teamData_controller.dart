import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_12/Models/Team_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamdataController extends GetxController {
  var teams = [].obs;
  var liked = <RxBool>[].obs;
  var isLoading = true.obs;
  final String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3';

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void togglelike(int index) async {
    final prefs = await SharedPreferences.getInstance();
    liked[index].value = !liked[index].value; // Toggle liked state
    prefs.setBool('liked_$index', liked[index].value);
  }

  Future<void> fetchData() async {
  final uri = Uri.parse('$baseUrl/search_all_teams.php?l=English%20Premier%20League');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonDecode(response.body);
    final List<dynamic> leaguesData = json['teams'];

    // Parse JSON into Leaguemodel objects
    teams.value = leaguesData.map((league) {
      return TeamModel(
        id: league['idLeague'] != null ? int.tryParse(league['idLeague']) : null,
        image: league['strBadge'] ?? '',
        teamName: league['strTeam'] ?? '',
        facebook: league['strFacebook'] ?? '',
        website: league['strWebsite'] ?? '',
        twitter: league['strTwitter'] ?? '',
        liked: prefs.getBool('liked_${league['idLeague']}') ?? false,
        Desc: league['strDescriptionEN']?? '',
      );
    }).toList();

    // Update liked states
    liked.value = teams.map((league) {
      final teamModel = league as TeamModel;
      return teamModel.liked.obs;
    }).toList();
  } else {
    Get.snackbar(
      "Error",
      "Failed to fetch data",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  isLoading.value = false;
}

}