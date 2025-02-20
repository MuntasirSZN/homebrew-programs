class Getquotes < Formula
  desc "Terminal tool for fetching quotes from WikiQuotes"
  homepage "https://github.com/MuntasirSZN/getquotes"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v#{version}/getquotes-aarch64-apple-darwin.tar.gz"
      sha256 "0595ca90aa3a640cb4cfe017560c70ef90d1d339bdf86802960c36b56a6c6928"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v#{version}/getquotes-x86_64-apple-darwin.tar.gz"
      sha256 "434d27a0318f2e546b0fa9502e4b3aa2df0b97c153e2bd23b07d6b8e3550a61a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v#{version}/getquotes-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9e022e064e3d3c031d8f7304d2811975a9d5285a688d83d534c6223177a2a39"
    end
    on_intel do
      url "https://github.com/MuntasirSZN/getquotes/releases/download/v#{version}/getquotes-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47aae21eaef2d699b9f0cdcae441e947b6ba0ab4128205c25f577b2ab40a4bf8"
    end
  end

  def install
    bin.install "getquotes"
    man1.install "man/getquotes.1"
    prefix.install "LICENSE" => "share/licenses/getquotes/LICENSE"
  end

  test do
    assert_match "getquotes v", shell_output("#{bin}/getquotes --version")
    assert_match "Usage: getquotes", shell_output("#{bin}/getquotes --help")
    assert_path_exists prefix / "share/man/man1/getquotes.1"
    system bin / "getquotes"
  end
end

