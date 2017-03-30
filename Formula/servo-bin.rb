# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ServoBin < Formula
  desc "Servo, the Parallel Browser Engine Project (binary version)"
  homepage "http://servo.org"
  url "https://download.servo.org/nightly/macbrew/2017-03-30T01-22-33Z-servo.tar.gz"
  version "2017.03.30"
  sha256 "fb2e4fe9e16cec6d5a2d02203b1c4c9a2bb0af5a771f6b9da1ab9099dac77929"

  bottle :unneeded

  def install
    prefix.install "bin", "libexec", "resources"
  end

  test do
    system bin/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
