<?xml version="1.0" encoding="UTF-8"?>
<MiddleVR>
	<Kernel LogLevel="2" LogInSimulationFolder="0" EnableCrashHandler="0" Version="1.6.1.f6" />
	<DeviceManager>
		<Driver Type="vrDriverDirectInput" />
		<Wand Name="Wand0" Driver="0" Axis="Controller (XBOX 360 For Windows).Axis" HorizontalAxis="0" HorizontalAxisScale="1" VerticalAxis="1" VerticalAxisScale="-1" AxisDeadZone="0.3" Buttons="Controller (XBOX 360 For Windows).Buttons" Button0="0" Button1="1" Button2="2" Button3="3" Button4="4" Button5="5" />
	</DeviceManager>
	<DisplayManager Fullscreen="0" AlwaysOnTop="1" WindowBorders="0" ShowMouseCursor="0" VSync="1" GraphicsRenderer="1" AntiAliasing="0" ForceHideTaskbar="0" SaveRenderTarget="0" ChangeWorldScale="0" WorldScale="1">
		<Node3D Name="VRSystemCenterNode" Tag="VRSystemCenter" Parent="None" Tracker="TrackerSimulatorMouse0.Tracker" IsFiltered="0" Filter="0" UseTrackerX="1" UseTrackerY="1" UseTrackerZ="1" UseTrackerYaw="1" UseTrackerPitch="1" UseTrackerRoll="1" />
		<Node3D Name="HandNode" Tag="Hand" Parent="VRSystemCenterNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<Node3D Name="Screens" Parent="VRSystemCenterNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,1.160000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<Screen Name="Front" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,1.200000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" Width="3.2" Height="2.4" />
		<Screen Name="Left" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="-1.600000,-0.400000,0.000000" OrientationLocal="0.000000,0.000000,0.707107,0.707106" Width="3.2" Height="2.4" />
		<Screen Name="Right" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="1.600000,-0.400000,0.000000" OrientationLocal="0.000000,0.000000,-0.707107,0.707106" Width="3.2" Height="2.4" />
		<Screen Name="Floor" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,-1.200000" OrientationLocal="-0.707107,0.000000,0.000000,0.707106" Width="3.2" Height="2.4" />
		<Screen Name="Ceiling" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,1.200000" OrientationLocal="0.707107,0.000000,0.000000,0.707106" Width="3.2" Height="2.4" />
		<Node3D Name="HeadNode" Parent="VRSystemCenterNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,1.700000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<CameraStereo Name="CameraStereo_Front" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="3000" Screen="Front" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1.25" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraStereo_Ceiling" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="3000" Screen="Ceiling" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1" InterEyeDistance="0.065" LinkConvergence="1" />
		<Node3D Name="Base_Floor" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<CameraStereo Name="CameraStereo_Floor" Parent="Base_Floor" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="3000" Screen="Floor" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraStereo_Right" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="3000" Screen="Right" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1.25" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraStereo_Left" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="3000" Screen="Left" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1.25" InterEyeDistance="0.065" LinkConvergence="1" />
		<Viewport Name="Viewport_Front" Left="320" Top="200" Width="320" Height="200" Camera="CameraStereo_Front" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Left" Left="0" Top="200" Width="320" Height="200" Camera="CameraStereo_Left" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Right" Left="640" Top="200" Width="320" Height="200" Camera="CameraStereo_Right" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Floor" Left="320" Top="400" Width="320" Height="200" Camera="CameraStereo_Floor" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Ceiling" Left="320" Top="0" Width="320" Height="200" Camera="CameraStereo_Ceiling" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
	</DisplayManager>
	<Scripts>
		<Script Type="TrackerSimulatorMouse" Name="TrackerSimulatorMouse0" />
	</Scripts>
	<ClusterManager NVidiaSwapLock="0" DisableVSyncOnServer="1" ForceOpenGLConversion="1" BigBarrier="0" SimulateClusterLag="0" MultiGPUEnabled="0" ImageDistributionMaxPacketSize="8000" ClientConnectionTimeout="60">
		<ClusterServer Address="localhost" Viewports="Viewport_Front" />
		<ClusterClient Address="localhost" ClusterID="Client0" Viewports="Viewport_Left" />
		<ClusterClient Address="localhost" ClusterID="Client1" Viewports="Viewport_Right" />
		<ClusterClient Address="localhost" ClusterID="Client2" Viewports="Viewport_Floor" />
		<ClusterClient Address="localhost" ClusterID="Client3" Viewports="Viewport_Ceiling" />
	</ClusterManager>
</MiddleVR>
