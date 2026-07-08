class PromptPantry < Formula
  desc "Local git-backed prompt library CLI and TUI"
  homepage "https://github.com/EricGrill/promptpantry"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/EricGrill/promptpantry/releases/download/v0.1.0/prompt-pantry-aarch64-apple-darwin.tar.xz"
      sha256 "b55eaf2d98a6ab56c6566233c2586048a89cc3b7cf8e428eb82b101f2f2feacf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EricGrill/promptpantry/releases/download/v0.1.0/prompt-pantry-x86_64-apple-darwin.tar.xz"
      sha256 "228795639e181f41b19ee1c4122d7f730a777f87aead686d01b6b77efbaea4c4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/EricGrill/promptpantry/releases/download/v0.1.0/prompt-pantry-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "60caab4bc81826e35edb02c9c952a8c211e9e3a868aeb871abc7a2f5693f5ddb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EricGrill/promptpantry/releases/download/v0.1.0/prompt-pantry-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "abbe5a88ef6e79618d3902f9555d5336d2201947ee26d8d9caa7bcdebafa8bb4"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "pp" if OS.mac? && Hardware::CPU.arm?
    bin.install "pp" if OS.mac? && Hardware::CPU.intel?
    bin.install "pp" if OS.linux? && Hardware::CPU.arm?
    bin.install "pp" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
