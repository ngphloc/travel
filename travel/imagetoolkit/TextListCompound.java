package imagetoolkit;

import java.awt.*;
public class TextListCompound extends Panel {
  List list;
  TextField textField;
  ImageWindow wImage;

  public TextListCompound(String[] ss, Image img) {

    textField=new TextField(16);
    list=new List(32,false);
    for(int i=0;i<ss.length;i++)
      list.addItem(ss[i]);
    wImage=new ImageWindow(img);

    GridBagLayout gridbag=new GridBagLayout();
    setLayout(gridbag);
    GridBagConstraints c=new GridBagConstraints();

    c.fill=GridBagConstraints.NONE;
    c.anchor=GridBagConstraints.NORTHWEST;
    c.weightx=0.0;
    c.weighty=0.0;
    gridbag.setConstraints(textField,c);
    add(textField);

    c.fill=GridBagConstraints.BOTH;
    c.anchor=GridBagConstraints.WEST;
    c.gridheight=GridBagConstraints.REMAINDER;
    c.gridwidth=GridBagConstraints.REMAINDER;
    c.weightx=1.0;
    c.weighty=1.0;
    gridbag.setConstraints(wImage,c);
    add(wImage);

    c.fill=GridBagConstraints.BOTH;
    c.anchor=GridBagConstraints.WEST;
    c.weightx=0.0;
    c.weighty=1.0;
    c.gridx=0;
    c.gridy=1;
    gridbag.setConstraints(list,c);
    add(list);

  }
}

