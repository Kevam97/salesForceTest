public class controllerVisualForce {
	public List <Car__c> getInfo(){
       List <Car__c> results = Database.query(
           'SELECT Price__c, Tax__c, Registration_Plate__c,'+
		   'Full_Name__c,Full_Price__c,Down_Payment__c,Leasing__c,'+
           'Lead__c FROM Car__c');
       return results;
           
    }
    
}