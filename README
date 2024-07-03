## Scripture App Builder Flatpak

Flatpak Build of the App-Builders apps (SAB, RAB, DAB, KAB)

## Building:

If running flatpak for the first time, install flatpak and default location for repo's:
```bash
#'sudo apt install flatpak' didn't work on my 20.04 build so use this older method if needed:
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install flatpak
```
Install Flathub repo:
`flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

An OS restart is apparently required after installing the repo in a first-time setup...

### Dependencies:

Install Flatpak-Builder:
`sudo apt install flatpak-builder flatpak`

Install freedesktop runtime, and openjdk:
```bash
flatpak --user install flathub org.gnome.Sdk//46
flatpak --user install flathub org.gnome.Platform//46
#Gnome alternatives
#flatpak --user install flathub org.freedesktop.Sdk//23.08
#flatpak --user install flathub org.freedesktop.Platform//23.08
flatpak --user install flathub org.freedesktop.Sdk.Extension.openjdk17//23.08
#Use either this node20 extension or check that you have an existing installation of node20.9 or higher in /usr/lib/sdk/node20 for flatpak to copy from
flatpak --user install flathub prg.freedesktop.Sdk.Extension.node20
flatpak update
```

### Additional Files:

Tarball should be located in `output/` relative to where you run the builder command below
Put an empty `tmp/` directory in output for extraction

## Testing

When building the app from a clone of this directory:
`flatpak-builder --user --install --force-clean build org.sil.AppBuilders.yml`
- The `--user` vs `--system` option installs to the user's flatpak repo in either `~/.local/share/flatpak` for user or `/var/lib/flatpak` for system
- `--force-clean` empties the target directory
- `build` is the target directory

Each build will produce a cached copy of certain files in the manifest's local directory in `./.flatpak-builder/build/AppBuilders`. Empty out `build/*` with `rm -r` before running another install if it's getting crowded

## Testing

Run from flathub repo:
`flatpak run org.sil.AppBuilders`

Run terminal* instead of the app:
`flatpak run --command=bash org.sil.AppBuilders`

*(helpful for checking what variables and directories are available to the app. Still trying to figure out if it's possible to run the app AND a flatpak terminal within it...)