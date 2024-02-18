# Electron Release Server: Demana

>A node web server which serves & manages releases of your [Electron](http://electron.atom.io) App, and is fully compatible with [Squirrel](https://github.com/Squirrel) Auto-updater (which is built into Electron).

## Advisory Notices

## Features
- :sparkles: Docker :whale: support (thanks to EvgeneOskin)!
- :sparkles: Awesome release management interface powered by [AngularJS](https://angularjs.org)
    - Authenticates with LDAP, easy to modify to another authentication method if needed
- :sparkles: Store assets on server disk, or Amazon S3 (with minor modifications)
    - Use pretty much any database for persistence, thanks to [Sails](http://sailsjs.org) & [Waterline](http://waterlinejs.org)
- :sparkles: Code-less [app customization through env variables](docs/customization.md)
- :sparkles: Simple but powerful download urls (**NOTE:** when no assets are uploaded, server returns `404` by default):
    - `/download/latest`
    - `/download/latest/:platform`
    - `/download/:version`
    - `/download/:version/:platform`
    - `/download/:version/:platform/:filename`
    - `/download/channel/:channel`
    - `/download/channel/:channel/:platform`
    - `/download/flavor/:flavor/latest`
    - `/download/flavor/:flavor/latest/:platform`
    - `/download/flavor/:flavor/:version`
    - `/download/flavor/:flavor/:version/:platform`
    - `/download/flavor/:flavor/:version/:platform/:filename`
    - `/download/flavor/:flavor/channel/:channel`
    - `/download/flavor/:flavor/channel/:channel/:platform`
- :sparkles: Support pre-release channels (`beta`, `alpha`, ...)
- :sparkles: Support multiple flavors of your app
- :sparkles: Auto-updates with [Squirrel](https://github.com/Squirrel):
    - Update URLs provided:
        - `/update/:platform/:version[/:channel]`
        - `/update/flavor/:flavor/:platform/:version[/:channel]`
    - Mac uses `*.dmg` and `*.zip`
    - Windows uses `*.exe` and `*.nupkg`
- :sparkles: Auto-updates with [NSIS differential updates for Windows](docs/update-windows.md#NSIS-differential-updates)
- :sparkles: Serve the perfect type of assets: `.zip` for Squirrel.Mac, `.nupkg` for Squirrel.Windows, `.dmg` for Mac users, ...
- :sparkles: Specify date of availability for releases
- :sparkles: Release notes endpoint
    - `/notes/:version/:flavor?`

**NOTE:** if you don't provide the appropriate type of file for Squirrel you won't be able to update your app since the update endpoint will not return a JSON. (`.zip` for Squirrel.Mac, `.nupkg` for Squirrel.Windows).

## Deploy it / Start it

[Follow our guide to deploy Electron Release Server](docs/deploy.md).

## Auto-updater / Squirrel

This server provides an endpoint for [Squirrel auto-updater](https://github.com/atom/electron/blob/master/docs/api/auto-updater.md), it supports both [OS X](docs/update-osx.md) and [Windows](docs/update-windows.md).

## Documentation
[Check out the documentation](docs/) for more details.

## Building Releases
I highly recommend using [electron-builder](https://github.com/loopline-systems/electron-builder) for packaging & releasing your applications. Once you have built your app with that, you can upload the artifacts for your users right away!

## Maintenance
You should keep your fork up to date with the electron-release-server master.

Doing so is simple, rebase your repo using the commands below.
```bash
git remote add upstream https://github.com/ArekSredzki/electron-release-server.git
git fetch upstream
git rebase upstream/master
```

## Credit
This project has been built from Sails.js up by Arek Sredzki, with inspiration from [nuts](https://github.com/GitbookIO/nuts).

## License
[MIT License](LICENSE.md)
