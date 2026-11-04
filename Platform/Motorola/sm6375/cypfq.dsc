[Defines]
  VENDOR_NAME                    = Motorola
  PLATFORM_NAME                  = cypfq
  PLATFORM_GUID                  = c9bf6046-8ca3-4e5a-8e3e-e1248e46b80a
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/Motorola/sm6375/cypfq.fdf
  DEVICE_DXE_FV_COMPONENTS       = Platform/Motorola/sm6375/cypfq.fdf.inc

  # Enable A/B Slot Environment
  AB_SLOTS_SUPPORT               = TRUE

!include Platform/Qualcomm/sm6375/sm6375.dsc

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2400

  # GENI UART debug console (ttyMSM0), see earlycon=msm_geni_serial,0x04C8C000
  gQcomTokenSpaceGuid.PcdDebugUartPortBase|0x4c8c000

  # Simple Init
  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|399

  gRenegadePkgTokenSpaceGuid.PcdDeviceVendor|"Motorola"
  gRenegadePkgTokenSpaceGuid.PcdDeviceProduct|"moto g51 5G"
  gRenegadePkgTokenSpaceGuid.PcdDeviceCodeName|"cypfq"

# Produce the highest video mode in Shell and UiApp
[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|0 # /8 = column
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|0 #/19 = row
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|0
