With this Vagrant VM you can try out the demo application of my Advanced JavaScript talk.

You can find the slides at:

You can find the demo code at:

== Setting up the VM ==

First of all you need to install Vagrant, for instructions and more information go to http://www.vagrantup.com/

Clone the git repository and start up the VM with

 vagrant up

You also have to add the hostnames for the app and the status.net installation to you hosts file. This Wikipedia article http://en.wikipedia.org/wiki/Hosts_(file)#Location_in_the_file_system tells you where this file usually is located on your system.

Add the line

 127.0.0.1 dev.status.net dev.jsmashup.net

to this file.

In order for PubSub to work you also have to modify the VMs hosts file located at /etc/hosts. 

Connect to the VM

 vagrant ssh

Edit the host file

 sudo vi /etc/hosts

Add the line

 127.0.1.1 dev.status.net

To startup the application:

Connect to the VM

 vagrant ssh

Go to ~/app

 cd ~/app
Start the application

 mrt

To try out the WebRTC feature with Peer.js you additionally have to start up a peer.js server on your host machine:

Install node.js with npm on you host machine (See http://nodejs.org/)

Install peer.js (See also http://peerjs.com/)

 npm install peer

Create a peer.js server with

 var PeerServer = require('peer').PeerServer;
 var server = new PeerServer({ port: 9006 });
