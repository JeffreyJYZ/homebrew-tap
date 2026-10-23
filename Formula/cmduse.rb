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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.28/cmduse-0.7.28-aarch64-apple-darwin.tar.gz"
      sha256 "e672c7b6c9b4c347454554c38decaecf7abc7f0486f4122c36905241860ed395"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.28/cmduse-0.7.28-x86_64-apple-darwin.tar.gz"
      sha256 "f1ea8fcdf1e3c23eba5ec7a02a279cbf35cc87de01c4eb1922cc049121a77d85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.28/cmduse-0.7.28-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e1f799aae05f6f2521962e0299a4da54f8d9e761e37d763afbe504dda85c9d4c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.28/cmduse-0.7.28-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1123d680a49fb245937f193a55c35051338a50372f6197d2ab3f85089e3f82d7"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "cmdusedev", "ocusedev", "arkusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
  end
end
