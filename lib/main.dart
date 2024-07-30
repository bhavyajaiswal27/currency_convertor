import 'package:currency_convertor/decode.dart';
import 'package:currency_convertor/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Currency_value_model cc;
  bool isloading = false;
  String nodatafound = "Now you can search";
  late bool wert;
  bool aa = true;

  checkingCountry(String word) async{
    setState(() {
      isloading = true;
  });
  final apiServices = ApiServices();
  wert = await apiServices.checkCountry(word);
  return wert;
  }
  searchContain(String word) async {
  try {
    final apiServices = ApiServices(); // Create an instance of ApiServices
    cc = await apiServices.fetchData(word); // Use the instance to call fetchData
  } catch (e) {
    print('Error fetching data: $e'); // Log exception for debugging purposes
    // or display an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching data: $e')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Currency Convertor', style: TextStyle(color: Colors.cyan),),
    ),
    body: Column(
      children: [
        SearchBar(
              hintText: "Currency 1",
              onSubmitted: (value) {
                // checkingCountry(value);
                aa = checkingCountry(value);
              },
            ),
            
            aa ? SearchBar(
                hintText: "enter currency 2",
                onSubmitted: (value) {
                  searchContain(value);
                },
              ) : Column(
                
              ),
            
          ],
        )
      
    );
    
  }
}