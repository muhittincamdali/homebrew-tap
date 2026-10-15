class Sdkbump < Formula
  desc "Check iOS, Flutter and React Native apps for iOS 27 SDK changes"
  homepage "https://github.com/muhittincamdali/sdkbump"
  url "https://github.com/muhittincamdali/sdkbump/releases/download/v0.1.3/sdkbump-0.1.3.tgz"
  sha256 "2f5e8df043104ff064679bb30bef45797ddc3bfea55e8e5ca9623b8b9bacdd45"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sdkbump --version")

    output = shell_output("#{bin}/sdkbump #{testpath} 2>&1", 2)
    assert_match "No iOS project found", output
  end
end
