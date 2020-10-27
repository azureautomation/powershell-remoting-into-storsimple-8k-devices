Powershell remoting into StorSimple 8k devices
==============================================

            

This script will start a remote Powershell session to a StorSimple 8k series device. For more information on
[StorSimple Hybrid Cloud Storage see this link](https://superwidgets.wordpress.com/storsimple/). 


Requirements:


  *  The IP address of your device Data0 interface. 
  *  The administrative password of your device. This can be viewed/changed in the Azure Management Interface under the device node/Configure link on top/right

  *  Remote Management should be turned on on the device. This can be viewed/set from the same Azure Management Interface page above.

Once you have an open session you can run commands against it either interacrtively by using the Enter-PSSession cmdlet, or the Invoke-Command cmdlet as in:

 
![Image](https://github.com/azureautomation/powershell-remoting-into-storsimple-8k-devices/raw/master/StorSimple-17361a.jpg) 

        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
