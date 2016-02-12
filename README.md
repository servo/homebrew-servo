homebrew-servo
===============

Homebrew formula for [Servo](http://servo.org).

## Usage

    $ brew tap paulrouget/servo
    $ brew install --HEAD servo
    $ /usr/local/opt/servo/servo http://google.com
    $ /usr/local/opt/servo/servo --help

For debug build:

    $ brew install --HEAD --width-debug servo

To upgrade:

    $ brew update
    $ brew reinstall --HEAD servo
