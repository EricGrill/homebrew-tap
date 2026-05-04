cask "voxops" do
  version "0.1.3"
  sha256 "24824d574be8b3980cc6a7b2daff0b52636b9c0c87e83ac1d43c4ea8c9e155f5"

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
