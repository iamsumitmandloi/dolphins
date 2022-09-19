import 'package:flutter_test/flutter_test.dart';
import 'package:new_app/data/get_image_client.dart';


void main(){
  test('when api call it should return data type string',() async{
    //Act
    var a  =  await UnSplashClient().getImages();
    //Asert
    expect(a.runtimeType,String);
  });


}