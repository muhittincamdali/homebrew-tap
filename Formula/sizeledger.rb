class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.6/sizeledger-0.1.6-macos-universal.tar.gz"
    sha256 "a7e644880a4a5437bf6e7b39d822b4fa863d384d29452f30fd0ba8480e5735c7"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.6/sizeledger-0.1.6-linux-x86_64.tar.gz"
    sha256 "42d3becc166ea029a6042408fd5125a2a6083a330c6753a53f06e92266209e12"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.6/sizeledger-0.1.6-linux-aarch64.tar.gz"
    sha256 "2b5f4456da1d9e8d4eb2e5b00b1762db9de400c8fcf6950c6d5978b1474eb650"
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
