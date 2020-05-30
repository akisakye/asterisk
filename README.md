
# Docker CentOS7 and Asterisk

This repo contains a Dockerfile to build a CentOS7+Asterisk image.
What is inside;

 - Asterisk 
 - CentOS7 
 - SIP support 
 - PJSIP support

### Usage
Before you begin, it would be a good idea to have docker installed ;-)

	$ docker pull akisakye/asterisk
	$ docker run -d -p5060:5060/udp akisakye/asterisk
	
You do realise that with the container running, you need to edit your config files to make this container useful. I suggest mapping the config folder to a local folder making it easy to work with the files.

	$ docker run -d -v asterisk:/etc/asterisk -p5060:5060/udp akiskaye/asterisk

Your SIP client should be able to register at port 5060/udp

You can now run "docker volume inspect" to find out where your mountpoint is.

	$ docker volume inspect asterisk

Result should be something like this;

```
[
    {
        "CreatedAt": "2020-05-30T09:29:17Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/asterisk/_data",
        "Name": "asterisk",
        "Options": null,
        "Scope": "local"
    }
]
```
### Editing config files

If you head to the mountpoint above, you can edit sip.conf, extensions.conf etc and reload asterisk thereafter

	docker exec -it [container_name] asterisk -x "dialplan reload"

Also, to enter the container to snoop around

	docker exec -it [container_name] bash

### Shoutout
Want to thank tucny.com for providing RPMs for Asterisk.

### Feedback
alex [at] infraops.io

