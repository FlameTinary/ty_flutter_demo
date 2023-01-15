import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/change_notifier_provider.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/class_model.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/consumer.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/student_model.dart';

class CustomProviderDemo extends StatefulWidget {
  const CustomProviderDemo({super.key});

  @override
  State<CustomProviderDemo> createState() => _CustomProviderDemoState();
}

class _CustomProviderDemoState extends State<CustomProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('custom provider'),
      ),
      body: Center(
        child: ChangeNotifierProvider<ClassModel>(
          data: ClassModel(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ClassModel>(
                    builder: (context, value) {
                      return Text("教室学生人数为: ${value?.totalCount.toString()}");
                    },
                  ),
                  // Builder(builder: (context) {
                  //   return Text(
                  //       "教室学生人数为: ${ChangeNotifierProvider.of<ClassModel>(context)?.totalCount.toString()}");
                  // }),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          ChangeNotifierProvider.of<ClassModel>(context)
                              ?.add(Student('lili', 18));
                        },
                        child: Text('点击添加一个学生'),
                      );
                    }
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
