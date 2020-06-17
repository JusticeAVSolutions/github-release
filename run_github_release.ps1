<#

.SYNOPSIS
This is a Powershell script to call 'C:\github-release\github-release.exe' which is used to create a release in
github, and attach files to that release.

.PARAMETER VCS_URL
Will be set to '%vcsroot.url%'

.PARAMETER SECURITY_TOKEN
A gitub personal access token

.PARAMETER USER
The owner of the repository, i.e. "JusticeAVSolutions"

.PARAMETER AUTH_USER
The user who owns SECURITY_TOKEN -- "javs-ci"

.PARAMETER TAG
The git tag which the release will be attached to -- "%system.build.number%"

#>

[CmdletBinding()]
Param(
    [string]$VCS_URL,
    [string]$SECURITY_TOKEN,
    [string]$USER = "JusticeAVSolutions",
    [string]$AUTH_USER = "javs-ci",
    [string]$TAG,
    [string]$FILE
)


# Pull $REPO_NAME from repository URI, regardless of whether it's SSH or HTTP formatted.
$REPO_NAME=[regex]::match( $VCS_URL, '.*/([^.]+)(:?\.git|)$').captures.groups[1].value

# Logging
echo "VCS_URL: $VCS_URL"
echo "SECURITY_TOKEN: $SECURITY_TOKEN"
echo "USER: $USER"
echo "AUTH_USER: $AUTH_USER"
echo "TAG: $TAG"
echo "FILE: $FILE"
echo "REPO_NAME: $REPO_NAME"

# Create release for the given tag
echo "C:\github-release\github-release.exe release --security-token $SECURITY_TOKEN --user $USER --repo $REPO_NAME --tag $TAG"
C:\github-release\github-release.exe release --security-token $SECURITY_TOKEN --user $USER --repo $REPO_NAME --tag $TAG

# Attach file to release
echo "C:\github-release\github-release.exe upload --security-token $SECURITY_TOKEN --auth-user $AUTH_USER --user $USER --repo $REPO_NAME --tag $TAG --name $FILE --file $FILE"
C:\github-release\github-release.exe upload --security-token $SECURITY_TOKEN --auth-user $AUTH_USER --user $USER --repo $REPO_NAME --tag $TAG --name $FILE --file $FILE

