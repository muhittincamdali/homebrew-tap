class Glassready < Formula
  desc "Show what Liquid Glass changes in iOS, Flutter and React Native apps"
  homepage "https://github.com/muhittincamdali/glassready"
  url "https://github.com/muhittincamdali/glassready/releases/download/v0.1.0/glassready-0.1.0.tgz"
  sha256 "8e9262b24cf3854ff6d9c420326eded478f256f57b8dad3262f76e723dc6bfec"
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
