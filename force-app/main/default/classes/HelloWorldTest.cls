@isTest
public class HelloWorldTest {
    @isTest static void hello(){
        HelloWorld hobj=new HelloWorld();
        String result=hobj.hello();
        System.assertEquals(result, 'Hello World');
    }
}