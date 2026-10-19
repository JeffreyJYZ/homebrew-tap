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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.19/cmduse-0.7.19-aarch64-apple-darwin.tar.gz"
      sha256 "5e8a452d34eae7d6dcc0c23c3ecdddb5456830341b35702fab620dbcd171578c"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.19/cmduse-0.7.19-x86_64-apple-darwin.tar.gz"
      sha256 "3b15feece4add9c8c95405aa3ec6450df3625200a50840333e9fea96133637d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.19/cmduse-0.7.19-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16c028f3a605d8ab77703fee0339781e6e46943c2a609d06f2aac827504de867"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.7.19/cmduse-0.7.19-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf8edfc07c21cd512edd4a2021e51d9bdcd2e2b934b3ff1151bc612bd24d36c8"
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
