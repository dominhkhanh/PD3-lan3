import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        height: 140,
        width: 140,
        child: Container(
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent-xsp1-1.xx.fbcdn.net/v/t1.6435-9/118779813_986618455139433_1760688081225491772_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=174925&_nc_ohc=8TRc3IQyhi0AX9ME4KO&_nc_oc=AQnRAmaZ19xUHDxP4CK2garlUQQdUts1yJdo6Qr_HfORh_RSvoMtVQDil62hJBJZAf2chtvUDMfv93FqFEmuiRZQ&_nc_ht=scontent-xsp1-1.xx&oh=d757d630705df01f40003edabe193526&oe=60A0616C'),
          ),
        ),
      ),
    );
  }
}
