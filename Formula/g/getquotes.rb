class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.0/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "137e61b9669a97ed64220646d999ab4858a7ef2c90c2bb682f20c22d94355b21"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.0/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "8e531e69de1fe24f882d36eaad3991d4d8d5eb9f4f4bc54cb68885a0a1daff43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.0/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "033e173d2b4e055b1fdaa4a74c41e062821842c7bbe56db7655f09eb8c925e5a"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.5.0/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de2e131269d12a88934f00a52b5e61a8bdf08dc3dc52b372488f49cb709abd2e"
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
