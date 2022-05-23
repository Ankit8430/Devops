public class ProductHomPage {
    public PageReference home(){
         PageReference pr=new  PageReference('/apex/HomePage');
         return pr;
    }
    public PageReference re(){
      PageReference pageRef = new PageReference('https://mirketa3-dev-ed.lightning.force.com/lightning/n/Product_Home');
        pageRef.setRedirect(true);
        return pageRef;
    }
     public PageReference add(){
        PageReference pr=new  PageReference('/apex/New_PRODUCUT');
         return pr;
    }
     public PageReference doEdit(){
        PageReference pr=new  PageReference('/apex/EditPage');
         return pr;
    }
     public PageReference doDetele(){
        PageReference pr=new  PageReference('/apex/DeleteProduct');
         return pr;
    }
     public PageReference view(){
        PageReference pr=new  PageReference('/apex/Product_Details');
         return pr;
    }
}