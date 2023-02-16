#Remove-Item .\Out\Makefile\CMakeCache.txt
Write-Output "________CMAKE GEN FOR MinGW Makefiles _________"
cmake  -G "MinGW Makefiles" -BOut/Makefile 
Set-Location .\Out\Makefile\
mingw32-make.exe
Set-Location ..\..\
