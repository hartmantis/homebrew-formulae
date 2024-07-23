cask "obs-waveform" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.1"
  sha256 arm:   "72cc9c45c6abd379a9622f8fe30cda1e40144aea656a4463be0d1ef9149fb3c1",
         intel: "86842c3afb6b8f5403914886ceef305088c145d3311d63d75fda560f98fc2421"

  url "https://github.com/phandasm/waveform/releases/download/v#{version}/Waveform_v#{version}_MacOS_#{arch}.pkg",
      verified: "github.com/phandasm/waveform/"
  name "OBS Waveform"
  desc "Audio spectral analysis plugin for OBS Studio"
  homepage "https://obsproject.com/forum/resources/waveform.1423"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "obs"

  # OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
  # can only put them in the root dir. This is admittedly hacky but feels
  # cleaner to me than the symlink approach in e.g. the obs-ndi cask.
  installer script: {
    executable: "/usr/sbin/installer",
    args:       ["-pkg", "#{staged_path}/Waveform_v#{version}_MacOS_#{arch}.pkg", "-target", "CurrentUserHomeDirectory"],
  }

  uninstall script: {
              executable: "/usr/sbin/pkgutil",
              args:       ["--forget", "com.github.phandasm.waveform.waveform", "--volume", Dir.home],
            },
            delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/waveform.plugin"
end
