# Auto-cd to /srv/ on SSH servers
set servers everest k2
set hostname_value (set -q hostname; and echo $hostname; or hostname; or cat /proc/sys/kernel/hostname)
if begin set -q SSH_CONNECTION; and contains $hostname_value $servers; end
    cd /srv/
end
