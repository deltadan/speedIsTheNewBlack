@ECHO ON
ECHO Executing Speed Tests
@ECHO OFF 
:: This batch file reveals OS, hardware, and networking configuration.
:: Then executes a series of disk tests.
:: 1. SET the Drive letter below
:: 2. Download diskspd.exe to the drive and create a folder named diskspd
:: 3. run speedisthenewblack.bat from the drive/diskspd folder
:: 4. Once this bat file has run you will have a series of txt files located in the diskspd directory
:: 5. You can review to look for CPU, Latency, IOs, and MBPS
:: 6. There is a sample folder which has some files for your to review along with a XLS to use to document your findings.
:: 7. When reviewing the findings ignore the warm-up run. This is only to create the files that will be used during the test.
TITLE My System Info
ECHO Please wait... Checking system information.
:: Section 1: OS information.
ECHO ============================ >serverinfo.txt
ECHO OS INFO >>serverinfo.txt
ECHO ============================ >>serverinfo.txt
hostname >>serverinfo.txt
systeminfo | findstr /c:"OS Name" >>serverinfo.txt
systeminfo | findstr /c:"OS Version" >>serverinfo.txt
systeminfo | findstr /c:"System Type" >>serverinfo.txt
:: Section 2: Hardware information.
ECHO ============================ >>serverinfo.txt
ECHO HARDWARE INFO >>serverinfo.txt
ECHO ============================ >>serverinfo.txt
systeminfo | findstr /c:"Total Physical Memory" >>serverinfo.txt
wmic cpu get name >>serverinfo.txt
:: Section 3: Networking information.
ECHO ============================ >>serverinfo.txt
ECHO NETWORK INFO >>serverinfo.txt
ECHO ============================ >>serverinfo.txt
ipconfig | findstr IPv4 >>serverinfo.txt
ipconfig | findstr IPv6 >>serverinfo.txt
ECHO Ready to start Disk Speed Tests...this will take some time and saturate your Server.
ECHO Caution should be taken as this will impact local performance and shared storage performance.
ECHO Press Ctrl-C to exit
PAUSE
TITLE DISK SPEED TEST
REM SET THE DRIVE LETTER FOR THE TEST BELOW
F:
cd \diskspd
mkdir results
mkdir done
ECHO ============================
ECHO WARM UP RUN TO CREATE FILES
ECHO ============================
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRndWr_8Fo2_warmup.txt
ECHO ============================
ECHO Test: 8K Random Writes 8 Files Queue Depth of 2
ECHO ============================
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo2_run1.txt
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo2_run2.txt
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo2_run3.txt
ECHO ============================
ECHO Test: 8K Random Reads 8 Files Queue Depth of 2
ECHO ============================
DiskSpd -c80g -w0 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat > F:\diskspd\results\8kRandomReads_8Fo2_run1.txt
DiskSpd -c80g -w0 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat > F:\diskspd\results\8kRandomReads_8Fo2_run2.txt
DiskSpd -c80g -w0 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat > F:\diskspd\results\8kRandomReads_8Fo2_run3.txt
ECHO ============================
ECHO Test: 8K Sequential Reads 8 Files Queue Depth of 2
ECHO ============================
DiskSpd -c80g -w0 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqReads_8Fo2_run1.txt
DiskSpd -c80g -w0 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqReads_8Fo2_run2.txt
DiskSpd -c80g -w0 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqReads_8Fo2_run3.txt
ECHO ============================
ECHO Test: 8K Sequential Writes 8 Files Queue Depth of 2
ECHO ============================
DiskSpd -c80g -w100 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqWrites_8Fo2_run1.txt
DiskSpd -c80g -w100 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqWrites_8Fo2_run2.txt
DiskSpd -c80g -w100 -t8 -si -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kSeqWrites_8Fo2_run3.txt
ECHO ============================
ECHO Test: 8K Random Writes 8 Files Queue Depth of 8
ECHO ============================
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o8 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo8_run1.txt
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o8 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo8_run2.txt
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o8 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat >F:\diskspd\results\8kRandomWrites_8Fo8_run3.txt
