homebrew-servo
===============

Homebrew formula for [Servo](http://servo.org).

## Usage

### Install pre-built binary (nightly builds):

    $ brew install servo/servo/servo-bin
    $ servo http://servo.org # See `servo --help`

To upgrade:

    $ brew update
    $ brew upgrade servo-bin

Switch version (useful to find regression window):

    $ brew switch servo-bin YYYY.MM.DD

Previously installed binaries are available in `/usr/local/Cellar/servo-bin/`.

### Build from source:

    $ brew tap servo/servo
    $ brew install --HEAD servo
    $ servo -w http://servo.org # See `servo --help`

For debug build:

    $ brew install --HEAD --with-debug servo

To upgrade:

    $ brew update
    $ brew reinstall --HEAD servo
