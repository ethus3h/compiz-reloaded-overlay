# compiz-reloaded-overlay

Repoman Status: [![Build Status](https://travis-ci.org/kajzersoze/compiz-reloaded-overlay.svg?branch=master)](https://travis-ci.org/kajzersoze/compiz-reloaded-overlay)

Ebuilds for compiz-reloaded support in Gentoo

Usage
-----

* Copy `compiz-reloaded.conf` to `/etc/portage/repos.conf/`  :
  `# cd /etc/portage/repos.conf`
  `# wget https://raw.githubusercontent.com/kajzersoze/compiz-reloaded-overlay/master/compiz-reloaded.conf`
* Sync the portage tree with your preferred method (`eix-sync` , `emerge --sync` ..)
* Emerge `compiz-meta`
