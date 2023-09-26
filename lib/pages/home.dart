
import 'package:bloc_assignment/services/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen( this.routedPage, { super.key });

  final StatefulNavigationShell routedPage;

  //  i. Insights ii. Providers iii. Data iv. Notifications
  @override
  Widget build( BuildContext context ){


    void logout(){
      context.read<AuthBloc>().add( Logout() );
    }

    return Scaffold(

      appBar: AppBar( title: const Text("Home Screen"), titleTextStyle: const TextStyle( fontSize: 16 ), backgroundColor: Theme.of(context).primaryColor,),

      body: routedPage,
      bottomSheet:  ElevatedButton(  onPressed: logout, child: const Text('Logout'), ),

      bottomNavigationBar: BottomNavigationBar(
        
        fixedColor: Colors.white,
        currentIndex: routedPage.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: "Insights", backgroundColor: Colors.teal ),
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: "Providers",  backgroundColor: Colors.teal  ),
          BottomNavigationBarItem(icon: Icon(Icons.data_array), label: "Data",  backgroundColor: Colors.teal  ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications",  backgroundColor: Colors.teal  ),
        ],
        onTap: _changeRoute,
      ),

    );
  }


  void _changeRoute( index ){
    routedPage.goBranch(index);
  }
}
