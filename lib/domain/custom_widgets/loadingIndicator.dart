import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.network("https://assets9.lottiefiles.com/packages/lf20_rwq6ciql.json",
          width: 20,),
          SizedBox(
            width: 10,
          ),
          Text("Loading...")
        ],
      ),
    );
  }
}
