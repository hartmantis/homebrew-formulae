cask "dopamine" do
  version "3.0.0-preview.38"
  sha256 "3a2633fb8298f99f9108e8927b2873df7299f858b05e4532e74dcd702ca12780"

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
