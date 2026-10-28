class Glassready < Formula
  desc "Show what Liquid Glass changes in iOS, Flutter and React Native apps"
  homepage "https://github.com/muhittincamdali/glassready"
  url "https://github.com/muhittincamdali/glassready/releases/download/v0.1.3/glassready-0.1.3.tgz"
  sha256 "4c2f7a81fd7e23bd23d7c638f6d013deb128270595c5f6065fd39f35904284db"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glassready --version")

    output = shell_output("#{bin}/glassready #{testpath} 2>&1", 2)
    assert_match "No iOS project found", output
  end
end
