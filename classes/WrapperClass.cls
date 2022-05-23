public class WrapperClass {
    public My_Product__c prodWrap{get;set;}
    public boolean isSelected{get;set;}

    	public WrapperClass(My_Product__c prodWrap)
    {
        this.prodWrap= prodWrap;
        isSelected=false;
    }
}