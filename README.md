A simplistic DNS configuration backup tool.

# DNS Dumper

We've got a bunch of DNS entries that have been managed by hand.  DNS Dumper
dumps those records into a textual format that can be tracked in version
control without requiring a change in how we manage DNS.

DNS Dumper is inspired by and works with [etckeeper].

## Usage

    [$]> ./dns-dumper.rb > /etc/dns.records

[etckeeper]: http://joeyh.name/code/etckeeper/

