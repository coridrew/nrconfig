@echo off

@mkdir ..\Packaged

echo Updating NuGet
.\.nuget\nuget.exe Update -self

echo Building library package
.\.nuget\nuget.exe pack .\NuGetPackage-Lib\bin\NRConfig.Library.nuspec -OutputDirectory .\NuGetPackage-Lib\bin\
copy .\NuGetPackage-Lib\bin\NRConfig.Library.*.nupkg ..\Packaged\

echo Building tool package
.\.nuget\nuget.exe pack .\NuGetPackage-Tool\bin\NRConfig.Tool.nuspec -OutputDirectory .\NuGetPackage-Tool\bin\
copy .\NuGetPackage-Tool\bin\NRConfig.Tool.*.nupkg ..\Packaged\

echo Building MSBuild package
.\.nuget\nuget.exe pack .\NuGetPackage-MSBuild\bin\NRConfig.MSBuild.nuspec -OutputDirectory .\NuGetPackage-MSBuild\bin\
copy .\NuGetPackage-MSBuild\bin\NRConfig.MSBuild.*.nupkg ..\Packaged\

echo Packaging complete.