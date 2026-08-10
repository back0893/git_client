import 'package:flutter/material.dart';
import 'package:git_client/common/git_api.dart';

class Repos extends StatelessWidget {
  const Repos({super.key});

  @override
  Widget build(BuildContext context) {
    final future= Git(context).getRepos();
    return FutureBuilder(
      future: future, 
      builder: (context, snapshot){
        if (snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch(snapshot.connectionState){
            case ConnectionState.done:
            return Container(
              child:ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index){
                  final repo=snapshot.data![index];
                  return ListTile(
                    title: Text(repo.name),
                  );
                },
              ),
            );
            default:
            return CircularProgressIndicator();
        }
      }
      );
  }
}