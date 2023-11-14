SETLOCAL ENABLEDELAYEDEXPANSION
set /p version=<VERSION.txt
mkdir tmp
cd tmp
mkdir LeaderMod
cp ../Info.json LeaderMod
cp ../LeaderMod/bin/Release/LeaderMod.dll LeaderMod

cd LeaderMod
for /f "delims=" %%a in (Info.json) do (
    SET s=%%a
    SET s=!s:$VERSION=%version%!
    echo !s!
)>>"InfoChanged.json"
rm Info.json
mv InfoChanged.json Info.json
cd ..

tar -a -c -f LeaderMod-%version%.zip LeaderMod
mv LeaderMod-%version%.zip ..
cd ..
rm -rf tmp
pause