class app {

    include nodejs

    exec {
        "meteor":
            command => "/usr/bin/curl https://install.meteor.com | /bin/sh",
            require => Package["curl"],
            onlyif => "/usr/bin/apt-cache policy meteor | grep 'Installed: (none)'";
    } ->
    exec {
        "meteorite":
            command => "/usr/bin/npm install -g meteorite",
            unless => "/usr/bin/npm list -g | /bin/grep 'meteorite'",
            require => Package["nodejs","npm","make","g++"];
    } ->
    exec {
        "clone app":
            command => "/usr/bin/git clone https://github.com/bashofmann/adv_js_demo.git /home/vagrant/app",
            user => vagrant,
            creates => "/home/vagrant/app",
            require => Package["git"];
    } ->
    file {
        '/home/vagrant/git_commit_walker.sh':
            ensure => present,
            owner => vagrant,
            source => "puppet:///modules/app/git_commit_walker.sh";
    }
}