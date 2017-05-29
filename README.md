# TrEcSim

TrEcSim is a simple-to-use web-aplication that runs either from a localhost or from a server.

## Installation (local host only)

Requirements: 
```
Microsoft Windows (Win 8 or later)
Microsoft Visual Studio
Microsoft SQL Server Management Studio (SSMS [1])
Microsoft SQLExpress
Enable Internet Information Services
```

Steps:
## 1 Clone Repository on local machine

## 2.1 Mapping web-app using Local IIS
    Open VisualStudio as Administrator
    In VisualStudio, right-click the EcoSim project and set it as Startup Project, then
    go to EcoSim -> Properties -> Web -> Servers and select Local IIS
    Enter a desired domain name e.g. www.my-trecsim.local and click Create Virtual Directory
### 2.1.1 
    In IIS, create a new Website and set target directory as %repoPath%/EcoSim
### 2.1.2 
    Click on website and select Edit Bindings option from the right-hand menu
### 2.1.3 
    Add a binding with the domain name chosen in 2.1 and ports (and IP's if need be) for mapping
### 2.1.4
    In C:/Windows/System32/drivers/etc/hosts add lines to forward packets from the website created in 2.1.3 to 127.0.0.1
    e.g. www.my-trecsim.local 127.0.0.1
    ** make sure your are not behind a proxy, or packet forwarding will not work

## 2.2 Mapping web-app using IISExpress
    Open VisualStudio
    In VisualStudio, right-click the EcoSim project and set it as Startup Project, then
    go to EcoSim -> Properties -> Web -> Servers and select IIS Express
    Choose a port and click Create Virtual Directory
    ** whenever you want to run the app in this mode, you have to open VisualStudio and from the top-sde taskbar
    choose Release from the Solution Configuration dropdown (next to the Redo button) and press F5 to start the app
    in your prefered browser (you can open it in any other browser also, once it has started)


## 3 Setting up the database
### 3.1 
    Open SSMS [1] 
    Connect to the .\SQLEXPRESS engine using Windows Authentication
### 3.2 
    From the left-side menu, right-click SQLEXPRESS and Create Database
### 3.3
    Configure your database (choose a name, compression method, database size, log size etc.)
### 3.4 
    Enable the "sa" account for your database (tutorial at: https://www.isunshare.com/sql-server/how-to-enable-sa-account-in-sql-server.html or Google)
### 3.5 
    Open the TrecSim_CreateDB.sql script and run it over your database (you can select the target from a dropdown in the top-side taskbar)

## 4 Connecting the server app to the databse
    In VisualStudio or any text editor, open up ```sh %repoPath%/EcoSim/Web.config ```
    Search for <connectionStrings> tag
    There are 2 lines which need to be modified:
    <add name="DefaultConnection" ...>
    <add name="Entities" ...>

    In each of these lines, search for the "Initial Catalog=" string and change it from "EcoSim" to whichever name you chose
    for your local DB in 3.3. Right after that, change the "password=" value from "123456aA!" to whichever password you chose for
    the "sa" user in 3.4.

## 5 Final steps
    In VisualStudio, select from the top meniu Build -> Clean Solution
    After cleaning is done, select Build -> Rebuild Solution
    ** some build errors may occur due to NuGet packages. these issues may or may not appear on your machine, and may vary from case to case. Due to this, we cannot offer a simple solution to fixing the NuGet errors, but can only point you to forums such as StackOverflow, MSDN, Microsoft Forum etc. where you may find a fix for your particular issue(s)
    
## 6 Running the App
    If you've chosen the Local IIS method (2.1), simply access the domain name you chose in any browser.
    If you've chose the IIS Express (2.2), open VisualStudion and press F5, then wait for the browser window to open. While VisualStudio is running, you can access the corresponding link (localhost:/somePort) in any browser.
