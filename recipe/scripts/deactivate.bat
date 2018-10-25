@REM Restore previous Nitro env vars if they were set


@set "NITF_PLUGIN_PATH="
@if defined _CONDA_SET_NITF_PLUGIN_PATH (
  set "NITF_PLUGIN_PATH=%_CONDA_SET_NITF_PLUGIN_PATH%"
  set "_CONDA_SET_NITF_PLUGIN_PATH="
)
