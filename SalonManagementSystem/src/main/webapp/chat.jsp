<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
if(request.getAttribute("messages") == null)
{
    response.sendRedirect("ChatHistoryServlet?userId=" 
        + request.getParameter("userId")
        + "&therapistId=" + request.getParameter("therapistId")
        + "&role=" + request.getParameter("role"));
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Live Chat</title>

<style>
body{
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    margin: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* ================= HEADER ================= */
.header {
    background: linear-gradient(135deg, #e3f2fd, #bbdefb, #90caf9);
    padding: 20px 35px;
    color: #1565c0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 8px 32px rgba(144, 202, 249, 0.6);
    border-bottom: 3px solid rgba(255, 255, 255, 0.5);
}

.logo {
    font-size: 28px;
    font-weight: bold;
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo::before {
    content: "💇";
    font-size: 30px;
}

.nav {
    display: flex;
    gap: 10px;
}

.nav a {
    text-decoration: none;
    padding: 10px 20px;
    font-weight: 600;
    color: #1565c0;
    border-radius: 8px;
    border: 2px solid rgba(21, 101, 192, 0.3);
    background: rgba(255, 255, 255, 0.7);
    transition: 0.3s;
}

.nav a:hover {
    background: white;
    border-color: #1565c0;
}

.nav a.active {
    background: #1565c0;
    color: white;
}

/* ================= CENTER CONTENT ================= */
.main-content{
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* ================= CHAT CONTAINER ================= */
.chat-container{
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.2);

    width: 400px;      
    height: 400px;    

    display: flex;
    flex-direction: column;
    margin-top: 40px;  
}

.chat-container h2{
    text-align: center;
    margin-bottom: 15px;
}

/* Chat Box */
#chatBox{
    height: 400px;
    border: 1px solid #ddd;
    background: #f9f9f9;
    overflow-y: auto;
    padding: 10px;
    border-radius: 10px;
    margin-bottom: 10px;
}

/* My Message */
.me{
    background:#4CAF50;
    color:white;
    padding:8px 12px;
    margin:6px 0;
    border-radius:15px;
    width:fit-content;
    margin-left:auto;
    max-width:70%;
}

/* Other Message */
.other{
    background:#e4e6eb;
    padding:8px 12px;
    margin:6px 0;
    border-radius:15px;
    width:fit-content;
    max-width:70%;
}

/* Input Area */
.input-area{
    display: flex;
    gap: 8px;
}

#msg{
    flex: 1;
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
    outline: none;
}

button{
    padding:10px 20px;
    background:#4CAF50;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

button:hover{
    background:#45a049;
}

/* ================= FOOTER ================= */
.footer {
    margin-top: 40px;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(240, 249, 255, 0.9));
    text-align: center;
    padding: 35px 20px;
    color: #333;
    position: relative;
    backdrop-filter: blur(10px);
}

.footer::before {
    content: "";
    display: block;
    height: 4px;
    background: linear-gradient(90deg, #00bcd4, #00acc1, #26c6da, #4dd0e1);
    margin-bottom: 20px;
}

.footer-text {
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 5px;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    letter-spacing: 0.3px;
    color: #0097a7;
}

.footer-subtext {
    font-size: 12px;
    color: #555;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    font-weight: 400;
}

</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <div class="logo">Beauty Hub</div>
    <div class="nav">
        <a href="#">Home</a>
        <a href="UserDashboard.jsp">Back to UserDashboard</a>
        <a href="TherapistDashboard.jsp">Back to TherapistDashboard</a>
    </div>
</div>

<!-- CENTERED CHAT -->
<div class="main-content">
    <div class="chat-container">

        <h2>Live Chat</h2>

        <div id="chatBox">
        <%
        List<String[]> oldMsgs = (List<String[]>) request.getAttribute("messages");
        String role = request.getParameter("role");

        if(oldMsgs != null){
            for(String[] m : oldMsgs){
        %>
            <div class="<%= m[0].equals(role) ? "me" : "other" %>">
                <%= m[2] %>
            </div>
        <%
            }
        }
        %>
        </div>

        <div class="input-area">
            <input type="text" id="msg" placeholder="Type message">
            <button id="sendBtn">Send</button>
        </div>

    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {

const userId = "<%=request.getParameter("userId")%>";
const therapistId = "<%=request.getParameter("therapistId")%>";
const role = "<%=request.getParameter("role")%>";

const myId = (role === "user") ? userId : therapistId;

const conversationId = (userId < therapistId)
        ? userId + "_" + therapistId
        : therapistId + "_" + userId;

const socket = new WebSocket(
"ws://localhost:8080/SalonManagementSystem/chat/" +
conversationId + "/" + role + "/" + myId
);

const box = document.getElementById("chatBox");
const input = document.getElementById("msg");
const sendBtn = document.getElementById("sendBtn");

// Scroll to bottom on load
box.scrollTop = box.scrollHeight;

socket.onmessage = e => {
    const data = JSON.parse(e.data);

    const div = document.createElement("div");
    div.className = (data.sender === role) ? "me" : "other";
    div.textContent = data.message;

    box.appendChild(div);
    box.scrollTop = box.scrollHeight;
};

sendBtn.onclick = sendMessage;

input.addEventListener("keypress", e=>{
    if(e.key === "Enter") sendMessage();
});

function sendMessage(){
    if(input.value.trim() === "" || socket.readyState !== 1) return;

    socket.send(input.value);
    input.value="";
}
});
</script>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
</footer>

</body>
</html>
