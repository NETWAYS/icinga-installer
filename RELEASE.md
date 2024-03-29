# Release Workflow
Before submitting a new release, make sure all relevant pull requests and local branches have been merged to the `main`
branch. All tests must pass before a release is tagged.


## 1. AUTHORS
Update the [AUTHORS] and [.mailmap] file

``` bash
git checkout main
git log --use-mailmap | grep ^Author: | cut -f2- -d' ' | sort | uniq > AUTHORS
git commit -am "Update AUTHORS"
```

## 2. Reference
``` bash
cd modules/install
```

If it is not installed [puppet-strings]:
``` bash
gem install puppet-strings --no-ri --no-rdoc
```
Generate [REFERENCE.md] via [Puppet Strings]
``` bash
puppet strings generate --format markdown --out ../../REFERENCE.md
```

## 3. Version
Version numbers are incremented regarding the [SemVer 1.0.0] specification. 
Update the version number in `metadata.json` of puppet module `install`.

## 4. Changelog
Install [github-changelog-generator]
```bash
cd -
```

```bash
gem install github_changelog_generator -v 1.13.2
```

Generate [CHANGELOG.md]
```bash
github_changelog_generator -t <github-access-token> --future-release=v1.0.0 -u netways -p icinga-installer
```

## 5. Git Tag
Commit all changes to the `main` branch

``` bash
git commit -v -a -m "Release version <VERSION>"
git push
```

Tag the release

``` bash
git tag -m "Version <VERSION>" v<VERSION>
```

Push tags

``` bash
git push --tags
```

[github-changelog-generator]: https://github.com/skywinder/github-changelog-generator
[Puppet Strings]: https://puppet.com/docs/puppet/5.5/puppet_strings.html
[SemVer 1.0.0]: http://semver.org/spec/v1.0.0.html
[CHANGELOG.md]: CHANGELOG.md
[AUTHORS]: AUTHORS
[.mailmap]: .mailmap
