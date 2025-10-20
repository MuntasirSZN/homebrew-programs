class Novalyn < Formula
  desc "💅 Beautiful Changelogs using Conventional Commits"
  homepage "https://github.com/nanodelabs/novalyn"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nanodelabs/novalyn/releases/download/novalyn-v0.1.0/novalyn-aarch64-apple-darwin.tar.gz"
      sha256 "c754b9d2ddd7ec3881d88ad9b88c6471dda854eceddab600301d45be80a893f4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nanodelabs/novalyn/releases/download/novalyn-v0.1.0/novalyn-x86_64-apple-darwin.tar.gz"
      sha256 "98daadf2dc443bd40245c774bd5bd4f4e3834e149b842a0f37a0eec01628b628"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nanodelabs/novalyn/releases/download/novalyn-v0.1.0/novalyn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "135617864968ab0395ccb6f143be4dfb78f692ca2d3dfd35faad2543676f518e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nanodelabs/novalyn/releases/download/novalyn-v0.1.0/novalyn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a69332c8df3f34b9c54f6de5ceb8b54a4810ad1e7ca8c542ec077025be5cd382"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":                   {},
    "aarch64-unknown-linux-gnu":              {},
    "arm-unknown-linux-gnueabihf":            {},
    "arm-unknown-linux-musl-dynamiceabihf":   {},
    "arm-unknown-linux-musl-staticeabihf":    {},
    "armv7-unknown-linux-gnueabihf":          {},
    "armv7-unknown-linux-musl-dynamiceabihf": {},
    "armv7-unknown-linux-musl-staticeabihf":  {},
    "i686-unknown-linux-gnu":                 {},
    "i686-unknown-linux-musl-dynamic":        {},
    "i686-unknown-linux-musl-static":         {},
    "x86_64-apple-darwin":                    {},
    "x86_64-pc-windows-gnu":                  {},
    "x86_64-unknown-linux-gnu":               {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "novalyn" if OS.mac? && Hardware::CPU.arm?
    bin.install "novalyn" if OS.mac? && Hardware::CPU.intel?
    bin.install "novalyn" if OS.linux? && Hardware::CPU.arm?
    bin.install "novalyn" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
