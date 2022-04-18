trigger triggerFullPrice on Car__c (after insert, after update) {
    set <Id> carId = New Set <id> ();
    for (Car__c car: Trigger.new){ 
        if (car.id != Null ) { 
        carId.add(car.id); 
        } 
    }
    
    if(carId != NULL ){
        list<Car__c> updateCarList=  new list <Car__c> ();
        for(Car__c car: [SELECT Id, Price__c, Tax__c, Full_Price__c FROM Car__c WHERE id in: carId] ){
            car.Full_Price__c = car.Price__c+car.Tax__c;
            updateCarlist.add(car);
        }
        if(updateCarlist != NULL){
            update updateCarList;
        }    
    }
}