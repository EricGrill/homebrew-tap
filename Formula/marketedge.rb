class Marketedge < Formula
  desc "Local-first prediction-market quant workbench"
  homepage "https://github.com/EricGrill/marketedge"
  head "https://github.com/EricGrill/marketedge.git", branch: "main"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system venv.root/"bin/pip", "install", buildpath
    bin.install_symlink venv.root/"bin/marketedge"
  end

  test do
    system bin/"marketedge", "--help"
  end
end
