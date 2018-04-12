#!/bin/sh -eux
sshd_config="/etc/ssh/sshd_config"

sed -i -e '$a\' "$sshd_config"

usedns="UseDNS no"
if grep -q -E "^[[:space:]]*UseDNS" "$sshd_config"; then
    sed -i "s/^\s*UseDNS.*/${usedns}/" "$sshd_config"
else
    echo "$usedns" >>"$sshd_config"
fi

gssapi="GSSAPIAuthentication no"
if grep -q -E "^[[:space:]]*GSSAPIAuthentication" "$sshd_config"; then
    sed -i "s/^\s*GSSAPIAuthentication.*/${gssapi}/" "$sshd_config"
else
    echo "$gssapi" >>"$sshd_config"
fi

