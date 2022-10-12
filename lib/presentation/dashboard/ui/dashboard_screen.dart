import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';

import '../../common/components/app_bar_actions_item.dart';
import '../../common/components/bar_chart_component.dart';
import '../../common/components/dashboard_header.dart';
import '../../common/components/history_table.dart';
import '../../common/components/info_card.dart';
import '../../common/components/payments_detail_list.dart';
import '../../common/components/side_menu.dart';
import '../../common/components/style.dart';
import '../../common/responsive.dart';
import '../../common/size_config.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        width: 100,
        child: SideMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: ColorsManager.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: ColorsManager.black,
                  )),
              actions: const [AppBarActionItem()],
            )
          : const PreferredSize(
              child: SizedBox(),
              preferredSize: Size.zero,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
              flex: 10,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.all(Responsive.isDesktop(context) ? 30 : 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DashboardHeader(),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? SizeConfig.blockSizeVertical! * 5
                            : SizeConfig.blockSizeVertical! * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: const [
                            InfoCard(
                              icon: 'assets/credit-card.svg',
                              label: 'Transfer via\nCard number',
                              amount: '\$1200',
                            ),
                            InfoCard(
                              icon: 'assets/transfer.svg',
                              label: 'Transfer via\nOnline banks',
                              amount: '\$2000',
                            ),
                            InfoCard(
                              icon: 'assets/bank.svg',
                              label: 'Transfer via\nSame bank',
                              amount: '\$1500',
                            ),
                            InfoCard(
                              icon: 'assets/invoice.svg',
                              label: 'Transfer to\nOther bank',
                              amount: '\$800',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? SizeConfig.blockSizeVertical! * 4
                            : SizeConfig.blockSizeVertical! * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                text: 'Balance',
                                size: Responsive.isDesktop(context) ? 16 : 14,
                                color: ColorsManager.bgColor,
                              ),
                              PrimaryText(
                                text: '\$1500',
                                size: Responsive.isDesktop(context) ? 30 : 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                          PrimaryText(
                            text: 'Past 30 Days',
                            size: Responsive.isDesktop(context) ? 16 : 14,
                            color: ColorsManager.bgColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const SizedBox(
                        height: 180,
                        child: BarChartComponent(),
                      ),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? SizeConfig.blockSizeVertical! * 5
                            : SizeConfig.blockSizeVertical! * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PrimaryText(
                            text: 'History',
                            size: 30.0,
                            fontWeight: FontWeight.w800,
                          ),
                          PrimaryText(
                            text: 'Transaction of past 6 months',
                            size: 16,
                            color: ColorsManager.bgColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      // const HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentsDetailList()
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: Container(
                  height: SizeConfig.screenHeight,
                  color: ColorsManager.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: const [
                        AppBarActionItem(),
                        PaymentsDetailList(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
