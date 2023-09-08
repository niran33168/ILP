# ILP

#Require lib
pip install robotframework
pip install robotframework-appiumlibrary==2.0.0    
pip install robotframework-excellib==2.0.1    
pip install robotframework-jsonlibrary==0.3.1  
pip install robotframework-selenium2library==3.0.0    
pip install robotframework-seleniumlibrary==6.0.0

Python2
pip install robotframework-excellib==2.0.1
Python3
pip2 install robotframework-excellib==2.0.1

# Run Robot
For run robot must use 2 terminal 

1 terminal for run appuim server by use command 
$ appium --base-path=/wd/hub --relaxed-security 

And another terminal you must to CD in fasttrack-automate-ilp 
$ cd fasttack-automate-ilp  
user_path/fasttack-automate-ilp 

!!! Must to have application Fast Track ILP !!!
For test Vertfy EKYC run 
$ robot -v ENV:{OS_system} -v devicesName:{device_name} TestScript/VerifyEKYC.robot   

For example if want to run script in sumsung GalaxyTabS6 
Start by connect GalaxyTabS6 to computer,Can connect by use cable or open SDK simulater.
And run code 
{OS_system} is android 
{device_name} is GalaxyTabS6 
$ robot -v ENV:android -v devicesName:GalaxyTabS6 TestScript/VerifyEKYC.robot  

for IOS 
$ robot -v ENV:ios -v devicesName:Ipad9 TestScript/VerifyEKYC.robot 

#Run Robot Web
robot -v ENV:rv -v Browser:chrome TestScript/Quotation.robot

#Dry Run Check fail
robot --dryrun TestScript/MobileQuotation.robot