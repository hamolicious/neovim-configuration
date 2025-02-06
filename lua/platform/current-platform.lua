Platform = {
  UNKNOWN = "UNKNOWN",
  WORK_MAC = "WORK_MAC",
  UBUNTU_PC = "UBUNTU_PC",
  UBUNTU_LAPTOP = "UBUNTU_LAPTOP",
  CONTAINER = "CONTAINER",
}

function CurrentPlatform()
  return os.getenv("NVIM_PLATFORM") or Platform.UNKNOWN
end

function IsCurrentPlatformOneOf(...)
  local currentPlatform = CurrentPlatform()
  for _, platform in ipairs({ ... }) do
    if platform == currentPlatform then
      return true
    end
  end
  return false
end
