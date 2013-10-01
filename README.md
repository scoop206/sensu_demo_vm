# Sensu Demo VM

A chef repository with a Vagrant setup to spin up a demonstration sensu server.

## Getting Started

```bash
bundler install
vagrant provision
```

## Details

Once the VM is provisioned, the sensu dashboard will be available at:  
http://localhost:28080

A ntpd process check will be setup on provision.  


## Watch Sensu generate an Event

```bash
vagrant ssh
sudo su -
tail -f /var/log/sensu/sensu-client.log
```

While tailing the log, stop the ntpd service:
```bash
service ntpd stop
```

Observe the alert go critical in the log.  
Check the dashboard and you should see an alert.  
Restart the service the Critical even should disappear from the log stream.  
Refreshing the sensu dashboard and the Alert should be gone now.  

