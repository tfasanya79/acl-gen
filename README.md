# acl-gen.

A firewall rule and ACL syntax translator. Build a rule once using a simple form, and see the equivalent Cisco IOS ACL, pfSense rule, iptables command, AWS Network ACL, and Azure NSG rule generated side by side.

Live at: https://timfas.com/acl-gen/

## What it does

You describe a rule using six fields: action, direction, protocol, source, destination, and port. The tool then generates the same rule in five formats at once:

- Cisco IOS extended access list syntax, including the wildcard mask math
- pfSense rule syntax
- iptables command syntax
- AWS Network ACL syntax (aws ec2 create-network-acl-entry), chosen over Security Groups because NACLs support explicit deny and rule ordering
- Azure NSG syntax (az network nsg rule create), which also supports explicit deny and priority ordering

You can add multiple rules to build a full rule set, reorder them, and see a plain English explanation of what the complete rule set does, including a reminder that most firewalls process rules top to bottom and stop at the first match.

## Catching mistakes before they ship

The tool actively checks the rule set for problems instead of just formatting it:

- Shadowed rule detection flags any rule that is fully covered by an earlier, broader rule and can never be reached on a real device. Reordering or deleting the shadowed rule is suggested inline.
- A packet tester lets you enter a sample source IP, destination IP, protocol, and port, then shows exactly which rule would match it first, or confirms that it would fall through to an implicit deny.
- A shareable link button encodes the full rule set into the URL so a rule set can be sent to someone else or saved for later without any backend or account.
- A download button saves the currently viewed syntax as a plain text file.

## Why this matters

Anyone working across more than one platform, for example a Cisco switch in one place, a Linux firewall in another, and a cloud environment in a third, ends up mentally translating the same access rule between different syntaxes by hand. Getting a wildcard mask backwards on a Cisco ACL, forgetting that pfSense and iptables think about direction differently, or not noticing that a broad rule silently blocks a more specific one placed after it, are easy and common mistakes. This tool removes the translation step, generates five formats side by side, and actively flags the kind of rule ordering mistakes that are hard to spot by eye.

## Tech stack

Vanilla HTML, CSS, and JavaScript. No backend, no build step, no framework. All the parsing, translation, shadow detection, and packet matching logic runs in the browser.

## Running it yourself

Open index.html in a browser, no server required.

## Part of a portfolio

This is one of several small, single purpose web tools built for a public portfolio. See the full list at https://timfas.com/