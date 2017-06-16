Log into Amazon EC2 and launch an?Ubuntu Server 14.04?instance with?instance type?m4.large. (You can choose another instance type instead, but I recommend that it have at least 8 GB of RAM for this installation step.)
I recommend creating a new security group called "zcash" that you'll use with all of your instances. To that security group, add an?inbound rule?with type:?Custom TCP Rule, Protocol:?TCP, Port Range:?18232, and Source:?Anywhere (0.0.0.0/0). This will allow other nodes to connect to your node.

