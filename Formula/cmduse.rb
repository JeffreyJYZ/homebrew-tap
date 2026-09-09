class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/command-code-zed"
  url "https://static.crates.io/crates/cmd-usage/cmd-usage-0.1.20.crate"
  sha256 "946e24ece0d6d410c8ddb2fa0d7839604b454d541113a9c7e58574c0d12c37e0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse --help")
  end
end
