
     ___           ___           ___           ___           ___           ___           ___     
    /\__\         /\__\         /\__\         /\  \         /\  \         /\  \         /\__\  	  
   /:/ _/_       /:/ _/_       /:/ _/_        \:\  \       /::\  \       |::\  \       /:/ _/_  
  /:/ /\  \     /:/ /\__\     /:/ /\__\        \:\  \     /:/\:\  \      |:|:\  \     /:/ /\__\
 /:/ /::\  \   /:/ /:/ _/_   /:/ /:/ _/_   _____\:\  \   /:/ /::\  \   __|:|\:\  \   /:/ /:/ _/_
/:/_/:/\:\__\ /:/_/:/ /\__\ /:/_/:/ /\__\ /::::::::\__\ /:/_/:/\:\__\ /::::|_\:\__\ /:/_/:/ /\__\
\:\/:/ /:/  / \:\/:/ /:/  / \:\/:/ /:/  / \:\~~\~~\/_ / \:\/:/  \/_ / \:\~~\  \/_ / \:\/:/ /:/  /
 \::/ /:/  /   \::/_/:/  /   \::/_/:/  /   \:\  \        \::/__/       \:\  \        \::/_/:/  /
  \ _/:/  /     \:\/:/  /     \:\/:/  /     \:\  \        \:\  \        \:\  \        \:\/:/  /  
    /:/  /       \::/  /       \::/  /       \:\__\        \:\__\        \:\__\        \::/  /   
    \/__/         \/__/         \/__/         \/__/         \/__/         \/__/         \/__/  v1.0

---------------------------------------------------xxxx------------------------------------------------
---------------------------------------------------xxxx------------------------------------------------
                                                Created   By: tinxpreter                                                     
---------------------------------------------------xxxx------------------------------------------------
---------------------------------------------------xxxx------------------------------------------------

This is a lazy man's tool for CNAME lookups. It's technically a wrapper for the **dig** tool.
Initially, I opted for the **hosts** tool, but that tool wasn't recursive, when a domain has
2 CNAMEs (or more), The hosts tool only shows one. Hence why I went for _dig_.

**Usage:**

Single Domain CNAME lookup:

    ./seename.sh -d <domain name>
eg  ./seename.sh -d blog.example.com


A list of domains CNAME lookup:

    ./seename.sh -L <domain file>
eg  ./seename.sh -L domains.txt

Use the -h option for help

./seename.sh -h

Included is a file(_testdomains.txt_) containing a list of domains for testing purposes.
