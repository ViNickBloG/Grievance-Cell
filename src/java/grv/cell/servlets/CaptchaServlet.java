package grv.cell.servlets;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.io.*;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;

public class CaptchaServlet extends HttpServlet
{

    public CaptchaServlet()
    {
    }

    public void init(ServletConfig servletconfig)
        throws ServletException
    {
        super.init(servletconfig);
        context = servletconfig.getServletContext();
        //System.out.println("CaptchaServlet Initiated");
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
        doPost(httpservletrequest, httpservletresponse);
    }

    public void doPost(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
        HttpSession httpsession = httpservletrequest.getSession(true);
        httpservletresponse.setHeader("Cache-Control", "no-cache");
        httpservletresponse.setDateHeader("Expires", 0L);
        httpservletresponse.setHeader("Pragma", "No-cache");
        byte byte0 = 75;
        byte byte1 = 35;
        Random random = new Random();
        int i = random.nextInt();
        String s = Integer.toHexString(i);
        String s1 = s.substring(0, 5);
        httpsession.setAttribute("captcha", s1);
        //Color color = new Color(204, 204, 204);
		//Color color1 = new Color(0, 0, 100);
		Color color = new Color(204, 255, 204);//Background
		Color color1 = new Color(50, 9, 60); //font
        Font font = new Font("SansSerif", 1, 17);
        BufferedImage bufferedimage = new BufferedImage(byte0, byte1, 1);
        java.awt.Graphics2D graphics2d = bufferedimage.createGraphics();
        graphics2d.setColor(color);
        graphics2d.fillRect(0, 0, byte0, byte1);
        graphics2d.setColor(color1);
        graphics2d.setFont(font);
        graphics2d.drawString(s1, 10, 25);
        graphics2d.setColor(color);
		 			Graphics2D g2=bufferedimage.createGraphics();
                    g2.setPaint(Color.GREEN);
                    g2.setStroke(new BasicStroke(2));
                    //g2.fill(new Line2D.Double(20,20,50,50));
					g2.fill(new Line2D.Double());
					g2.drawLine(0, 2, 200, 0);
					g2.drawLine(0, 32, 200, 32);
        //graphics2d.drawLine(10, 6, 80, 17);
        //graphics2d.drawLine(10, 32, 80, 22);
        httpservletresponse.setContentType("image/jpeg");
        javax.servlet.ServletOutputStream servletoutputstream = httpservletresponse.getOutputStream();
        ImageIO.write(bufferedimage, "jpeg", servletoutputstream);
        servletoutputstream.close();
    }

    private static final String CPR = "GR.com";
    private static final String VER = "1.1";
    private static final String CAPTCHA = "captcha";
    private ServletContext context;
}