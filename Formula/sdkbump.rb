class Sdkbump < Formula
  desc "Check iOS, Flutter and React Native apps for iOS 27 SDK changes"
  homepage "https://github.com/muhittincamdali/sdkbump"
  url "https://github.com/muhittincamdali/sdkbump/releases/download/v0.1.5/sdkbump-0.1.5.tgz"
  sha256 "f8477c3c518f4a5edb38c945c242e1e383d25576416e40aaf130a3405f95ea2b"
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
