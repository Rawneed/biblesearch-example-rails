# Rough Devel Notes

## memcached

### Mac Install

```
brew install memcached
==> Downloading http://memcached.googlecode.com/files/memcached-1.4.15.tar.gz
Already downloaded: /Library/Caches/Homebrew/memcached-1.4.15.tar.gz
==> ./configure --prefix=/usr/local/Cellar/memcached/1.4.15 --disable-coverage
==> make install
==> Caveats
To have launchd start memcached at login:
    ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
Then to load memcached now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
Or, if you don't want/need launchctl, you can just run:
    /usr/local/opt/memcached/bin/memcached
```
