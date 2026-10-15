class Sizeledger < Formula
  desc "Show where every megabyte of an iOS app comes from"
  homepage "https://github.com/muhittincamdali/sizeledger"
  license "MIT"

  # Homebrew's style rules do not allow url inside on_macos/on_linux blocks; OS and CPU checks
  # pick the archive instead.
  if OS.mac?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.4/sizeledger-0.1.4-macos-universal.tar.gz"
    sha256 "27dbf7f2f0db74161298f1ab48f2cd818ccd561474f99221fad61735a896572a"
  elsif Hardware::CPU.intel?
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.4/sizeledger-0.1.4-linux-x86_64.tar.gz"
    sha256 "398562c40b1a228d401d03fcd5b3d0b7d1bfdf2bfa3a81cc5a017ed89da4dad5"
  else
    url "https://github.com/muhittincamdali/sizeledger/releases/download/v0.1.4/sizeledger-0.1.4-linux-aarch64.tar.gz"
    sha256 "e32b666cf53fdea472507b9c770b42f829a21d9abd9db75e053b830381c5e10f"
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
