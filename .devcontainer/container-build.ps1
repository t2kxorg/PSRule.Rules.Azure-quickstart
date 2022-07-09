# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This is run during container creation.

# Install PowerShell dependencies
$ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue;
if ($Null -eq (Get-PackageProvider -Name NuGet -ErrorAction Ignore)) {
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser;
}
if ($Null -eq (Get-InstalledModule -Name PowerShellGet -MinimumVersion 2.2.1 -ErrorAction Ignore)) {
    Install-Module -Name PowerShellGet -MinimumVersion 2.2.1 -Scope CurrentUser -Force -AllowClobber;
}
if ($Null -eq (Get-InstalledModule -Name PSRule.Rules.Azure -MinimumVersion 1.17.0 -ErrorAction Ignore)) {
    Install-Module -Name PSRule.Rules.Azure -MinimumVersion 1.17.0 -Scope CurrentUser -Force;
}
