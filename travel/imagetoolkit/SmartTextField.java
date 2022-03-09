package imagetoolkit;
import java.awt.TextField;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Arrays;

public class SmartTextField extends TextField  implements KeyListener {
  String[] strings;
  boolean caseSensitive;
  int pos;

  public SmartTextField() {
    super();
    strings=null;
    caseSensitive=false;
    pos=0;
    addKeyListener(this);
  }
  public SmartTextField(int cols) {
    super(cols);
    strings=null;
    caseSensitive=false;
    pos=0;
    addKeyListener(this);
  }
  public SmartTextField( int cols, String[] ss) {
    super(cols);
    strings=ss;
    caseSensitive=false;
    pos=0;
    //Arrays.sort(strings);
    addKeyListener(this);
  }
  public SmartTextField( int cols, String[] ss, boolean cs) {
    super(cols);
    strings=ss;
    caseSensitive=cs;
    pos=0;
    //Arrays.sort(strings);
    addKeyListener(this);
  }
  public String[] getMemoryStringArray() {
    return strings;
  }
  public void setMemoryStringArray(String[] ss) {
    strings=ss;
    //Arrays.sort(strings);
  }
  public boolean getCaseSensitive() {
    return caseSensitive;
  }
  public void setCaseSensitive(boolean cs) {
    caseSensitive=cs;
  }

  public void keyPressed(KeyEvent e)  {
    char key=e.getKeyChar();
    if(key>31 && key<127) {
      validateText(key);
      e.consume();
    }
  }
  public void keyReleased(KeyEvent e)  {
  }
  public void keyTyped(KeyEvent e)  {
  }

  void validateText(char key) {
    pos=Math.min(pos,getText().length());
    String editField;
    editField=getText().substring(0,pos)+key;

    if(!caseSensitive)
      editField=editField.toLowerCase();

    int find=-1;
    for(int i=0;i<strings.length;i++) {
      try {
        if(caseSensitive) {
          if(strings[i].lastIndexOf(editField,0)!=-1) {
            find=i;
            break;
          }
        }
        else {
          if(strings[i].toLowerCase().lastIndexOf(editField,0)!=-1) {
            find=i;
            break;
          }
        }
      }
      catch(Exception e) {}
    }
    if(find!=-1) {
      setText(strings[find]);
      select(++pos,strings[find].length());
    }
  }
}
