class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  version "0.1.0"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.0/sizeledger-0.1.0-macos-universal.tar.gz"
    sha256 "9c9fc536276b0eec0042af155e3122d5c65cb5ad59633ff9c82462da5b2c2cbb"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.0/sizeledger-0.1.0-linux-x86_64.tar.gz"
    sha256 "116df46d3a5d50ca488274da29b916594fe96d9d2204d7f2710b0130c3e04993"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.0/sizeledger-0.1.0-linux-aarch64.tar.gz"
    sha256 "c2002b9adc8c97d2fe81a63b3df89598783e9d9c3aacaf1beea6cf09516a9924"
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
