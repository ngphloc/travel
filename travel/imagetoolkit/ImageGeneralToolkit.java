package imagetoolkit;
import java.awt.Image;
import java.awt.image.PixelGrabber;
import java.awt.image.ColorModel;
import java.awt.image.MemoryImageSource;
import java.awt.Component;
import javax.swing.JComponent;

public class ImageGeneralToolkit {

  public ImageGeneralToolkit() {
  }

  public static boolean cutImages(Component component, Image img,
                           int[] aHeight, int m, int[] aWidth, int n, ColorModel cm,
                           Image[][] aImg) {
    //in:component, img, aHeight, m, aWidth, n, cm
    //out:aImg

    if(m<1||n<1||aWidth==null||aHeight==null||component==null||img==null)
	  	return false;

    int biWidth=img.getWidth(component), biHeight=img.getHeight(component);
    if(biWidth==0||biHeight==0)  return false;

    int i=0, j=0, k=0;
    int sumH=0, sumW=0;
    for(i=0;i<m;i++)
	  {
		  if(aHeight[i]==0)  return false;
  		sumH +=aHeight[i];
	  	if(sumH>biHeight) return false;
	  }
    for(j=0;j<n;j++)
	  {
		  if(aWidth[j]==0)  return false;
  		sumW +=aWidth[j];
	  	if(sumW>biWidth) return false;
	  }

    int[] pix=new int[biWidth*biHeight];
    if(pix==null) return false;
    PixelGrabber pg=new PixelGrabber(img, 0, 0, biWidth, biHeight, pix, 0, biWidth);
    if(pg==null)  return false;
    int[][] aPix=new int[m*n][];
    if(aPix==null)  return false;

    int w=0,h=0;
    for(i=0;i<m;i++)  {
      h=aHeight[i];
      for(j=0;j<n;j++)  {
        w=aWidth[j];
        aPix[i*m+j]=new int[w*h];
      }
    }

    i=j=k=0;
    w=0;h=aHeight[i];
    int[] aTmpPix=aPix[i*m+j];

    while(true) {
      for(j=0;j<n;j++)  //Copy a scanline
          for(int count=0;count<aWidth[j];count++)
            aPix[i*m+j][count]=pix[k+count];

      k+=biWidth;
      h--;
      if(h==0)  {
        i++;
        if(i==m)  break;
        h=aHeight[i];
      }

    }

    aImg=new Image[m][n];
    if(aImg==null)  return false;
    if(cm==null)
      cm=ColorModel.getRGBdefault();
    else
      cm=pg.getColorModel();
    if(cm==null)  {aImg=null;return false;};

    for(i=0;i<m;i++)
      for(j=0;j<n;j++)  {
        aImg[i][j]=component.createImage(new MemoryImageSource(aWidth[j],
                      aHeight[i],cm,aPix[i*m+j],0,aWidth[j]));

        if(aImg[i][j]==null)  {
          for(int u=0;u<m;u++)
            for(int v=0;v<n;v++)
              aImg[u][v]=null;
          aImg=null;
          return false;
        }
      }

    return true;
  }

  public static boolean cutImages(JComponent component, Image img,
                            int[] aHeight, int m, int[] aWidth, int n, ColorModel cm,
                            Image[][] aImg) {
    //in:component, img, aHeight, m, aWidth, n, cm
    //out:aImg

    if(m<1||n<1||aWidth==null||aHeight==null||component==null||img==null)
	  	return false;

    int biWidth=img.getWidth(component), biHeight=img.getHeight(component);
    if(biWidth==0||biHeight==0)  return false;

    int i=0, j=0, k=0;
    int sumH=0, sumW=0;
    for(i=0;i<m;i++)
	  {
		  if(aHeight[i]==0)  return false;
  		sumH +=aHeight[i];
	  	if(sumH>biHeight) return false;
	  }
    for(j=0;j<n;j++)
	  {
		  if(aWidth[j]==0)  return false;
  		sumW +=aWidth[j];
	  	if(sumW>biWidth) return false;
	  }

    int[] pix=new int[biWidth*biHeight];
    if(pix==null) return false;
    PixelGrabber pg=new PixelGrabber(img, 0, 0, biWidth, biHeight, pix, 0, biWidth);
    if(pg==null)  return false;
    int[][] aPix=new int[m*n][];
    if(aPix==null)  return false;

    int w=0,h=0;
    for(i=0;i<m;i++)  {
      h=aHeight[i];
      for(j=0;j<n;j++)  {
        w=aWidth[j];
        aPix[i*m+j]=new int[w*h];
      }
    }

    i=j=k=0;
    w=0;h=aHeight[i];
    int[] aTmpPix=aPix[i*m+j];

    while(true) {
      for(j=0;j<n;j++)  //Copy a scanline
          for(int count=0;count<aWidth[j];count++)
            aPix[i*m+j][count]=pix[k+count];

      k+=biWidth;
      h--;
      if(h==0)  {
        i++;
        if(i==m)  break;
        h=aHeight[i];
      }

    }

    aImg=new Image[m][n];
    if(aImg==null)  return false;
    if(cm==null)
      cm=ColorModel.getRGBdefault();
    else
      cm=pg.getColorModel();
    if(cm==null)  {aImg=null;return false;};

    for(i=0;i<m;i++)
      for(j=0;j<n;j++)  {
        aImg[i][j]=component.createImage(new MemoryImageSource(aWidth[j],
                      aHeight[i],cm,aPix[i*m+j],0,aWidth[j]));

        if(aImg[i][j]==null)  {
          for(int u=0;u<m;u++)
            for(int v=0;v<n;v++)
              aImg[u][v]=null;
          aImg=null;
          return false;
        }
      }

    return true;
  }

  public static boolean cutImages(Component component, Image img, int m, int n,
                                  ColorModel cm, Image[][] aImg) {
    //in:component, img, m, n, cm
    //out:aImg

    if(m<1||n<1||component==null||img==null)
	  	return false;

  	int i=0,j=0,k=0;
    int biWidth=img.getWidth(component), biHeight=img.getHeight(component);

  	int h, w;
  	int[] aHeight=new int[m], aWidth=new int[n];
    if(aHeight==null||aWidth==null) return false;

  	h=biHeight/m;
	  if(h==0) return false;
    for(i=0;i<m-1;i++)
      aHeight[i]=h;
    aHeight[i]=h+biHeight%m;

  	w=biWidth/n;
	  if(w==0) return false;
    for(j=0;j<n;j++)
      aWidth[j]=w;
    aWidth[j]=w+biWidth%n;

    return cutImages(component,img,aHeight,m,aWidth,n,cm,aImg);
  }

  public static boolean cutImages(JComponent component, Image img, int m, int n,
                                  ColorModel cm, Image[][] aImg) {
    //in:component, img, m, n, cm
    //out:aImg

    if(m<1||n<1||component==null||img==null)
	  	return false;

  	int i=0,j=0,k=0;
    int biWidth=img.getWidth(component), biHeight=img.getHeight(component);

  	int h, w;
  	int[] aHeight=new int[m], aWidth=new int[n];
    if(aHeight==null||aWidth==null) return false;

  	h=biHeight/m;
	  if(h==0) return false;
    for(i=0;i<m-1;i++)
      aHeight[i]=h;
    aHeight[i]=h+biHeight%m;

  	w=biWidth/n;
	  if(w==0) return false;
    for(j=0;j<n;j++)
      aWidth[j]=w;
    aWidth[j]=w+biWidth%n;

    return cutImages(component,img,aHeight,m,aWidth,n,cm,aImg);
  }

}





