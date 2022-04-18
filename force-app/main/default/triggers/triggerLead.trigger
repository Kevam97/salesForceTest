trigger triggerLead on Lead__c (after insert) {
	localLaborHttp.getLaborRate(Trigger.New);
}