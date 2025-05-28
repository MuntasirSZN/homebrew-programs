class Getquotes < Formula
  desc "Simple cli tool to get quotes in your terminal using WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.0/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "83db5291703cde0712586ca9df127a17cb80f0ac5c8f2ed5bf4364053dd3c076"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.0/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "f5d1b23ad8b039f01156fabd508c5d355274afeb7c6e2224879b85ca1372b4d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.0/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34412a3b5c511ba5037080371bc59e75f6e9c49557914ab434aee51d0b402fa7"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v0.6.0/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2f605ae3999d6ab4bfe5117b518c6318e57e1b1ffe1f09450b11791f5ee8066"
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
