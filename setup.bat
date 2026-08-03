@echo off
setlocal

set "WSL_DOTFILES=%~dp0"

:: Windows側のZed設定フォルダパス
set "ZED_WIN_CONFIG=%APPDATA%\Zed"

echo ターゲットパス: %WSL_DOTFILES%

:: 管理者権限チェック（簡易版）
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] このバッチファイルは「管理者として実行」する必要があります。
    pause
    exit /b
)

:: keymap.json
mklink "%ZED_WIN_CONFIG%\keymap.json" "%WSL_DOTFILES%keymap.json"

:: settings.json
mklink "%ZED_WIN_CONFIG%\settings.json" "%WSL_DOTFILES%settings.json"

:: themes (ディレクトリ)
mklink /d "%ZED_WIN_CONFIG%\themes" "%WSL_DOTFILES%themes"

echo.
echo 設定が完了しました。
pause
