cask "dopamine" do
  version "3.0.0-preview.34"
  sha256 "20f6635bcdf4e96b61eb57c4e9f0abd1c48ddcf3b9a79da77d7056f5965df6d4"

  url "https://github.com/digimezzo/dopamine/releases/download/v#{version}/Dopamine-#{version}.dmg"
  name "Dopamine"
  desc "Elegant multi-platform audio player"
  homepage "https://github.com/digimezzo/dopamine"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dopamine.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Dopamine",
    "#{Dir.home}/Library/Preferences/com.digimezzo.dopamine.plist",
    "#{Dir.home}/Library/Saved Application State/com.digimezzo.dopamine.savedState",
  ]
end
