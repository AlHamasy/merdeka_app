import 'package:get/get.dart';
import 'package:merdeka_app/model/NewsResponse.dart';
import 'package:merdeka_app/services/news_service.dart';

class NewsController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  var isLoading = false.obs; // variabel yg dapat diamati, nilai awal false
  var isError = false.obs;
  var errorMessage = ''.obs;
  var newsData = Rx<List<Articles>?>(null); // variabel yg dapat diamati, nilai awal null

  Future<void> getNews() async{
    try{
      isLoading.value = true;

      var newsResponse = await NewsService.getNews();
      newsData.value = newsResponse;

      isError.value = false;
    } catch (e){
      errorMessage.value = e.toString();
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }


  var counter = 0.obs;

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

}