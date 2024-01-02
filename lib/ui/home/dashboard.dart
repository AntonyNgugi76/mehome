import 'package:flutter/material.dart';
import 'package:mehome/ui/home/housecard/house_card.dart';
import 'package:mehome/utils/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String phone_number = '';
  String pin = '';

  @override
  Widget build(BuildContext context) {
    final isTwoPane = MediaQuery.of(context).size.width > 600;

    return Scaffold(
        backgroundColor: AppColors().colorScaffold,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MeHome', style: AppStyles().styleHeader),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.circle_notifications,
                        size: 34,
                        color: AppColors().colorPrimary,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                    iconColor: AppColors().colorPrimary,
                    hintText: 'Search Houses, BNBs...',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintStyle: AppStyles().styleDefault,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
              ),
              SizedBox(height:10),
              PropertyCard()
            ],
          ),
          // ))
        )));
  }
}
