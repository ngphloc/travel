package imagetoolkit;
import java.awt.*;

public class ImageWindow extends Panel {
  ImageCanvas imageCanvas;
  Scrollbar vertBar, horzBar;
  Image image;
  int imgWidth, imgHeight;
  int imgX, imgY;

  public ImageWindow(Image img) {
    image=img;
    imgX=0;
    imgY=0;

    while((imgHeight=image.getHeight(this))==-1) {}
    while((imgWidth=image.getWidth(this))==-1) {}

    imageCanvas=new ImageCanvas(image);
    vertBar=new Scrollbar(Scrollbar.VERTICAL);
    vertBar.setValues(imgY,imageCanvas.bounds().height,0,imgHeight);
    horzBar=new Scrollbar(Scrollbar.HORIZONTAL);
    horzBar.setValues(imgX,imageCanvas.bounds().width,0,imgWidth);

    horzBar.setPageIncrement(imgWidth/10);
    vertBar.setPageIncrement(imgHeight/10);

    GridBagLayout gridbag=new GridBagLayout();
    setLayout(gridbag);
    GridBagConstraints c=new GridBagConstraints();

    c.fill=GridBagConstraints.BOTH;
    c.weightx=1.0;
    c.weighty=1.0;
    gridbag.setConstraints(imageCanvas,c);
    add(imageCanvas);

    c.fill=GridBagConstraints.VERTICAL;
    c.weightx=0.0;
    c.weighty=0.0;
    c.gridx=1;
    c.gridy=0;
    gridbag.setConstraints(vertBar,c);
    add(vertBar);

    c.fill=GridBagConstraints.HORIZONTAL;
    c.gridx=0;
    c.gridy=1;
    gridbag.setConstraints(horzBar,c);
    add(horzBar);

  }

  public synchronized void reshape(int x, int y, int width, int height) {
    super.reshape(x,y,width,height);
    setScrollbar();
  }

  public void setScrollbar() {
    int canvasWidth=imageCanvas.bounds().width;
    int canvasHeight=imageCanvas.bounds().height;

    if(canvasWidth > imgWidth)
      horzBar.disable();
    else {
      horzBar.enable();
      horzBar.setValues(imgX,canvasWidth,0,imgWidth);
    }

    if(canvasHeight > imgHeight)
      vertBar.disable();
    else {
      vertBar.enable();
      vertBar.setValues(imgY,canvasHeight,0,imgHeight);
    }
  }

  public void setImage(Image img) {
    image=img;
    imgX=0;
    imgY=0;

    while((imgHeight=image.getHeight(this))==-1) {}
    while((imgWidth=image.getWidth(this))==-1) {}

    imageCanvas.setImage(img);
    setScrollbar();
  }

  public boolean handleEvent(Event e) {
    if(e.target==horzBar) {
      switch(e.id) {
        case Event.SCROLL_PAGE_UP:
          break;
        case Event.SCROLL_LINE_UP:
          break;
        case Event.SCROLL_ABSOLUTE:
          break;
        case Event.SCROLL_PAGE_DOWN:
          break;
        case Event.SCROLL_LINE_DOWN:
          break;
      }
      imgX=horzBar.getValue();
      imageCanvas.repaint();
      return true;
    }
    else if(e.target==vertBar) {
      switch(e.id) {
        case Event.SCROLL_PAGE_UP:
          break;
        case Event.SCROLL_LINE_UP:
          break;
        case Event.SCROLL_ABSOLUTE:
          break;
        case Event.SCROLL_PAGE_DOWN:
          break;
        case Event.SCROLL_LINE_DOWN:
          break;
      }
      imgY=vertBar.getValue();
      imageCanvas.repaint();
      return true;
    }
    else
      return false;
  }

}

class ImageCanvas extends Canvas {
  Image canvasImg;
  public ImageCanvas(Image img) {
    canvasImg=img;
  }

  public void paint(Graphics g) {
    g.drawImage(canvasImg,
                -1*((ImageWindow)getParent()).imgX,
                -1*((ImageWindow)getParent()).imgY,
                this);

  }

  public void setImage(Image img) {
    canvasImg=img;
    repaint();
  }
}
