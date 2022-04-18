@RestResource(urlMapping='/restApi/*')
global class restApi {
    @HttpGet
    global static List<Lead__c>  getLeads(){
        List<Lead__c> leadsList =[SELECT id,Documento__c,Name__c FROM Lead__c ];
        return leadsList;
    }
   
    @HttpPost
    global static void insertCar(id lead,double price, double tax,string model, double payment){
        try{
            Car__c newCar = new Car__c();
            newCar.Price__c = price;
            newCar.Tax__c = tax;
            newCar.Model_Year__c = model;
            newCar.Down_Payment__c = payment;
            insert newCar;
            
        }catch(Exception e){
           RestContext.response.responseBody= Blob.valueOf('Error: '+ e.getMessage());
        }
        
        
    }
}