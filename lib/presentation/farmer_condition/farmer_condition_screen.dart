import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';

class FarmerConditionsScreen extends StatefulWidget {
  const FarmerConditionsScreen({Key? key}) : super(key: key);

  @override
  _FarmerConditionsScreenState createState() => _FarmerConditionsScreenState();
}

class _FarmerConditionsScreenState extends State<FarmerConditionsScreen> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lending Conditions'),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('farmer_conditions').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(data['farmer_name'] ?? 'Unknown'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount: ${data['total_amount'] ?? '0'}'),
                            Text('Tenure: ${data['tenure'] ?? 'Unknown'}'),
                            Text('Start Date: ${data['start_date'] ?? 'Unknown'}'),
                            Text('End Date: ${data['end_date'] ?? 'Unknown'}'),
                            Text('Interest Rate: ${data['interest_rate'] ?? '0'}%'),
                            Text('reason: ${data['reason'] ?? 'Unknown'}'),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: CustomElevatedButton(
              width: 150.h,
              text: "Add Condition",
              buttonTextStyle: theme.textTheme.titleLarge!,
              onPressed: () {
                // Navigate to the add condition screen
                Navigator.pushNamed(context, '/add_condition');
              },
            ),
          ),
        ],
      ),
    );
  }
}