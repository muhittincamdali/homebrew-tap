class Reviewready < Formula
  desc "Catch App Review rejections in iOS, Flutter and React Native projects"
  homepage "https://github.com/muhittincamdali/reviewready"
  url "https://github.com/muhittincamdali/reviewready/releases/download/v0.1.0/reviewready-0.1.0.tgz"
  sha256 "0b1b8ac3eabda66377c7c4acf8a4e690b36ab6f3d0127b8410acd0a1fd449ceb"
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
