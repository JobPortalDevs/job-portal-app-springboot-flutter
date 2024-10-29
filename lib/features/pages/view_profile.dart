import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewProfile extends ConsumerStatefulWidget {
  const ViewProfile({super.key});

  @override
  ConsumerState<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends ConsumerState<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            const ListTile(title: Text("full name"), subtitle: Text("name and surname"),),
            const SizedBox(height: 5,),
            const ListTile(title: Text("full name"), subtitle: Text("name and surname"),),
            const SizedBox(height: 5,),
            const ListTile(title: Text("full name"), subtitle: Text("name and surname"),),
            const SizedBox(height: 5,),
            const ListTile(title: Text("full name"), subtitle: Text("name and surname"),),
            const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}