package aode.lx.utils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * ASCII符 32-->空格,58-->:,45-->-
 * @Description: TODO
 * @ClassName: DateUtils 
 * @author huangzy@gzjp.cn
 * @date 2014年8月15日 上午10:31:21
 */
public class DateUtils {
	public static final SimpleDateFormat defaultSdf = DateUtils.yyyyMMddSdf;
	public static final SimpleDateFormat yyyySdf = new SimpleDateFormat("yyyy");
	public static final SimpleDateFormat yyyyMMddSdf = new SimpleDateFormat("yyyyMMdd");
	public static final SimpleDateFormat yyyy45MM45ddSdf = new SimpleDateFormat("yyyy-MM-dd");
	public static final SimpleDateFormat yyyyMMddHHmmssSdf = new SimpleDateFormat("yyyyMMddHHmmss");
	public static final SimpleDateFormat yyyyMMdd32HHmmssSdf = new SimpleDateFormat("yyyyMMdd HHmmss");
	public static final SimpleDateFormat yyyyMMdd32HH58mm58ssSdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
	public static final SimpleDateFormat yyyy45MM45dd32HH58mm58ssSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static String format(Date date,SimpleDateFormat sdf){
		return sdf.format(date);
	}
	
	public static String format(Date date){
		return format(date, defaultSdf);
	}
	
	public static String dateStrConverStr(String source,SimpleDateFormat inSdf,SimpleDateFormat outSdf) {
		Date date;
		String retStr = null;
		try {
			date = inSdf.parse(source);
			retStr = outSdf.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return retStr;
	}
	
	public static Date parse(String source,SimpleDateFormat sdf){
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Date parse(String source){
		return parse(source,defaultSdf);
	}
	
	public static Date add(Date date,int field,int amount){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(field, amount);

		return cal.getTime();
	}

/*    public static Date dateInfo(){
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date currentTime = new java.util.Date();
        Date time = formatter.format(currentTime);
        return time;
    }*/
}