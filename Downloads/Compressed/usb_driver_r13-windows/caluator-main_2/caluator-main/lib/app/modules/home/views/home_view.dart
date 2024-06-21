import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    controller.keySwitcher.value = !controller.keySwitcher.value;
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 16, top: 20),
                            child: controller.keySwitcher.value
                                ? TextField(
                                    controller: textController,
                                    textAlign: TextAlign.end,
                                    onChanged: (value) {
                                      controller.input.value =
                                          textController.text;
                                    },
                                  )
                                : Obx(
                                    () => AutoSizeText(controller.input.string,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 50),
                                        minFontSize: 12,
                                        maxLines: 2),
                                  )),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 50),
                          child: Obx(() => AutoSizeText(
                              controller.result.string,
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 40),
                              minFontSize: 18,
                              maxLines: 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.keySwitcher.value
                      ? Container()
                      : Obx(() => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: controller.listOfButton.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onLongPress: () {
                                controller.acSwitch(index);
                              },
                              onTap: () {
                                controller.addInput(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  controller.listOfButton[index].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            );
                          },),),
                ),)
          ],
        ),
      ),),
    );
  }
}
