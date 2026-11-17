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
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.3/cmduse-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "807f7a18e5382264f89a24c37687032cc57a082656d876195e52c25ab324ddff"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.3/cmduse-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "a7668aa2a27e447b887aa900a78cf2d16219c8b1426ea721859a3466d9c7c517"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.3/cmduse-0.8.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ee5cac5fcc76555ae9bdc704eb05fc3477fed07a9487766fa255aa8d18ba3931"
    end

    on_intel do
      url "https://github.com/JeffreyJYZ/cmdcode-tools/releases/download/cmduse-v0.8.3/cmduse-0.8.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "48c8225483c9ba6df26750a8b74414b567ef11a00cdf5341a71b2b017beb8389"
    end
  end

  def install
    bin.install "cmduse", "ocuse", "arkuse", "oduse", "cmdusedev", "ocusedev", "arkusedev", "odusedev"
    man1.install "cmduse.1"
  end

  test do
    assert_match "cmduse", shell_output("#{bin}/cmduse -V")
    assert_match "ocuse", shell_output("#{bin}/ocuse -V")
    assert_match "arkuse", shell_output("#{bin}/arkuse -V")
    assert_match "oduse", shell_output("#{bin}/oduse -V")
  end
end
