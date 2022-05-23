public class Home {
    
    public PageReference product(){
        PageReference pr=new PageReference('/apex/ProductHome');
            return pr;
    }
   	public PageReference order(){
        PageReference pr=new PageReference('/apex/OrderHome');
            return pr;
    }
   public PageReference re(){
        PageReference pr=new PageReference('https://mirketa3-dev-ed.lightning.force.com/lightning/n/Home_Page');
        pr.setRedirect(true);
        return pr;   
   }
}