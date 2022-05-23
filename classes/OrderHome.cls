public class OrderHome {
	 public PageReference home(){
         PageReference pr=new  PageReference('/apex/HomePage');
         return pr;
    }
    public PageReference re(){
        PageReference pr=new  PageReference('/apex/	OrderHome');
         return pr;
    }
    public PageReference add(){
        PageReference pr=new  PageReference('/apex/	New_Order');
         return pr;
    }
     public PageReference doEdit(){
        PageReference pr=new  PageReference('/apex/	OrderDetails');
         return pr;
    }
     public PageReference doDetele(){
        PageReference pr=new  PageReference('/apex/	OrderDetails');
         return pr;
    }
}