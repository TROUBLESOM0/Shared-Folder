# Shared-Folder-Setup

This is a batch script (.bat) to automatically configure a Windows 10/11 PC to have access to the /SHARED/ folder on PC: CI-D022.

Must setup a user and access permissions on 'CI-D022' before running this script:
- Create User in Control Panel.<br/>
  The New User can have whatever name you want... It doesn't really matter, but it needs to be something you will remember<br/>
  For the password, I used Open1234.<br/>For all the security questions, I just typed in "ROV".<br/>
  *** Should be obvious, But DO NOT use a Microsoft Account or email to create the user ***<br/>
  *** We are going to handle our own security and permissions,,, because ... Fuck Microsoft ! ***<br/><br/>
![adduser](https://github.com/TROUBLESOM0/Shared-Folder/blob/152079b0ae62bf6cb92f31daddb9269c23615d5f/.images/AddUser.PNG)
- Goto the root of /SHARED/ folder, select Properties, goto Security tab, goto Advanced.<br/><br/>
![advanced](https://github.com/TROUBLESOM0/Shared-Folder/blob/152079b0ae62bf6cb92f31daddb9269c23615d5f/.images/Advanced.PNG)
- Then, select "Add" and add the User and set permissions.  Ensure You select "Check Names" to verify you typed it correctly.<br/>
- To be able to EDIT, you will want to just allow "FULL CONTROL" (it's too difficult to try and tailor it down from here)<br/>
- To be able to ONLY READ, you will want to only allow:<br/>
     - Traverse<br/>
     - List Folders<br/>
     - Read Attributes<br/>
     - Read Extended Attributes<br/>
     - Read Premissions<br/><br/>
![permissions](https://github.com/TROUBLESOM0/Shared-Folder/blob/152079b0ae62bf6cb92f31daddb9269c23615d5f/.images/Permissions.PNG)
- DO NOT click the box labeled "Only apply these permissions to objects and /or containers within this container" - it will only give access to first level of sub-folders.
- Click "Apply" and it should start updating the folder permissions (which should take a while).
- At This Point, go back to root of /SHARED/ and back into "Properties".
- Select the Security tab and click on "Edit..."
- Select "Add" and enter name.<br/><br/>
![advpermissions](https://github.com/TROUBLESOM0/Shared-Folder/blob/152079b0ae62bf6cb92f31daddb9269c23615d5f/.images/AdvPermissions.PNG)
<br/><br/>
- Ensure You select "Check Names" to verify you typed it correctly.
- You should see the new user show up.  Here, you can confirm permissions are configured correctly.
<br/><br/><br/>
Now, Just edit the "Setup_Shared.bat" script with the New User.<br/>
You will want to use a good Editor.  I used Code Writer from Actipro...downloaded from Microsoft Store.<br/>
You should be able to get an idea of the template used and how to add the New User name.<br/>
There are 2-(two) places you will need to add some lines of the code for the script to work correctly.
