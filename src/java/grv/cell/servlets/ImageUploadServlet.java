/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package grv.cell.servlets;

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

public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		writer.write("call POST with multipart form data");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//response.setContentType("application/json");
        
            if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

            String folderName="uploadedfiles";
                String uploadPath = getServletContext().getRealPath("/").replace("\\", "/")+"/"+folderName+"/";
              //  System.out.println(uploadPath);
               

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {
                                    //System.out.println(item.getName());
                                    String fileName = item.getName();
                                    if(fileName.contains("\\"))
                                        fileName= fileName.substring(fileName.lastIndexOf("\\")+1);
                                   
                                    String ext = fileName.substring(fileName.lastIndexOf(".")+1);
                                    if(checkImage(ext)==true)
                                    {
                                    //Random rnd =new Random();
                                    //int no=rnd.nextInt(10);
                                    long currentTimeMillis = System.currentTimeMillis();
                                    fileName = currentTimeMillis+"."+ext;

					File file = new File(uploadPath, fileName);
                                    

                                        //File file = File.createTempFile(fileName, "");
					item.write(file);
	 String size = formatSize(item.getSize());
	writer.write("{\"name\":\""+ fileName + "\",\"size\":\"" + size + "\",\"type\":\"" + item.getContentType() + "\",\"url\":\"" + folderName+"/"+ fileName + "\"}");
//String output="{\"name\":"picture.jpg","size":902604,"url":"\/jQuery-File-Upload\/example\/files\/picture.jpg","thumbnail":"\/jQuery-File-Upload\/example\/thumbnails\/picture.jpg";
//                                        new JSONWriter(response.getWriter())
//                                          .object()
//                                            .key("name")
//                                            .value(fileName)
//                                            .key("type")
//                                            .value(item.getContentType())
//                                            .key("size")
//                                            .value(item.getSize())
//                                          .endObject();
//                                        response.flushBuffer();
                                        
					break; // assume we only get one file at a time
                                    }
                                    else
                                    {
                                       writer.write("{\"name\":\" Invalid File \"}");
 
                                    }
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
                finally {
			writer.close();
		}

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

 boolean checkImage(String ext)
{
    boolean flag=false;
    ext = ext.toLowerCase();
    if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("gif") || ext.equals("bmp"))
        flag=true;
    return flag;
}
        
}