# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class ServoBin < Formula
  desc "Servo, the Parallel Browser Engine Project (binary version)"
  homepage "http://servo.org"
  url "https://download.servo.org/nightly/macbrew/servo-2016-08-20.tar.gz"
  version "2016.08.20"
  sha256 "113c256f41a0be7cf42f30366abc4c39703bcb2ac5e82d51ee66f0438aad168f"

  bottle :unneeded

  def install
    prefix.install "bin", "libexec", "resources"
  end

  test do
    system bin/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
