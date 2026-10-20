class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.7/sizeledger-0.1.7-macos-universal.tar.gz"
    sha256 "876ca7f53a449e69ea65b1c807d0a9006d80fed3e6d98655fac1e41aaf80fc52"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.7/sizeledger-0.1.7-linux-x86_64.tar.gz"
    sha256 "77c06b872cd9f7198c4f160804d728f1ad16b2daf4846a043a7de69465c36785"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.7/sizeledger-0.1.7-linux-aarch64.tar.gz"
    sha256 "190bfeb4f362de2ca5c40d16c7bcbd160e5f9dceca53a48c4b68c11c620649c4"
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
