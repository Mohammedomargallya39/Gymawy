import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/core/cubit/bank_cubit/cubit.dart';
import 'package:gym/core/utils/constants.dart';
import 'package:gym/core/widgets/myElevatedButton.dart';
import 'package:gym/core/widgets/myText.dart';
import 'package:gym/core/widgets/my_icon_button.dart';
import 'package:gym/features/bank/main_screen/profile_screen/edit_links.dart';
import 'package:gym/features/bank/main_screen/profile_screen/edit_profile.dart';
import 'package:gym/gen/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late MainBloc cubit;

  @override
  void initState() {
    cubit = context.read<MainBloc>();
    super.initState();
  }
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
                          Row(
                            children: [
                              myElevatedButton(text: 'Edit Links',fontSize: 10.sp,height: 30.h,width: 80.w, onPressed: (){
                                navigateTo(context, const EditLinksScreen());
                              }),
                              space3Horizontal,
                              myElevatedButton(text: 'Edit Profile',fontSize: 10.sp,height: 30.h,width: 80.w, onPressed: (){
                                navigateTo(context, EditProfileScreen());
                              })
                            ],
                          ),

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
