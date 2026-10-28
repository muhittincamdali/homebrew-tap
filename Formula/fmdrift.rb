class Fmdrift < Formula
  desc "Regression tests for prompts to Apple's on-device foundation model"
  homepage "https://github.com/muhittincamdali/fmdrift"
  url "https://github.com/muhittincamdali/fmdrift/releases/download/v0.1.0/fmdrift-0.1.0-macos-arm64.tar.gz"
  sha256 "3156251df6b3e5cf8664970195a268499fa42fb15febb54cc0a9a0659c5b8ce2"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "fmdrift"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fmdrift --version").strip
    system bin/"fmdrift", "init"
    assert_match "suite `starter`, 2 cases", shell_output("#{bin}/fmdrift validate")
    (testpath/"bad.yaml").write "cases:\n  - id: a\n    prompt: p\n    expect:\n      - contans: x\n"
    assert_match "did you mean `contains`", shell_output("#{bin}/fmdrift validate bad.yaml", 1)
  end
end
