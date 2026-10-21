class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.8/sizeledger-0.1.8-macos-universal.tar.gz"
    sha256 "94b340eb6a6c372862a1281f0b2bf7b1da8110a64df2a13cede9cbbe96c3ee99"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.8/sizeledger-0.1.8-linux-x86_64.tar.gz"
    sha256 "dc2ad5b5449ccd0130914b6b1791e28cbae2691920ccc0249e85698311d34f6a"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.8/sizeledger-0.1.8-linux-aarch64.tar.gz"
    sha256 "b7138ec0956b0d0af83db22884ccc172ee702599215a00f90953e51ff5b5ee34"
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
