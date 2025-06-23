class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.1/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "e5273d447dc0b6fa0ee04d3b8b1700fe871aba03c9f35e5d55788f1cb742f4e6"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.1/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "99c06277b89e736e52e492b6e8131de5f6001e7c917c4acdc687e9494c37c0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.1/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d609243940afe9e2cc8be0d8d6af8089600425201f2ebf1d7a9f85a3cffb9a39"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.1/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb27b430c8c12782ca26c0deaea62cbfc7a18b1535117d5e16595d16d8eb664d"
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
