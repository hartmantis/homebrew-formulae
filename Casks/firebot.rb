cask "firebot" do
  version "5.62.1"

  name "Firebot"
  desc "All-in-one bot for Twitch streamers"
  homepage "https://firebot.app"
  # Firebot seems to run on ARM even though it has "x64" in the filename.
  url "https://github.com/crowbartools/Firebot/releases/download/v#{version}/firebot-v#{version}-macos-x64.dmg"
  sha256 "4225fbcf88ef34ad9d92333395e4ef97f48198f3f960536706f5f917bb3b5ce4"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Firebot.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Firebot",
    "#{Dir.home}/Library/Application Support/firebotv#{version.split('.').first}",
    "#{Dir.home}/Library/Preferences/com.electron.firebot.plist",
    "#{Dir.home}/Library/Saved Application State/com.electron.firebot.savedState"
  ]
end
