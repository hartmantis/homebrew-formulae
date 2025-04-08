cask "firebot" do
  arch arm: "arm64", intel: "x64"

  version "5.64.0"
  sha256 arm:   "035433c0f99bc6d966feffdad2bf93e77f5f91e9033ffeb6218c7b4682b4451a",
         intel: "ebe1fa8356289f6a900b51b9f296106c5bb4df2db3f62ee83886930de949ff5f"

  url "https://github.com/crowbartools/Firebot/releases/download/v#{version}/firebot-v#{version}-macos-x64.dmg",
      verified: "github.com/crowbartools/Firebot/"
  name "Firebot"
  desc "All-in-one bot for Twitch streamers"
  homepage "https://firebot.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Firebot.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Firebot",
    "#{Dir.home}/Library/Application Support/firebotv#{version.split(".").first}",
    "#{Dir.home}/Library/Preferences/com.electron.firebot.plist",
    "#{Dir.home}/Library/Saved Application State/com.electron.firebot.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
