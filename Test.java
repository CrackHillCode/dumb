import java.util.Calendar;

public class Test implements Runnable {
    public static void main(String[] args) {
        new Thread(new Test()).start();

    }

    public void run() {
        while (true) {
            System.out.println(Calendar.getInstance().getTime());
            try {
                Thread.sleep(5000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
