

![image](https://github.com/tinopreter/SeeName/assets/56916261/388989c2-ad3c-453a-bcfb-252795cdc9e4)



---------------------------------------------------xxxx------------------------------------------------


This is a lazy man's tool for CNAME lookups. It's technically a wrapper for the **dig** tool.
Initially, I opted for the **hosts** tool, but that tool wasn't recursive, when a domain has
2 CNAMEs (or more), The hosts tool only shows one. Hence why I went for _dig_.

**Usage:**

Single Domain CNAME lookup:

    ./seename.sh -d <domain name>
eg  _./seename.sh -d blog.example.com_


A list of domains CNAME lookup:

    ./seename.sh -L <domain file>
eg  _./seename.sh -L domains.txt_


**Help Menu:**
Use the -h option for help

    ./seename.sh -h


Included is a file(_testdomains.txt_) containing a list of domains for testing purposes.
