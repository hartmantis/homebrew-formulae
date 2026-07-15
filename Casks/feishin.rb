cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "c0e270e79a198d8848af92a001cad7b6d08e0b683703bbf64e3d981e22a26549",
         intel: "6803c656f9c1319b89d2ad3e4ad451e08cc7ea89c16ab0673a15373b0f294c56"

  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Feishin.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/feishin",
    "#{Dir.home}/Library/Logs/feishin",
    "#{Dir.home}/Library/Preferences/org.jeffvli.feishin.plist",
    "#{Dir.home}/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end
