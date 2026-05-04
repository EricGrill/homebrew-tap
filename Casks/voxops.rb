cask "voxops" do
  version "0.1.4"
  sha256 "affd559a8a20e80de17cab4cb7691eb6d4f8a8d68931be68a3d2d78ac6ee6964"

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
