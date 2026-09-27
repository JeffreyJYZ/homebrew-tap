class Cmduse < Formula
  desc "Live usage dashboards: Command Code, and OpenCode Go/Zen"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.7.3.crate"
  sha256 "0db0dd4a4c84eb58a1260b56275f5b3808e7d342effa4ec438cc21f3d23c71d0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
    assert_match "ocuse", shell_output("#{bin}/ocuse --version")
  end
end
