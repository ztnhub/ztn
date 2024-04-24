# DNS Leak Testing

DNS Leak Testing is a free tool for the internet allowing end users to test their DNS activity to see if their VPN or Proxy service is leaking DNS requests, effectively unmasking end user's privacy and security.

## How it Works

DNS (Domain Name System) is responsible for translating human-readable domain names into IP addresses that computers can understand. When you use a VPN or proxy service, your DNS queries should be routed through the secure network provided by the service. However, sometimes these services may fail to properly route DNS queries, resulting in DNS leaks where your DNS requests are sent through your ISP's servers instead of the VPN/proxy servers. This can potentially expose your online activities to your ISP or other third parties.

DNS Leak Testing tool helps users identify whether their DNS queries are leaking by performing DNS resolution tests and comparing the results with the expected DNS server provided by the VPN or proxy service. The main use case here is to be able to verify that the DNS requests are being sent through the secure network provided by the VPN or proxy service, and not through the ISP's servers.

## How to Use

Using DNS Leak Testing tool is simple:

1. Connect to your VPN or proxy service.
2. Visit the DNS Leak Testing website.
3. Initiate the DNS leak test.
4. Review the results to see if any DNS leaks are detected.

If DNS leaks are detected, you should take necessary actions to address the issue, such as configuring your VPN or proxy settings properly or using alternative DNS servers.

## Features:

In this folder, we will collect some tools and scripts used to verify that your DNS is not leaking. The tools will be written in different languages and will be able to run on different operating systems.


## Online Resources and Links:

Here are some online resources and links for DNS leak testing services:

1. **DNSLeakTest.com**: [DNSLeakTest.com](https://www.dnsleaktest.com/) provides a comprehensive DNS leak test tool along with educational resources on DNS leaks and online privacy.
   
2. **IPLeak.net**: [IPLeak.net](https://ipleak.net/) offers a suite of online privacy testing tools including DNS leak tests, IP address checks, and WebRTC leak tests.

3. **DNSleak.com**: [DNSleak.com](https://dnsleak.com/) provides a simple yet effective DNS leak test tool with clear instructions on how to interpret the results.

4. **Perfect Privacy DNS Leak Test**: [Perfect Privacy DNS Leak Test](https://www.perfect-privacy.com/dns-leaktest/) offers a specialized DNS leak test tool designed to detect and prevent DNS leaks for users of their VPN service.

5. **OpenDNS Resolver Test**: [OpenDNS Resolver Test](https://www.opendns.com/support/diagnostic/) allows users to test the security and reliability of their DNS resolver, helping to identify potential leaks or vulnerabilities.

These resources can assist you in thoroughly testing your DNS activity and ensuring your online privacy and security while using VPN or proxy services.

## How can I fix a DNS leak?
The solution is to ensure that once connected to the VPN, you are using ONLY the DNS server/s provided by the VPN service.