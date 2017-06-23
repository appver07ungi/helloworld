import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet{

public void service(HttpServletRequest request,
         HttpServletResponse response)
             throws ServletException, IOException {

     response.setContentType("text/html");
     PrintWriter out = response.getWriter();

     out.println("<html>");
     out.println("<head>");
     out.println("<title>Hello World</title>");
     out.println("</head>");
     out.println("<body>");
     out.println("<h1>Hello World</h1>");
     out.println("</body>");
     out.println("</html>");

     out.close();
 }
}
