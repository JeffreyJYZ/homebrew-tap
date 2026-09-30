class Cmduse < Formula
  desc "Live Command Code usage dashboard: plan, credits, windows, reports"
  homepage "https://github.com/JeffreyJYZ/cmdcode-tools"
  license "MIT"

  # Prebuilt release assets — no cargo, no Rust toolchain, no compile step.
  # Asset names are a contract shared with `cargo binstall` metadata (see
  # .github/workflows/release.yml in the source repo); Linux uses the musl
  # builds because they run on any distro regardless of glibc version.
  on_macos do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.7/cmduse-0.7.7-aarch64-apple-darwin.tar.gz"
      sha256 "ed9e76daa006b4849710c75e64dc00b01dcbd804b1709a12a2eeb064d427a39d"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.7/cmduse-0.7.7-x86_64-apple-darwin.tar.gz"
      sha256 "a70a8b795ce6c6b3e365384cef301c1bb5fbdb1e91acc896b829beea439f40bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.7/cmduse-0.7.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bdb36079f469fdc7be3bd2eae8b597ea538a39233a38ba4b8c10eea23d7b6e00"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.7/cmduse-0.7.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8c2bfbf707fc5a129408a3c90b712bc2eae05d735d3c6763f350ae1201ebccf9"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "cmdusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
  end
end
