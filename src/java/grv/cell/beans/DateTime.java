package grv.cell.beans;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime
{
    
    public static boolean isToday(String date)
	{
            boolean flag=false;
            
            String dates[]=date.split(" ");
            date=dates[0];
            
            if(sysDate().equals(date))
                flag=true;
            
            return flag;
	}
    
	public static String sysMonthYear()
	{
		Date dt=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MM/yyyy"); //12/2012
		return sdf.format(dt);
	}
	public static Date getJavaDate(String date)
	{
		Date dt=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //2012-12-30
		try{
                    if(date!=null && !"".equals(date))
                        dt=sdf.parse(date);
                }catch(Exception e){}
                
                return dt;
	}
        public static String sysDate()
	{
		Date dt=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //2012-12-30
		return sdf.format(dt);
	}
	public static String sysDateTime()
	{
		Date dt=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //2012-12-30 15:30:02
		return sdf.format(dt);
	}
	
	public static String getSimpleDate(String dt)
        {
            String dt1="";
            try
            {
                SimpleDateFormat dateValue1 = new SimpleDateFormat("yyyy-MM-dd");
                Date d = dateValue1.parse(dt);

                SimpleDateFormat dateValue = new SimpleDateFormat("dd-MMM-yyyy");
                dt1 = dateValue.format(d);

            }
            catch (Exception ex) {
               ex.printStackTrace();
            }

            return dt1;
        }

}
