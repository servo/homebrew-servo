class Servo < Formula
  desc "Servo, the Parallel Browser Engine Project"
  homepage "http://servo.org"
  head "https://github.com/servo/servo.git"
  option "with-debug", "debug build"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "python" => :build
  depends_on "cmake" => :build
  depends_on "openssl"

  patch do # FIXME: to remove once PR lands
    url "https://patch-diff.githubusercontent.com/raw/servo/servo/pull/9643.diff"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  resource "virtualenv" do
    url "https://pypi.python.org/packages/source/v/virtualenv/virtualenv-13.1.2.tar.gz"
    sha256 "aabc8ef18cddbd8a2a9c7f92bc43e2fea54b1147330d65db920ef3ce9812e3dc"
  end

  def install
    ENV["OPENSSL_INCLUDE_DIR"] = Formula["openssl"].include

    # Install virtualenv in a temporary directory (anything in the buildpath will eventually be deleted)
    ve_dir = buildpath/"_vedir"
    ENV.prepend_create_path "PYTHONPATH", ve_dir/"lib/python2.7/site-packages"
    resource("virtualenv").stage { system "python", *Language::Python.setup_install_args(ve_dir) }
    ENV.prepend_path "PATH", ve_dir/"bin"

    build_type = "release"
    build_type_arg = "-r"

    if build.with? "debug"
      build_type = "debug"
      build_type_arg = "-d"
    end

    # build
    ohai "Compiling Servo"
    system "./mach", "build", build_type_arg

    # install
    prefix.install "target/#{build_type}/deps"
    prefix.install "target/#{build_type}/servo"
    prefix.install "resources"

    bin.install_symlink prefix/"servo"
  end

  test do
    system prefix/"servo", "-o", "/dev/null", "-x", "http://example.com"
  end
end
