package grv.cell.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class PDFUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String folderName="uploadedfiles";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		writer.write("call POST with multipart form data");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("application/json");     
            System.out.println("============================");
            if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
            
        String uploadPath = getServletContext().getRealPath("/").replace("\\", "/")+"/"+folderName+"/";               

        checkDir(uploadPath); // create upload directory if not created
        
		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		
		try 
		{
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) 
			{
				if (!item.isFormField()) 
				{
                    //System.out.println(item.getName());
                    String fileName = item.getName();
                    fileName=createUniqueFileName(fileName);
                    
                  //you can use isPdf() or checkNone() instead of isImage() as per your requirement
                     if(isPdf(getExt(fileName))) // Store file in server if it is a valid image file.
                    // if(checkNone(getExt(fileName))) // Store file in server if it is a valid image file.
                    {
                    	File file = new File(uploadPath, fileName);                                 
						item.write(file);
				 		String size = formatSize(item.getSize());
				 		writer.write("{\"name\":\""+ fileName + "\",\"size\":\"" + size + "\",\"type\":\"" + item.getContentType() + "\",\"url\":\"" + folderName+"/"+ fileName + "\"}");
                                                System.out.println("{\"name\":\""+ fileName + "\",\"size\":\"" + size + "\",\"type\":\"" + item.getContentType() + "\",\"url\":\"" + folderName+"/"+ fileName + "\"}");
						//You can use above write() or use below JSONWriter()
						/* 
	                    new JSONWriter(response.getWriter())
	                      .object()
	                        .key("name")
	                        .value(fileName)
	                        .key("type")
	                        .value(item.getContentType())
	                        .key("size")
	                        .value(item.getSize())
	                      .endObject();
	                    response.flushBuffer();
						*/                                        
				 		break; // assume we only get one file at a time
		            }
		            else
		            {
		               writer.write("{\"error\":\" Invalid File: upload image file only \"}"); 
		            }
			}
		}
	}catch (Exception e) {
			e.printStackTrace();
	}
     finally {
		writer.close();
	}

}//END: 
        
private String createUniqueFileName(String fileName) {
	if(fileName.contains("\\"))
        fileName= fileName.substring(fileName.lastIndexOf("\\")+1); //(IE contains absulute path : extract only file name)
	long currentTimeMillis = System.currentTimeMillis();
	fileName = currentTimeMillis+"."+getExt(fileName);
    return fileName;
}

private String getExt(String fileName) {
	String ext = null;
	int ind=fileName.lastIndexOf(".");
	if(ind>0)
		ext=fileName.substring(ind+1);	// eg: return jpg/png/docx
	else
		ext="tmp";
   return ext;
}


private void checkDir(String uploadPath) {

	File file =new File(uploadPath);
	if(!file.exists())
		file.mkdirs();
		
	}

private static String formatSize(long size)
{
    String size1="";
    if(size<1024)
        size1=size+" bytes";
    if(size>=1024 && size<(1024*1024))
        size1=((size/1024)+"."+(size%1024))+" KB";
    if(size>=(1024*1024) )
        size1=((size/(1024*1024))+"."+(size%(1024*1024)))+" MB";
    return size1;

}
//used for checking file must be an image
 boolean isImage(String ext)  
{
    boolean flag=false;  
/*  You can put  your required extension to upload only required file type  */
    if(ext.equals("jpg") || ext.equals("jpeg") || ext.equals("png") || ext.equals("gif") || ext.equals("bmp"))
        flag=true;
    return flag;
}
 boolean isPdf(String ext)  //document file
 {
     boolean flag=false;  
 /*  You can put  your required extension to upload only required file type  */
     if(ext.equals("pdf"))
         flag=true;
     return flag;
 }
 boolean checkNone(String ext)  //allow all file type
 {     
     return true;
 }
        
}
