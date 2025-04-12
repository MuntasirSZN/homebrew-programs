class Getquotes < Formula
  desc "A simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.3.7/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "f41cd91f7826d3443387dffea220e580e6e6af9d0cf30f7a2e0552942f011042"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.3.7/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "a1fd6dee1633c16e2ea04738d2be4e421436d47f9ee00ad0002da863376c657c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.3.7/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eeda68ee04a1ca848c7600ff37ac23a5dbd26bf64cd0084c18d6e57ebd90cd22"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.3.7/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "167a8e5c7db8058c1b9bb0e7c765077885ad3c7f3394c4625aac827d600bc629"
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
