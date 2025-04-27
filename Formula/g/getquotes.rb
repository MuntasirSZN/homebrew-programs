class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.1/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "287b6674021cc340c9d89aa24658304a27ac78c6de4c59886943089730a90978"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.1/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "0d60f12ae013144a84190d9e160dfcd1bd0e503a37d1c69c70f18b90bfcac2fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.1/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e758c4580d2f643061b41b11e821b9fd358b726324deecf08bf615d90a19523d"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.1/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8acad70dae72664ebbd72bc437ed8932bfe0545b1044319043ffd0aaf922d791"
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
