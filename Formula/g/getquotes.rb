class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.1/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "afd2749a7a77fd6ade5cb239198b4b0004c9dd677a88a1b5247462d685c7b830"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.1/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "b59a5b58484b019ed706076efedf8544fb832d1ffe8916fd1e26de66f011622d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.1/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd77132e721b3ceeb89aff9e795df3788db79310f5fbe13b6df558c3a1c0d727"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.1/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64e6268c4563bd362c1b2632c6b8632367dc13793f4317be181da2ddc47372fd"
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
