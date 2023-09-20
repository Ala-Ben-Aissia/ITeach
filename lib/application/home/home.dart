import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_platform/application/home/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: homeAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: homeText(
                  text: 'Hello',
                  color: Colors.black45,
                ),
              ),
              SliverToBoxAdapter(
                child: homeText(
                  text: 'Aloulou ',
                  top: 5,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20.h),
              ),
              SliverToBoxAdapter(
                child: searchBar(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 15.h),
              ),
              SliverToBoxAdapter(
                child: buildSliders(context),
              ),
              SliverToBoxAdapter(
                child: buildMenu(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 7,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: coursesGrid(),
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 1.3.w,
                    // mainAxisExtent: 170,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
