public class Edit {
   public My_Product__c produ{get;set;}
    public List<My_Product__c>prod{get;set;}
    public List<WrapperClass>lstWrap{get;set;}
    public string recId{get;set;}
    public Boolean isEdit {get; set;}
    public String productName{get;set;}
    public Edit(){
      produ = new My_Product__c();
    lstWrap=new List<WrapperClass>();
    loadProd();
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
        PageReference pr=new  PageReference('/apex/	EditPage');
         return pr;
    }
    public void loadProd()
    {
        prod = [select Name,Category__c,Brands__c,Models__c,Cost__c,Approval_Status__c,Units_Available__c from My_Product__c];
        lstWrap.clear();
        for(My_Product__c a : prod){
            WrapperClass w = new WrapperClass(a);
            lstWrap.add(w);
        }
    }
    public PageReference doEdit()
    {
        produ = [select Name,Category__c,Brands__c,Models__c,Cost__c,Approval_Status__c,Units_Available__c from My_Product__c where id=:recId];
        PageReference pageRef = new PageReference('https://mirketasoftwarepvtltd-f-dev-ed--c.visualforce.com/apex/Product_Detail?core.apexpages.request.devconsole=1');
        pageRef.setRedirect(true);
        return pageRef;
    }
}