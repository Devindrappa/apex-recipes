public class SOQLErrorExample {
    
    public static void callMethod(){
        try{
            List<Account> acc = [select id from account];
        }catch(Exception e){
            System.debug(e);
        }
        
    }
    @future
    public static void errorExampleMethod(){
        for(Integer i=0; i<300; i++){
            callMethod();
        }
    }
}