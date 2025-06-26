cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.16.0"
  sha256 arm:   "8e3f6de00b265e64ed01d7d50be87d7056c1a2b2aec341de863961e756d1bc81",
         intel: "16a067da290d635e163aa13a99ab0b030299ee5f6ccab10acd4a273ca3e6562a"

  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Feishin.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/feishin",
    "#{Dir.home}/Library/Logs/feishin",
    "#{Dir.home}/Library/Preferences/org.jeffvli.feishin.plist",
    "#{Dir.home}/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end
