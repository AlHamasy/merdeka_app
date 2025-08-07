import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merdeka_app/controllers/news_controller.dart';

class NewsGetxScreen extends GetView<NewsController> {

  const NewsGetxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Screen"), 
        leading: IconButton(
            onPressed: (){
              //Navigator.pop(context, "INI DATA CALLBACK");
              Get.back(result: "INI DATA DARI GET BACK");
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Obx((){
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.isError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                ElevatedButton(onPressed: (){
                  controller.getNews();
                }, child: Text("Refresh"))
              ],
            ),
          );
        } else if (controller.newsData.value!.isNotEmpty) {
          return ListView.builder(
            itemCount: controller.newsData.value!.length,
            itemBuilder: (context, index) {
              var article = controller.newsData.value![index];
              return ListTile(
                title: Text(article.title ?? "No Title"),
                subtitle: Text(article.description ?? "No Description"),
              );
            },
          );
        } else {
          return Center(child: Text("Data Kosong"));
        }
      }),
    );
  }
}
