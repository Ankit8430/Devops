public class OrderController {
    public My_Order__c ord{get;set;}
    public OrderController(){
    	ord= new My_Order__c();
    }
    public PageReference CancelOrder()
    {
        PageReference pageRef = new PageReference('https://mirketasoftwarepvtltd-f-dev-ed.lightning.force.com/lightning/n/Order_Details');
        pageRef.setRedirect(true);
        return pageRef;
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
        PageReference pr=new  PageReference('/apex/	New_Order');
         return pr;
    }
    public PageReference saveOrder()
    {
        Database.saveResult res = Database.insert(ord,false);
        
        if(res.isSuccess())
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Order Inserted') );
            PageReference ord=new PageReference('https://mirketa3-dev-ed.lightning.force.com/lightning/n/Order_Details');
            
            return ord;
        }
        else{
            List<Database.Error> errs= res.getErrors();
            for(Database.Error err : errs)
            {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,err.getMessage()) );
            }
            return null;
        }
    }
}