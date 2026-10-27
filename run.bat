@echo off
>nul chcp 1252
for /f "tokens=1,* delims==" %%A in (.env) do (
    if "%%A"=="POSTGRES_PASSWORD" set "POSTGRES_PASSWORD=%%B"
)

psql -d postgres -U postgres -v ON_ERROR_STOP=on -v env_password="%POSTGRES_PASSWORD%" -f 0_runAllScripts.sql