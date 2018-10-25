@REM Store existing Nitro env vars and set to this conda env
@REM so other Nitro installs don't pollute the environment


@if defined NITF_PLUGIN_PATH (
    set "_CONDA_SET_NITF_PLUGIN_PATH=%NITF_PLUGIN_PATH%"
)

@REM Support plugins if the plugin directory exists
@REM i.e if it has been manually created by the user
@set "NITF_PLUGIN_PATH=%CONDA_PREFIX%\Library\lib\nitroplugins"
@if not exist %NITF_PLUGIN_PATH% (
     set "NITF_PLUGIN_PATH="
)
