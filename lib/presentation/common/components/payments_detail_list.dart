import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';
import 'package:flutter_web/presentation/common/components/payment_list_tile.dart';
import 'package:flutter_web/presentation/common/components/style.dart';

import '../size_config.dart';

class PaymentsDetailList extends StatelessWidget {
  const PaymentsDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                offset: Offset(10, 15),
                blurRadius: 15,
                color: ColorsManager.grey,
              ),
            ],
          ),
          child: Image.asset('assets/card.png'),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Recent Activities',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '27 Apr, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: ColorsManager.blue2,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) =>  PaymentListTile(
              icon: recentActivities[index]["icon"],
              amount:recentActivities[index]["amount"],
              label: recentActivities[index]["label"],
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Upcoming Payments',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '12 May, 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: ColorsManager.bgColor,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            upcomingPayments.length,
            (index) =>  PaymentListTile(
              icon: upcomingPayments[index]["icon"],
              amount:upcomingPayments[index]["amount"],
              label: upcomingPayments[index]["label"],
            ),
          ),
        ),
      ],
    );
  }
}


const recentActivities = [
  {
    "icon": 'assets/drop.svg',
    "label": 'Water Bill',
    "amount": "\$120"
  },
  {
    "icon": 'assets/salary.svg',
    "label": 'Income Salary',
    "amount": "\$4500"
  },
  {
    "icon": 'assets/electricity.svg',
    "label": 'Electric Bill',
    "amount": "\$150"
  },
  {
    "icon": 'assets/wifi.svg',
    "label": 'Internet Bill',
    "amount": "\$60"
  },
];

const upcomingPayments = [
  {
    "icon": 'assets/home.svg',
    "label": 'Home Rent',
    "amount": "\$1500"
  },
  {
    "icon": 'assets/salary.svg',
    "label": 'Car Insurance',
    "amount": "\$150"
  },
];

const transactionHistory = [
  {
    "avatar": 'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Car Insurance',
    "amount": "\$350",
    "time": "10:42:23 AM",
    "status": "Completed",
  },
  {
    "avatar": 'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Loan',
    "amount": "\$350",
    "time": "12:42:00 PM",
    "status": "Completed",
  },
  {
    "avatar": 'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
    "label": 'Online Payment',
    "amount": "\$154",
    "time": "10:42:23 PM",
    "status": "Completed",
  },
];