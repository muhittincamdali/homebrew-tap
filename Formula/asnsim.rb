class Asnsim < Formula
  desc "Simulate signed App Store Server Notifications V2 against a local webhook"
  homepage "https://github.com/muhittincamdali/asnsim"
  url "https://github.com/muhittincamdali/asnsim/releases/download/v0.1.2/asnsim-0.1.2.tgz"
  sha256 "9b07c9637835b762557e64224ec2d98608c804ce6953ae80544b81cceac73c86"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asnsim --version")

    system bin/"asnsim", "init", "--dir", testpath/"chain"
    assert_path_exists testpath/"chain/root.cer"
    body = shell_output("#{bin}/asnsim payload DID_RENEW --dir #{testpath}/chain")
    (testpath/"body.json").write body
    output = shell_output("#{bin}/asnsim decode #{testpath}/body.json --root #{testpath}/chain/root.cer")
    assert_match "3 verified", output
  end
end
