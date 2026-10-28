class Reviewready < Formula
  desc "Catch App Review rejections in iOS, Flutter and React Native projects"
  homepage "https://github.com/muhittincamdali/reviewready"
  url "https://github.com/muhittincamdali/reviewready/releases/download/v0.1.1/reviewready-0.1.1.tgz"
  sha256 "95ea73f148ac7a83e06b083707031ea5b04ddfbd050b38f4cc0927170d318d1c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewready --version")

    output = shell_output("#{bin}/reviewready #{testpath} 2>&1", 2)
    assert_match "No iOS project found", output
  end
end
