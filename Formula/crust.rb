class Crust < Formula
  desc "Bun-native desktop app framework: system WebView, no Rust, no Chromium"
  homepage "https://github.com/JeffreyJYZ/crust"
  license "MIT"

  on_macos do
    url "https://github.com/JeffreyJYZ/crust/archive/refs/tags/v0.2.23.tar.gz"
    sha256 "9b46a99af3d9b54fa46f92ff0f2072dfa6d75ef630ddc5fd2de6c2c0264ee148"
  end

  # Linux uses the standalone executable attached to the same tag. It is a bare ELF file,
  # not an archive, so there is nothing to unpack; `install` below makes it executable.
  # These digests come from the published release assets and must be refreshed at every
  # tag (CI uploads the binaries after the tap PR opens -- see that PR's body).
  on_linux do
    on_arm do
      url "https://github.com/JeffreyJYZ/crust/releases/download/v0.2.23/crust-0.2.23-linux-arm64"
      sha256 "77648b6ff90fc25501a539d7227aab27632a167b83fdc3f6409fe5cea11cda4c"
    end
    on_intel do
      url "https://github.com/JeffreyJYZ/crust/releases/download/v0.2.23/crust-0.2.23-linux-x64"
      sha256 "1f61e79ced932b02dce5d21299a5b73c9b6f040c41b6442fd2108dc357fb9ec4"
    end
  end

  # On macOS crust is TypeScript that Bun runs, and its runtime compiles the bundled .c
  # shim at launch with the TinyCC inside Bun, so there is nothing to build or bottle.
  # The Linux branch installs the compiled equivalent instead. Bun is the prerequisite
  # for a scaffolded app on both platforms, the way a Python tool depends on python.
  depends_on "bun"
  on_macos do
    depends_on macos: :ventura # WKWebView APIs crust uses, and the apps it builds target 13.0
  end

  def install
    if OS.mac?
      # The repo root is the package root: crust resolves templates/ and the .c shim
      # relative to its own source, so the layout has to stay intact. research/,
      # examples/ and site/ are repo furniture, not part of an install.
      libexec.install "src", "templates", "package.json", "tsconfig.json", "README.md"
      (bin/"crust").write <<~SH
        #!/bin/bash
        exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/src/cli/index.ts" "$@"
      SH
      chmod 0755, bin/"crust"
    else
      # Homebrew detects 0.2.23 from both the tag archive and the asset name, so the
      # version comes from the active URL without declaring it twice.
      asset = "crust-#{version}-linux-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
      bin.install asset => "crust"
      chmod 0755, bin/"crust"
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        crust builds and signs macOS apps, so it needs the Xcode command line tools:
          xcode-select --install

        Start an app:
          crust init my-app --react     # or --next, or no flag for plain HTML
          cd my-app && bun install && crust dev
      EOS
    else
      <<~EOS
        Building a Linux app needs GTK3 and WebKitGTK; see
          https://github.com/JeffreyJYZ/crust/blob/main/site/app/docs/reference/platforms/page.mdx

        Start an app:
          crust init my-app --react     # or --next, or no flag for plain HTML
          cd my-app && bun install && crust dev
      EOS
    end
  end

  test do
    assert_match "0.2.23", shell_output("#{bin}/crust --version")
    assert_match "crust init", shell_output("#{bin}/crust --help")
    # init reads the shipped templates through the package root, so this is the
    # check that the install layout is complete rather than merely present.
    system bin/"crust", "init", "probe", "--react", dir: testpath
    assert_predicate testpath/"probe/crust.config.ts", :exist?
    assert_predicate testpath/"probe/src/main.tsx", :exist?
  end
end
