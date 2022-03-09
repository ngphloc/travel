package imagetoolkit;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class mainFrame extends Frame {
  BorderLayout borderLayout1 = new BorderLayout();

  //Construct the frame
  public mainFrame() {

    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try  {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Component initialization
  private void jbInit() throws Exception  {
    setLayout(borderLayout1);
    this.setSize(new Dimension(400, 300));
    this.setTitle("Frame Title");
  }

  //Overridden so we can exit on System Close
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if(e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }
  public void init() {
    String[] ss={"Hung", "Hong", "Hang", "Hoi", "Hien",
                    "Hinh" };

    List list=new List(256,true);
    list.addItem("Tuoi da buon");
    for(int i=0;i<ss.length;i++)
      list.addItem(ss[i]);
    Panel panel=new Panel();
    panel.add(list);
    add(panel);
    //frame.add("Center",new SmartTextField(20,str,false));
    //add("Center", new TextListCompound(ss));

  }
}
