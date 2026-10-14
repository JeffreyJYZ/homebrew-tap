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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.10/cmduse-0.7.10-aarch64-apple-darwin.tar.gz"
      sha256 "00ec17df3656da8b55d9e68996b79805119ab1750cd81cb8dda2b597fdff7592"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.10/cmduse-0.7.10-x86_64-apple-darwin.tar.gz"
      sha256 "dc00642a4ff106993c016042b52dde9cafdf7c779006c8b7ff54075bfd078159"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.10/cmduse-0.7.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "faa7bf9abcb06ba837941930c8423acc867211101acb1922b2798df82804adde"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.10/cmduse-0.7.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e4587664b0532f2cbb696a56340aa6f0272bb8daf76b1afb937fdf7e5f0344dc"
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
