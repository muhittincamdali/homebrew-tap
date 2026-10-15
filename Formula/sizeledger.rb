class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.1/sizeledger-0.1.1-macos-universal.tar.gz"
    sha256 "77fa41c57da28a6b83bf702408787c00a30c2f25cc6447f78c2a12cd54daadb7"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.1/sizeledger-0.1.1-linux-x86_64.tar.gz"
    sha256 "3d9ca2a101f027890dc915512f1ae026a0f8f2be29812af9bcda22919369f2ab"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.1/sizeledger-0.1.1-linux-aarch64.tar.gz"
    sha256 "3f92b12c83be4b29dfcaea1badd4a6153258ce9e6e57c127e2f0c02e7bca810f"
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
