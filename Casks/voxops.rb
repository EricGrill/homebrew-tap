cask "voxops" do
  version "0.1.2"
  sha256 "25a0a98acf9bcea0a88036769c623df3ca1e967f860dd9209d56c64fb020efaa"

  url "https://github.com/EricGrill/vox-ops/releases/download/v#{version}/VoxOps-#{version}-macos-arm64.zip"
  name "VoxOps"
  desc "Push-to-talk voice input and AI agent chat for macOS"
  homepage "https://github.com/EricGrill/vox-ops"

  depends_on macos: ">= :sonoma"

  app "VoxOpsApp.app", target: "VoxOps.app"

  zap trash: [
    "~/Library/Application Support/VoxOps",
  ]
end
