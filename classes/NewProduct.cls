public class NewProduct {
    public My_Product__c prod{get;set;}
    public NewProduct(){
    	prod= new My_Product__c();
    }
public PageReference Cancel()
{
    PageReference pageRef = new PageReference('https://mirketa3-dev-ed.lightning.force.com/lightning/page/home');
    pageRef.setRedirect(true);
    return pageRef;
}
   public PageReference home(){
         PageReference pr=new  PageReference('/apex/HomePage');
         return pr;
    }
  public PageReference product(){
         PageReference pr=new  PageReference('/apex/ProductHome');
         return pr;
    }
    public PageReference re(){
        PageReference pr=new  PageReference('/apex/	New_PRODUCUT');
         return pr;
    }
public PageReference saveProduct()
{
    Database.saveResult res = Database.insert(prod,false);
    
    if(res.isSuccess())
    {
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Product Inserted') );
    PageReference prod=new PageReference('https://mirketa3-dev-ed.lightning.force.com/lightning/n/Product_Details');
    
    return prod;
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