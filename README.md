# AD-BadScripts

This repo contains many scripts that help you make your vulnerable ActiveDirectory lab 

[![Discord](https://img.shields.io/discord/716165691383873536?style=plastic&logo=discord)](https://discord.gg/5y3Z4QkF)
[![LinkedIn](https://img.shields.io/badge/Linkedin-blue?style=plastic&logo=linkedin&logoColor=#0A66C2)](https://www.linkedin.com/in/fadymoheb/)
[![Blog](https://img.shields.io/badge/Blog-Read%20me-orange?style=plastic&logo=wordpress)](https://n1nj10.gitbook.io/n1nj10/)
[![Twitter Follow](https://img.shields.io/twitter/follow/discoverscripts.svg?style=social&label=Follow)](https://twitter.com/FadyMo7eb)

<img src="https://i.pinimg.com/originals/c7/3e/f0/c73ef0fcaee7bd569f45941529a240b8.jpg" align="center" width="1000">

<img src="https://user-images.githubusercontent.com/71278733/172068867-ba3de80b-dc63-44c0-a31b-0ba74c244163.gif" align="center" width="1000" height="3">

<h1>The index </h1>

- [Winrm-Ison](https://github.com/N1NJ10/AD-BadScripts/blob/main/Winrm-Ison.ps1)
  
This script checks if the Winrm service is on your PC or not if not it will turn it on

- [BadService-Permissions](https://github.com/N1NJ10/AD-BadScripts/blob/main/BadService-Permissions.ps1)
  
This script Creates a bad permission service that you can exploit it

- [Bad-WDigest](https://github.com/N1NJ10/AD-BadScripts/blob/main/Bad-WDigest.ps1)

 This script checks if the WDigest reg key exists or not if not it will add it to 1 for more info click <a href="https://adsecurity.org/?page_id=1821">here</a>

- [Bad-SSP](https://github.com/N1NJ10/AD-BadScripts/blob/main/Bad-SSP.ps1)
  
This script with the help of <a href="https://github.com/ParrotSec/mimikatz/tree/master/x64">mimilib.dll</a> can set the SSP to show you the clear Passwords when any user logoff and login again just try it in the DC 

- [Never-ScreenOff](https://github.com/N1NJ10/AD-BadScripts/blob/main/Never-ScreenOff.ps1)

This script prevents the screen from turning off when your computer is idle

- [Rubeus_Ticket_Space_Remover](https://github.com/N1NJ10/AD-BadScripts/blob/main/Rubeus_Ticket_Space_Remover.ps1)

This script i made it for every time i get the ticket from the rubues i need to remove the padding and spaces manual so this scritp mad it for me it just need one argument -f with the path of the file and it will generate the .kirbi file for me 

ex: Rubeus_Ticket_Space_Remover.ps1 -f my_ticket.txt
