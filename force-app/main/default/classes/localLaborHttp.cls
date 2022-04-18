public with sharing class localLaborHttp {
    public static void getLaborRate(List<Lead__c> leads){
        Http h = new Http();
		HttpRequest req = new HttpRequest();
    	req.setEndpoint('https://agsdev-ags.cs10.force.com/services/apexrest/v1/carsApi');
    	req.setMethod('GET');
        String authorizationHeader = 'Bearer '+'Ow8VcQTZTCWFsQYAUOjz';
        req.setHeader('Authorization', authorizationHeader);
       
        HttpResponse res =h.send(req);
        if(res.getStatusCode() == 200){
            localLaborWrapper response = localLaborWrapper.parse(res.getBody());
            localLaborWrapper.LocalLabor labor = response.labors.get(0);
            List<Lead__c> upLead = new List<Lead__c>();
            for(Lead__c l: leads){
                Lead__c up = new Lead__c();
                up.Id = l.Id;
                up.Documento__c = l.Documento__c;
                up.Name__c = l.Name;
                up.zipcode__c = labor.labor_rate;
                upLead.add(up);
            }
           	update upLead;
        }
    }

}