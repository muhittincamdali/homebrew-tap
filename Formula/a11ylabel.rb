class A11ylabel < Formula
  desc "Check which App Store accessibility labels iOS and cross-platform apps can claim"
  homepage "https://github.com/muhittincamdali/a11ylabel"
  url "https://github.com/muhittincamdali/a11ylabel/releases/download/v0.1.0/a11ylabel-0.1.0.tgz"
  sha256 "1f1c2c609bee35818049b9466cf9d9d13b49d27e764db6eb6e6043cd2205a251"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/a11ylabel --version")

    output = shell_output("#{bin}/a11ylabel #{testpath} 2>&1", 2)
    assert_match "No iOS project found", output
  end
end
