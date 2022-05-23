public class DeleteProduct {
    public My_Product__c produ{get;set;}
    public List<My_Product__c>prod{get;set;}
    public List<WrapperClass>lstWrap{get;set;}
    public DeleteProduct(){
      produ = new My_Product__c();
    lstWrap=new List<WrapperClass>();
    loadProd();
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
     public PageReference home(){
         PageReference pr=new  PageReference('/apex/HomePage');
         return pr;
    }
   public PageReference product(){
         PageReference pr=new  PageReference('/apex/ProductHome');
         return pr;
    }
    public PageReference re(){
        PageReference pr=new  PageReference('/apex/	Delete Product');
         return pr;
    }
    
     public void doDelete()
    {
        List<My_Product__c> ProdToBeDeleted =new List<My_Product__c>();
            for(WrapperClass mw : lstWrap)
            {
                if(mw.isSelected)
                {
               	 ProdToBeDeleted.add(mw.prodWrap);
                }
            }
        List<Database.DeleteResult> dd = Database.delete(ProdToBeDeleted,false);
            for(Database.DeleteResult rs : dd)
            {
            if(rs.isSuccess())
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Product Deleted') );
                loadProd();
            }
            else{
                List<Database.Error> errs= rs.getErrors();
                for(Database.Error err : errs)
                {
               		 ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,err.getMessage()) );
                }
            }
          }
    }
}