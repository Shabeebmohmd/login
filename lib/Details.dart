import 'package:flutter/material.dart';

import 'package:login/person_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // Future<void> _logout(context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isLoggedIn', false);

  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context) => Homepage()),
  //   );
  // }

  List<String> name = [
    'Shabeeb',
    'Rabeeh',
    'Vaishnav',
    'Midlaj',
    'Sadik',
    'Shahen',
    'Sunaif',
    'Adnan',
    'Nidhin',
    'Shameel'
  ];
  var imgArray = <Image>[
    Image.asset('assets/Images/img-1.jpg'),
    Image.asset('assets/Images/img-2.jpg'),
    Image.asset('assets/Images/img-3.jpg'),
    Image.asset('assets/Images/img-4.jpg'),
    Image.asset('assets/Images/img-5.jpg'),
    Image.asset('assets/Images/img-6.jpg'),
    Image.asset('assets/Images/img-7.jpg'),
    Image.asset('assets/Images/img-8.jpg'),
    Image.asset('assets/Images/img-9.jpg'),
    Image.asset('assets/Images/img-10.jpg'),
  ];

  final List<String> imgPaths = [
    'assets/Images/img-1.jpg',
    'assets/Images/img-2.jpg',
    'assets/Images/img-3.jpg',
    'assets/Images/img-4.jpg',
    'assets/Images/img-5.jpg',
    'assets/Images/img-6.jpg',
    'assets/Images/img-7.jpg',
    'assets/Images/img-8.jpg',
    'assets/Images/img-9.jpg',
    'assets/Images/img-10.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text("'Logout'"),
                            content: Text('Are you sure you want to Logout'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setLogin();
                                    Navigator.pushReplacementNamed(
                                        context, 'home');
                                  },
                                  child: Text('Confirm'))
                            ]);
                      });
                },
                child: const Text('Logout'))
          ],
          title: const Text(
            'Inbox',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: imgArray[index].image,
                  ),
                  title: Text(name[index]),
                  subtitle: Text('Unread Message $index'),
                  trailing: Text('1$index:00 PM'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Person(
                        name: name[index],
                      );
                    }));
                  },
                );
              } else {
                return ListTile(
                  leading: ClipRRect(
                    child: Image.asset(
                      imgPaths[index],
                      height: 50,
                      width: 60,
                    ),
                  ),
                  title: Text(name[index]),
                  subtitle: Text('Unread Message $index'),
                  trailing: Text('1$index:00 PM'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Person(
                        name: name[index],
                      );
                    }));
                  },
                );
              }
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 30,
              );
            },
            itemCount: name.length,
          ),
        ));
  }

  Future<bool> setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final v = await prefs.setBool('isLoggedIn', false);
    return v;
  }
}
