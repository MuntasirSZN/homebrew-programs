class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.3/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "4d7d6b81d0a8cec0964f9d5342c2b4689cb1c69e0952f7fe61f1c07042e44c16"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.3/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "fefa1750b1a246a3a80008fe178fbaf63cce19d9dd247a5572536b47d701d811"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.3/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c84492f609981cc7c0cb6452250c3ea6558ed31431c28b1b6c00b3ea0dd73eef"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.3/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "080cdf2a583b0d83acef8ee0905a8efa3895cd094d556d81140a0d2241ef3d8e"
    end
  end

  def install
    bin.install "getquotes"
    man1.install "man/getquotes.1"
    bash_completion.install "completions/getquotes.bash"
    zsh_completion.install "completions/_getquotes"
    fish_completion.install "completions/getquotes.fish"
  end

  test do
    assert_match "getquotes v", shell_output("#{bin}/getquotes --version")
    assert_match "Usage: getquotes", shell_output("#{bin}/getquotes --help")
    assert_path_exists prefix / "share/man/man1/getquotes.1"
    system bin / "getquotes"
  end
end
