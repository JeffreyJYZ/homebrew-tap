class Crust < Formula
  desc "Bun-native macOS desktop app framework: system WebView, no Rust, no Chromium"
  homepage "https://github.com/JeffreyJYZ/crust"
  url "https://github.com/JeffreyJYZ/crust/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "a55993be04434e9eddb3d3e26d3a327c1c473902c9b8ba9d5cb109079aba173f"
  license "MIT"

  # Source, not a compiled artifact: crust is TypeScript that Bun runs, and its
  # runtime compiles the bundled .c shim at launch with the TinyCC inside Bun, so
  # there is nothing to build here and nothing to bottle. Bun is the interpreter
  # and the prerequisite, the way a Python tool depends on python.
  depends_on "bun"
  depends_on macos: :ventura # WKWebView APIs crust uses, and the apps it builds target 13.0

  def install
    # The repo root is the package root: crust resolves templates/, docs/ and the
    # .c shim relative to its own source, so the layout has to stay intact.
    # research/ is recon and examples/ is scratch, so neither travels.
    libexec.install "src", "templates", "docs", "package.json", "tsconfig.json", "README.md", "DESIGN.md"
    (bin/"crust").write <<~SH
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/src/cli/index.ts" "$@"
    SH
    chmod 0755, bin/"crust"
  end

  def caveats
    <<~EOS
      crust builds and signs macOS apps, so it needs the Xcode command line tools:
        xcode-select --install

      Start an app:
        crust init my-app --react     # or --next, or no flag for plain HTML
        cd my-app && bun install && crust dev
    EOS
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/crust --version")
    assert_match "crust init", shell_output("#{bin}/crust --help")
    # init reads the shipped templates through the package root, so this is the
    # check that the install layout is complete rather than merely present.
    system bin/"crust", "init", "probe", "--react", dir: testpath
    assert_predicate testpath/"probe/crust.config.ts", :exist?
    assert_predicate testpath/"probe/src/main.tsx", :exist?
  end
end
