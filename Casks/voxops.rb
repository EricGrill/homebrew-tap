cask "voxops" do
  version "0.1.1"
  sha256 "6e51512e0449c0ea3aeb71b261fe76abeeaa4908899b4fcb533b8df2062fe309"

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
