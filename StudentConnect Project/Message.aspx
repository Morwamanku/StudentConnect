﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="StudentConnect_Project.Message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MessageStyle.css" rel="stylesheet" />
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
     
 
    
    <form id="form1" runat="server">
         
            <div class="container">
        <div class="leftside">
            <div class="header">
                <%--<div class="userimg">
                    <img src="ProfileImage/Me photo.jpg" class="cover" />
                </div>--%>
                <ul class="nav_icons">
                    <li><ion-icon name="menu-outline"></ion-icon></li>
                    <li>
                        <a href="Dashboard.aspx">
                            <ion-icon name="arrow-back-outline"></ion-icon>
                        </a>
                    </li>

                </ul>
            </div>
            <!--search_bar-->
            <div class="search_chat">
                <div>
                    <input type="text" placeholder="Search or start new chat" />
                  
              </div>
               
            </div>
            <!--chat list-->
            
            <div class="chatlist">
                <asp:Repeater ID="ChataRepeater" runat="server">
                    <ItemTemplate>
                        <div class="block">
                    <div class="imgbox">
                        <asp:ImageButton ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("image") %>' Width="100%" Height="40px"  object-fit="cover" OnClick="Image1_Click"  />
                    </div>
                    <div class="details">
                        <div class="listHead">
                            <h4><asp:Label ID="FirstnameLabel" runat="server"  Text='<%# Eval("Firstname") %>'></asp:Label><asp:Label ID="ConnectConfirmed_IDLabel" runat="server" class="ConnectConfirmed_ID" Text='<%# Eval("ConnectConfirmed_ID") %>'></asp:Label></h4>
                            <p class="time"><asp:Label ID="StudentNumberLabel" runat="server"  Text='<%# Eval("StudentNumber") %>'></asp:Label></p>
                        </div>
                        
                    </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>




        <div class="rightside">
            <div class="Topright">
                <div class="userimage">
                    <asp:FormView ID="FormView1" runat="server">
                        <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="50" />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            <div class="right-container">
                <asp:Repeater ID="InboxRepeater" runat="server">
                <ItemTemplate>
                    <div class="message-wrapper">
                        <div class="message-flex">
                        <div class="message-user">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="50" />
                        </div>
                            <div class="message">
                                <p><asp:Label ID="Messagelabel" runat="server"  Text='<%# Eval("message") %>'></asp:Label> </p>
                            </div>
                        </div>
                
                
            </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>

            <div class="input-text ">
                <asp:Label ID="ConfirmedIDLabel" runat="server" class="ConnectConfirmed_ID" Text='<%# Eval("ConfirmedID") %>'></asp:Label>
                    <div class="message-flex">
             
                        <asp:TextBox ID="messageTextBox" CssClass="text-box" runat="server"></asp:TextBox>
                        
                        
                            <asp:Button ID="SButton" class="submit-button" AutoPostBack="True" runat="server" CausesValidation="True" Text="SEND" OnClick="SButton_Click" />
                            <i class="fa fa-paper-plane" aria-hidden="true"></i>
                        
                    </div>                  


            </div>
                
            
        </div>
    </div>

        <div class="Phoneviewcontainer">
    <div class="header" style="border-radius:0px;">
        <div class="userimg">
            <img src="ProfileImage/Me photo.jpg" class="cover" />
        </div>
        <ul class="nav_icons">
            <li><ion-icon name="menu-outline"></ion-icon></li>
            <li>
                <a href="Dashboard.aspx">
                    <ion-icon name="arrow-back-outline"></ion-icon>
                </a>
            </li>

        </ul>
    </div>
    <!--search_bar-->
    <div class="search_chat">
        <div>
            <input type="text" style="margin-top:10px;" placeholder="Search or start new chat" />
          
      </div>
        
    </div>
    <!--chat list-->
    <div class="Topright" style="border-radius:0px;">
        <div class="userimage">
    <asp:FormView ID="FormView2" runat="server">
        <ItemTemplate>
            <div class="imgbox">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="50" />
            </div>
            <div class="details">
                <div class="listHead">
                    <h4><asp:Label ID="FirstnameLabel" runat="server"  Text='<%# Eval("Firstname") %>'></asp:Label>
                </div>
    
            </div>
             
        </ItemTemplate>
    </asp:FormView>
</div>
    </div>
    
    <div class="chatlist2">
        <asp:Repeater ID="ChataRepeater2" runat="server">
            <ItemTemplate>
                <div class="block" style="width:130px;">
            <div class="imgbox">
                <asp:ImageButton ID="Image2" class="img-fluid" runat="server" ImageUrl='<%# Eval("image") %>' Width="100%" Height="40px"  object-fit="cover" OnClick="Image2_Click"  />
            </div>
            <div class="details">
                <div class="listHead">
                    <h4><asp:Label ID="FirstnameLabel" runat="server"  Text='<%# Eval("Firstname") %>'></asp:Label><asp:Label ID="ConnectConfirmed_IDLabel" runat="server" class="ConnectConfirmed_ID" Text='<%# Eval("ConnectConfirmed_ID") %>'></asp:Label></h4>
                    <p class="time"><asp:Label ID="StudentNumberLabel" runat="server"  Text='<%# Eval("StudentNumber") %>'></asp:Label></p>
                </div>
                
            </div>
        </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <div class="right-container" style="margin:0px;  position: relative; overflow-y:scroll; flex:1;">
        <asp:Repeater ID="InboxRepeater2" runat="server">
            <ItemTemplate>
                <div class="message-wrapper">
                    <div class="message-flex">
                    <div class="message-user">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="50" />
                    </div>
                        <div class="message">
                            <p><asp:Label ID="Messagelabel" runat="server"  Text='<%# Eval("message") %>'></asp:Label> </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
            <div class="input-text ">
                <asp:Label ID="Label1" runat="server" class="ConnectConfirmed_ID" Text='<%# Eval("ConfirmedID") %>'></asp:Label>
                    <div class="message-flex">
 
                        <asp:TextBox ID="messageTextBox2" CssClass="text-box" runat="server"></asp:TextBox>
    
                        <div class="send-btn">
                            <%--<asp:Button ID="SButton" class="submit-button" AutoPostBack="True" runat="server" CausesValidation="True" Text="" OnClick="SButton_Click" />--%>
                            <asp:Button ID="SButton2" class="submit-button" runat="server" Text="Submit" OnClick="SButton2_Click" />
                            <i class="fa fa-paper-plane" aria-hidden="true"></i>
                        </div>
                    </div>                  
            </div>
            
</div>


        
    <script>
        // Get a reference to the chat list items
        var chatListItems = document.querySelectorAll(".chatlist .block");

        // Get a reference to the current chat partner div
        var currentChatPartnerDiv = document.getElementById("currentChatPartner");

        // Function to handle chat list item click
        function handleChatItemClick(item) {
            // Remove the "selected" class from all chat list items
            chatListItems.forEach(function (listItem) {
                listItem.classList.remove("selected");
            });

            // Add the "selected" class to the clicked item
            item.classList.add("selected");

            // Get the name of the chat partner from the clicked item
            var chatPartnerName = item.querySelector(".listHead h4").textContent;

            // Update the displayed name
            currentChatPartnerDiv.textContent = chatPartnerName;
        }

        // Add a click event listener to each chat list item
        chatListItems.forEach(function (item) {
            item.addEventListener("click", function () {
                handleChatItemClick(item);
            });
        });

    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script  src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

        
    </form>
    
</body>
</html>
