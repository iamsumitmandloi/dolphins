import 'package:bloc/bloc.dart';

class AppObserver extends BlocObserver {
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} ==>  $change');
  }
}
