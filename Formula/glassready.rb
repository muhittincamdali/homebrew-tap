class Glassready < Formula
  desc "Show what Liquid Glass changes in iOS, Flutter and React Native apps"
  homepage "https://github.com/muhittincamdali/glassready"
  url "https://github.com/muhittincamdali/glassready/releases/download/v0.1.2/glassready-0.1.2.tgz"
  sha256 "c42b9f52357997324c67a87346f2bbbf2bcc6de36be9a54dbd7d64e2a27c9e6a"
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
