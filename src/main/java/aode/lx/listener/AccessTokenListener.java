package aode.lx.listener;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by admin on 2015/11/27.
 */
public class AccessTokenListener {
    public static void main(String[] args) {
        new AccessTokenListener(4);
    }
    public AccessTokenListener(int second){
        Timer timer = new Timer();
        timer.schedule(new MyTimeTask(),0,second*1000);
    }
    private class MyTimeTask extends TimerTask{

        @Override
        public void run() {
            System.out.println("running");
        }
    }
}
