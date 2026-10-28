class Asnsim < Formula
  desc "Simulate signed App Store Server Notifications V2 against a local webhook"
  homepage "https://github.com/muhittincamdali/asnsim"
  url "https://github.com/muhittincamdali/asnsim/releases/download/v0.1.1/asnsim-0.1.1.tgz"
  sha256 "46375b58dc2ba8676a7d66efddaabe2e1f08ca8a0a56050954d463c8a409fe3b"
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
