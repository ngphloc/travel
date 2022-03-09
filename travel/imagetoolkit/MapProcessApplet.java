package imagetoolkit;

import java.awt.Image;
import java.awt.Color;
import java.awt.Dimension ;
import java.awt.Graphics;
import java.net.URL;
import java.net.MalformedURLException;
import javax.swing.UIManager;
import java.applet.Applet;


public class MapProcessApplet extends Applet {
  boolean isStandalone = false;
  Image img;

  //Construct the applet
  public MapProcessApplet() {
  }

  //Initialize the applet
  public void init() {
    try  {
      jbInit();
    }
    catch(Exception e)  {
      e.printStackTrace();
    }
  }

  //Start
  public void start() {
  }

  //Component initialization
  private void jbInit() throws Exception {
    try {
      img=getImage(new URL(getDocumentBase(),"images/HCMMap.gif"));
      int w=img.getWidth(this), h=img.getHeight(this);



      this.setSize(new Dimension(w,h));
    }
    catch(MalformedURLException e) {
      System.out.println(e);
    }
  }

  //Get Applet information
  public String getAppletInfo() {
    return "Applet Information";
  }

  //Get parameter info
  public String[][] getParameterInfo() {
    return null;
  }
  // static initializer for setting look & feel
  static {
    try {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
      //UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
    }
    catch (Exception e) {}
  }

  //paint
  public void paint(Graphics g) {
    g.drawImage(img,0,0,this);
  }
}
