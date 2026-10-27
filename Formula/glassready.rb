class Glassready < Formula
  desc "Show what Liquid Glass changes in iOS, Flutter and React Native apps"
  homepage "https://github.com/muhittincamdali/glassready"
  url "https://github.com/muhittincamdali/glassready/releases/download/v0.1.1/glassready-0.1.1.tgz"
  sha256 "29bca0fa058f7d2624a1f16b4386ee7234b4166f374fcef3e6157ee602892783"
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
