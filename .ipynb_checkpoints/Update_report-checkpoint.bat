@echo off
REM Bước 1: Chạy notebook build book.ipynb bằng nbconvert
jupyter nbconvert --to notebook --execute "build book.ipynb" --inplace

REM Kiểm tra nếu bước trên thành công
IF %ERRORLEVEL% NEQ 0 (
    echo Lỗi khi chạy notebook. Dừng quá trình.
    pause
    exit /b %ERRORLEVEL%
)

REM Bước 2: Update report lên GitHub
ghp-import -n -p -f -r origin -b gh-pages _build/html

echo Hoàn thành build và deploy lên GitHub Pages.
pause