class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.0/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "efd6301de31e672e5ff77bbaa278f8bc86f1c20c826aa89b39310b0cdd211b0e"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.0/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "1d2fc1d00f6c2cf0db937ce21daaa3498e51aaad24dc881bf8db32a5cceb696b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.0/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f38cdb0adce4f57f88e73f4931c325629c91289e23c14c7e18a0138a95878815"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.0/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38f622eabc68cce766f74d06c2b0e7a3f45cbfd389c191f01994ad0b5bce6356"
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
