@echo off
echo Building Astro project...
call npm run build
if %errorlevel% neq 0 (
    echo.
    echo BUILD FAILED -0 aborting push. Fix the errors above and try again.
    exit /b 1
)
echo Build Succeeded. Committing and pushing...
git add .
git commit -m "Auto Update"
git push origin main
echo.
echo Done. Now run "deploy" on Anastasia to go live.