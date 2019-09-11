# Speed Is The New Black

This script was written using the diskspd performance tool from Microsoft to determine the throughput for Azure IaaS VMs.

# DiskSpd: A Robust Storage Performance Tool
A feature-rich and versatile storage performance tool, DiskSpd combines robust and granular IO workload definitions with flexible runtime and output options, creating an ideal tool for synthetic storage subsystem testing and validation.

DiskSpd is a storage performance tool from the Windows, Windows Server and Cloud Server Infrastructure engineering teams at Microsoft. Please visit https://github.com/Microsoft/diskspd for updated documentation.


Diskspd can be downloaded <a href=https://aka.ms/diskspd>here</a>

# Samples
In the Samples repo of this folder is a run that was performed on a Azure IaaS server and some feedback in an XLS.  This is just something that was created on the fly to show you how to leverage the tool.

## Useful switches with diskspd and sample command line
You can find command line and perameters documentation <a href=https://github.com/Microsoft/diskspd/wiki/Command-line-and-parameters>here</a>.

### Sample command
DiskSpd -c80g -w100 -t8 -r -b8k -Sh -L -d120 -o2 Data11.dat Data12.dat Data13.dat Data14.dat Data15.dat Data16.dat Data17.dat Data18.dat > 8kRndWr_8Fo2_run1.txt

#### Most common switches used

-tx = threads per file

-r (random) or -so 

-Sh disable cache

-L latency stats

-b (block size) change to 64 for the log drives

-d duration of test in seconds

-w percent of writes

-o queue

# Note:
Always start with write tests (you must create the files with a write test in order for the stats to be correct.




