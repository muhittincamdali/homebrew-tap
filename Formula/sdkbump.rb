class Sdkbump < Formula
  desc "Check iOS, Flutter and React Native apps for iOS 27 SDK changes"
  homepage "https://github.com/muhittincamdali/sdkbump"
  url "https://github.com/muhittincamdali/sdkbump/releases/download/v0.1.4/sdkbump-0.1.4.tgz"
  sha256 "4bfb0ed943502b0974f26741aa7443133947788c9d9cf41bb9112547f3ca631a"
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
