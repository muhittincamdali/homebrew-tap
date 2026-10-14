class Podexit < Formula
  desc "Show which CocoaPods stop getting updates when trunk goes read-only"
  homepage "https://github.com/muhittincamdali/podexit"
  url "https://github.com/muhittincamdali/podexit/releases/download/v0.1.0/podexit-0.1.0.tgz"
  sha256 "0555ed3e3af11bc080a28023fc1711f5a9e82aef4a1a2fb1b2c2eb5ad67f3b27"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podexit --version")

    (testpath/"Podfile.lock").write <<~EOS
      PODS:
        - AppCore (1.0.0)

      DEPENDENCIES:
        - AppCore (from `../AppCore`)

      EXTERNAL SOURCES:
        AppCore:
          :path: "../AppCore"

      COCOAPODS: 1.16.2
    EOS
    output = shell_output("#{bin}/podexit --offline --all --cache-dir #{testpath}/cache")
    assert_match "not affected", output
  end
end
