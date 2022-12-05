import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/my_icon_button.dart';
import 'package:gym/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 30.h,start: 20.w,end: 20.w),
              child: Row(
                children: [
                  SizedBox(
                    height: 110.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 55.sp,
                            backgroundImage: const NetworkImage('https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc='),
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.images.svg.camera,height: 30.h,width: 30.w,),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const myText(title: 'Abdo Saied',style: Style.medium,),
                          const myText(title: 'Coach',style: Style.small,),
                          space10Vertical,
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                              child: myElevatedButton(text: 'Edit Profile',width: 110.w, onPressed: (){}))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(Icons.location_on_outlined),
                myText(title: '10th of Ramadan', style: Style.small),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '4/5',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Ratings',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '78',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '5634',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.h),
              child: Row(
                children: [
                  Expanded(child: DefaultIconButton(icon: SvgPicture.asset(Assets.images.svg.facebook_icon,), onPressed: (){})),
                  Expanded(child: DefaultIconButton(icon: SvgPicture.asset(Assets.images.svg.tiktok), onPressed: (){})),
                  Expanded(child: DefaultIconButton(icon: SvgPicture.asset(Assets.images.svg.instagram), onPressed: (){})),
                  Expanded(child: DefaultIconButton(icon: SvgPicture.asset(Assets.images.svg.youtube), onPressed: (){})),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const myText(title: 'Certifications', style: Style.medium),
                    Text('Add Your Certifications Now To Earn Budge',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
