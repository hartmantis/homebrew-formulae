cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.15.1"
  sha256 arm:   "b64a2a548227ab8242dc5c570807a0d61085aed87cd3c4e37e40a35432d1ac2c",
         intel: "e560061ecce3c7e12ede2798c53854b510a2a6cc392a23405def4a36b9776f4c"

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
