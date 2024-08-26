cask "firebot" do
  version "5.63.1"
  sha256 "b2977328f2a701a5e934b2d995ce576224ddca0762125d2ece38ea94be36715d"

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
