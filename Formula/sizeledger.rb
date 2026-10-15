class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.5/sizeledger-0.1.5-macos-universal.tar.gz"
    sha256 "5c6118bb00ee8a76d53356d85595c8c291f28d6181e4ba87aa91c7e3e9ace0fa"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.5/sizeledger-0.1.5-linux-x86_64.tar.gz"
    sha256 "654d2e1897ac7b91f35f3bf903dce2b78d02fe9cb5d00f5fe427eaa07e6954f3"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.5/sizeledger-0.1.5-linux-aarch64.tar.gz"
    sha256 "17f77f4d9d7ba13a692aa189fd21949e5e4387431e094801decafaef3cc8ea98"
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
