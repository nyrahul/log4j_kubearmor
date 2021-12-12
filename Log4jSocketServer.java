import java.io.IOException;
import java.io.ObjectInputStream;

import org.apache.logging.log4j.core.net.server.ObjectInputStreamLogEventBridge;
import org.apache.logging.log4j.core.net.server.TcpSocketServer;

public class Log4jSocketServer {

	public static void execMyProg() throws IOException, InterruptedException {
		while(true) {
			Thread.sleep(5000);
			System.out.println("execing");
			Runtime.getRuntime().exec("touch /tmp/==============selftest.rj==============");
		}
	}

	public static void main(String[] args) {
		TcpSocketServer<ObjectInputStream> myServer = null;
		try {
			myServer = new TcpSocketServer<ObjectInputStream>(1337,new ObjectInputStreamLogEventBridge());
			Thread thread = new Thread("Exec Thread") {
				public void run(){
					System.out.println("run by: " + getName());
					try {
						execMyProg();
					} catch (IOException e) {
						e.printStackTrace();
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			};
			thread.start();
		} catch (IOException e) {
			System.out.println("EXCEPTION CAUGHT");
			e.printStackTrace();
		}
		myServer.run();
	}
}
