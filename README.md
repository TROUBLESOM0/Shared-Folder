# Shared-Folder-Setup

This is a batch script (.bat) to automatically configure a Windows 10/11 PC to have access to the /SHARED/ folder on PC: CI-D022.

Must setup a user and access permissions on 'CI-D022' before running this script:
- Create User in Control Panel.<br/><br/>
![adduser](https://github.com/TROUBLESOM0/Shared-Folder/blob/db67240f636f3c1045f764f14615714ca1f14103/images/AddUser.PNG)
- Goto the root of /SHARED/ folder, select Properties, goto Security, goto Advanced.<br/>
![advanced](https://github.com/TROUBLESOM0/Shared-Folder/blob/2d9dc1428c251267a25fb81a860e221230638a64/images/Advanced.PNG)
- Then, select "Add" and add the User and set permissions.<br/>
![permissions](https://github.com/TROUBLESOM0/Shared-Folder/blob/2d9dc1428c251267a25fb81a860e221230638a64/images/Permissions.PNG)
- DO NOT click the box labeled "Only apply these permissions to objects and /or containers within this container" - it will only give access to first level of sub-folders.
- Click "Apply" and it should start updating the folder permissions (which should take a while).
