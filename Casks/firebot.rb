cask "firebot" do
  version "5.63.2"
  sha256 "a9b042274d639c8c94a89302f175216f08b71f24146431f84d7048c0e64f3de2"

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
