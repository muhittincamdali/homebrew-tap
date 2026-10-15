class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.2/sizeledger-0.1.2-macos-universal.tar.gz"
    sha256 "fabd501c0ad3393ff0233569dabe4d7de712e2c193f887d2eb70efc620c850e2"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.2/sizeledger-0.1.2-linux-x86_64.tar.gz"
    sha256 "115bbfbdd095b2d227fc35fb7844cb6517d972d038be78e1f3dde09267a29af3"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.2/sizeledger-0.1.2-linux-aarch64.tar.gz"
    sha256 "5400fab1cf0bea486da7ed74f00c2944f40a1eab12cbd0dffa3ceed8e3f741de"
  end

  def install
    bin.install "sizeledger"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sizeledger --version").strip
    (testpath/"Demo.app/Demo").write "x" * 5000
    output = shell_output("#{bin}/sizeledger analyze #{testpath}/Demo.app --format json")
    assert_match "\"bytes\" : 5000", output
  end
end
