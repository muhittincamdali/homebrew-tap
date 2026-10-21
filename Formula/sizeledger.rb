class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.10/sizeledger-0.1.10-macos-universal.tar.gz"
    sha256 "9f1158a7242c1aa528790095dede79202d6dd4d529282d9f12468e68b6615d35"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.10/sizeledger-0.1.10-linux-x86_64.tar.gz"
    sha256 "a2e28a1b0821aa89f87410be67e27e955838e7b17abbc301a7efd3b5e91ef03b"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.10/sizeledger-0.1.10-linux-aarch64.tar.gz"
    sha256 "835d675f80e6f9daf27c5e930d7556b7a988d658e7528e3b85ad20bac7c735c2"
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
