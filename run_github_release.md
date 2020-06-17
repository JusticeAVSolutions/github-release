## Usage:

    run_github_release.ps1 -VCS_URL %vcsroot.url% -SECURITY_TOKEN XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -USER JusticeAVSolutions -AUTH_USER javs-ci -TAG %system.build.number% -FILE FILE_TO_ATTACH

`-SECURITY_TOKEN` should contain the PAT (Personal Access Token) owned by `javs-ci` and created using the steps documented in [Creating a personal access token for the command line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line).
`-FILE` should be the file that will be attached to the release. That file should be in thedependency path for the _Artifact Build Configuration_.
