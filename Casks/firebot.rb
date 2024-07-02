cask "firebot" do
  version "5.62.1"
  sha256 "4225fbcf88ef34ad9d92333395e4ef97f48198f3f960536706f5f917bb3b5ce4"

  # Firebot is currently x64-only but, if I'm reading right, the next release
  # should get an ARM build by virtue of them using the `macos-latest` GitHub
  # Actions runner and that having changed to an M1 runner since the last
  # Firebot release.
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
end
