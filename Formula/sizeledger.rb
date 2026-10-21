class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.9/sizeledger-0.1.9-macos-universal.tar.gz"
    sha256 "194e1ce911954a586ec9e2e52af314b903d4c0f7e41b4ace156e4e2689197ff9"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.9/sizeledger-0.1.9-linux-x86_64.tar.gz"
    sha256 "d475d7bfaceb59d2d2c3ed70b41abfa0056525bea1cdd5a5b549032d8687f4e0"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.9/sizeledger-0.1.9-linux-aarch64.tar.gz"
    sha256 "f47a3a0f0c06f33eef85cfd821c480b3ceaebb1f2c45563b2b4445a861ca9136"
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
