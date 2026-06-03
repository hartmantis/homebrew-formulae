cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.13.0"
  sha256 arm:   "967d6476ae3a06549798f466a64aeeefc39408dcfe271cb753b4c67d8b384b69",
         intel: "da501d8fe9b0150505f4a6b91b4af4aa2bc4cd619339c4c814d1df7c460244a6"

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
