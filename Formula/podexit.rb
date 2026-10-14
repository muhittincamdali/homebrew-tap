class Podexit < Formula
  desc "Show which CocoaPods stop getting updates when trunk goes read-only"
  homepage "https://github.com/muhittincamdali/podexit"
  url "https://github.com/muhittincamdali/podexit/releases/download/v0.1.1/podexit-0.1.1.tgz"
  sha256 "548d7b70ec8989ce4c1cc80276e0be6cfdebe800cfdd2e408d6489da8d22e7c6"
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
