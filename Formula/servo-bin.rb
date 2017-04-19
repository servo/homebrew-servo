# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ServoBin < Formula
  desc "Servo, the Parallel Browser Engine Project (binary version)"
  homepage "http://servo.org"
  url "https://download.servo.org/nightly/macbrew/2017-04-19T01-10-53Z-servo.tar.gz"
  version "2017.04.19"
  sha256 "0f813f872ccdaa8b6e24243f8de820b75f95d5b09d174d435493ad4cfdfe63b9"

  bottle :unneeded

  def install
    prefix.install "bin", "libexec", "resources"
  end

  test do
    system bin/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
