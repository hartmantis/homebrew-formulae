cask "obs-move-transition" do
	version "3.0.1"

	name "Move Transition"
	desc "The OBS Studio Move Transition plugin"
	homepage "https://obsproject.com/forum/resources/move.913"
	# Plugin *does* have releases tagged in GitHub, but the artifacts only exist on the OBS forums.
	url "https://obsproject.com/forum/resources/move.913/version/5662/download?file=104544"
	sha256 "a37811e94e1a0e8a3b57cef1bcdaad3d6cdba620a2cf1155e68d1e821499652e"

	depends_on cask: "obs"

	livecheck do
		url :url
		strategy :github_latest
	end

	# OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
	# can only put them in the root dir. This is admittedly hacky but feels
	# cleaner to me than the symlink approach in e.g. the obs-ndi cask.
	installer script: {
		executable: "/usr/sbin/installer",
		args: ["-pkg", "#{staged_path}/move-transition-#{version}-macos-universal.pkg", "-target", "CurrentUserHomeDirectory"]
	}

	uninstall script: {
		executable: "/usr/sbin/pkgutil",
		args: ["--forget", "com.exeldro.move-transition", "--volume", Dir.home]
	},
	delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/move-transition.plugin"
end
