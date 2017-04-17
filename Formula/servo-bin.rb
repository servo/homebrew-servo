# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ServoBin < Formula
  desc "Servo, the Parallel Browser Engine Project (binary version)"
  homepage "http://servo.org"
  url "https://download.servo.org/nightly/macbrew/2017-04-17T01-08-48Z-servo.tar.gz"
  version "2017.04.17"
  sha256 "6b8aed4d9e87e6448b2ccd2705fe9e9fad65ca4007854b793b38a501078f5ec5"

  bottle :unneeded

  def install
    prefix.install "bin", "libexec", "resources"
  end

  test do
    system bin/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
