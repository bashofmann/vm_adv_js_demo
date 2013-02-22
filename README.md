With this Vagrant VM you can try out the demo application of my Advanced JavaScript talk.
=========================================================================================

You can find the slides at:
https://speakerdeck.com/bastianhofmann

You can find the demo code at:
https://github.com/bashofmann/adv_js_demo

Setting up the VM
-----------------

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

Create a keys.js file based on keys.js.sample with keys for

* dev.status.net
  http://dev.status.net:8080/index.php/settings/oauthapps
  Callback URL needs to be http://dev.jsmashup.net:3000/callback.html
* embed.ly
  http://embed.ly/
* Wolfram|Alpha
  http://products.wolframalpha.com/developers/

Start the application

    mrt

To try out the WebRTC feature with Peer.js you additionally have to start up a peer.js server on your host machine:

Install node.js with npm on you host machine (See http://nodejs.org/)

Install peer.js (See also http://peerjs.com/)

    npm install peer

Create a peer.js server with

    var PeerServer = require('peer').PeerServer;
    var server = new PeerServer({ port: 9006 });
