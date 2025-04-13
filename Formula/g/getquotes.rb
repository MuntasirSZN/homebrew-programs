class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.4.0/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "3f2f94025c47cbc5bb48da1b91fc4d2434834d405a849bc30ec5b7c57cf07492"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.4.0/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "0eef63d0206effa11eb6335255a0806cc30fe70a29e606e20685f1ef59efbd75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.4.0/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78f6cea6e227fad6c4ab93aa1d09a59ed4ad33725b2432b562edf20bdbd831d5"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.4.0/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5e53650f682607bbe634a6528cabe4f9eeece675b32c8624881750ed66d4196"
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
