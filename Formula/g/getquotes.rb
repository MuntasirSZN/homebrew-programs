class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.2/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "19a8b6f920f4237385321ae6d92a709865bf226fdef229e0203dde05f1bc843b"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.2/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "b8a2e8c78672de04e9be4d4456ef1eea1a9fbf41767cafc05d469441e8af5110"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.2/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7a416efe13050fda12b51e79c8dbe47f61580b7d4915df69e7ebdbbad2059d3"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.7.2/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe4fd1f28374653921105968d73efbc5f4f2b207d65ae4d4e350c631ca2994dc"
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
