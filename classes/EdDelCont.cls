public class EdDelCont {
    public List<My_Order__c> odd{ get; set; }
    public Boolean isEdit {get; set;}
    public String delId{ get; set; }
    public String subject{get;set;}
    public String body{get;set;}
    public List <String> ToAddresses{get;set;}
    public EdDelCont() {
        ToAddresses = new List <String>();
        ToAddresses.add('contactEmail@gmail.com');
        LoadData();
    }
     public PageReference home(){
         PageReference pr=new  PageReference('/apex/HomePage');
         return pr;
    }
  public PageReference order(){
         PageReference pr=new  PageReference('/apex/OrderHome');
         return pr;
    }
    public PageReference re(){
        PageReference pr=new  PageReference('/apex/	OrderDetails');
         return pr;
    }
    private void LoadData() {
    	odd = [Select id,Name,Address__c,Date_of_Order__c,Email_Address__c,GST_INN__c,Phone_Number__c,Product__c,Quantity__c,Status__c,Total_Price__c from My_Order__c limit 20];
    }
    public void DeleteAccount(){
        system.debug('delId' + delId);
        My_Order__c ord = [select id,Name from My_Order__c where Id =:delId];
        if (ord != null) {
            Delete ord;
            LoadData();
        }
    }
    public PageReference send()
    {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject( subject );
        email.setToAddresses( ToAddresses );
        email.setPlainTextBody( body );
        Messaging.SendEmailResult [] r =Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        return null;
    }
}