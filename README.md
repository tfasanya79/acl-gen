# acl-gen.

A firewall rule and ACL syntax translator. Build a rule once using a simple form, and see the equivalent Cisco IOS ACL, pfSense rule, and iptables command generated side by side.

Live at: https://aipal-staging.cloud/acl-gen/

## What it does

You describe a rule using six fields: action, direction, protocol, source, destination, and port. The tool then generates the same rule in three formats at once:

- Cisco IOS extended access list syntax, including the wildcard mask math
- pfSense rule syntax
- iptables command syntax

You can add multiple rules to build a full rule set, reorder them, and see a plain English explanation of what the complete rule set does, including a reminder that most firewalls process rules top to bottom and stop at the first match.

## Why this matters

Anyone working across more than one platform, for example a Cisco switch in one place and a Linux firewall in another, ends up mentally translating the same access rule between different syntaxes by hand. Getting a wildcard mask backwards on a Cisco ACL, or forgetting that pfSense and iptables think about direction differently, are easy and common mistakes. This tool removes that translation step and shows all three side by side so the logic can be checked at a glance.

## Tech stack

Vanilla HTML, CSS, and JavaScript. No backend, no build step, no framework. All the parsing and translation logic runs in the browser.

## Running it yourself

Open index.html in a browser, no server required.

## Part of a portfolio

This is one of several small, single purpose web tools built for a public portfolio. See the full list at https://aipal-staging.cloud/portfolio/