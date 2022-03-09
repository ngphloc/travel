package imagetoolkit;
import javax.swing.UIManager;
import java.awt.*;

public class Test {
  boolean packFrame = false;

  //Construct the application
  public Test() {
    mainFrame frame = new mainFrame();
    //Validate frames that have preset sizes
    //Pack frames that have useful preferred size info, e.g. from their layout
    String[] ss={"Hung", "Hong", "Hang", "Hoi", "Hien",
                    "Hinh" };

    Image img=Toolkit.getDefaultToolkit().getImage("images/HCMMap.gif");
    ImageWindow wImage=new ImageWindow(img);
    MapImageViewer tlCompound=new MapImageViewer(ss,img);

    //frame.add(wImage);
    frame.add(tlCompound);

    if (packFrame)
      frame.pack();
    else
      frame.validate();

    frame.setVisible(true);
  }

  //Main method
  public static void main(String[] args) {
    try  {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    }
    catch(Exception e) {
    }
    new Test();
  }
}
