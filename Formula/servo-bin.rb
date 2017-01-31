# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ServoBin < Formula
  desc "Servo, the Parallel Browser Engine Project (binary version)"
  homepage "http://servo.org"
  url "https://download.servo.org/nightly/macbrew/2017-01-31T02-24-54Z-servo.tar.gz"
  version "2017.01.31"
  sha256 "99106e661e91ed6d78f77ad0240fb4d00a8926ec28c49cb135f83dc28e5d99d6"

  bottle :unneeded

  def install
    prefix.install "bin", "libexec", "resources"
  end

  test do
    system bin/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
