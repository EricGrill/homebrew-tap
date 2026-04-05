cask "voxops" do
  version "0.1.0"
  sha256 "ac3b52d53abc23d872082c594cd60d37e447e1c9c3b2874f133fd7dc5b6215e4"

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
