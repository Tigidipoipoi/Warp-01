<?xml version="1.0" encoding="UTF-8"?>
<MiddleVR>
	<Kernel LogLevel="2" LogInSimulationFolder="0" EnableCrashHandler="0" Version="1.6.0" />
	<DeviceManager>
		<Driver Type="vrDriverDirectInput" />
		<Wand Name="Wand0" Driver="0" Axis="0" HorizontalAxis="0" HorizontalAxisScale="1" VerticalAxis="1" VerticalAxisScale="1" Buttons="0" Button0="0" Button1="1" Button2="2" Button3="3" Button4="4" Button5="5" />
	</DeviceManager>
	<DisplayManager Fullscreen="0" AlwaysOnTop="1" WindowBorders="0" ShowMouseCursor="0" VSync="1" AntiAliasing="0" ForceHideTaskbar="0" SaveRenderTarget="0" ChangeWorldScale="0" WorldScale="1">
		<Node3D Name="VRSystemCenterNode" Tag="VRSystemCenter" Parent="None" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
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
		<Viewport Name="Viewport_Front" Left="0" Top="0" Width="1400" Height="1050" Camera="CameraStereo_Front" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Left" Left="0" Top="0" Width="1400" Height="1050" Camera="CameraStereo_Left" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Right" Left="0" Top="0" Width="1400" Height="1050" Camera="CameraStereo_Right" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Floor" Left="0" Top="0" Width="1400" Height="1050" Camera="CameraStereo_Floor" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewport_Ceiling" Left="0" Top="0" Width="1400" Height="1050" Camera="CameraStereo_Ceiling" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
	</DisplayManager>
	<ClusterManager NVidiaSwapLock="0" DisableVSyncOnServer="1" ForceOpenGLConversion="1" BigBarrier="0" SimulateClusterLag="0" MultiGPUEnabled="0" ImageDistributionMaxPacketSize="8000">
		<ClusterServer Address="Cube_Master" Viewports="Viewport_Front" />
		<ClusterClient Address="Cube_Front" ClusterID="Client_Front" Viewports="Viewport_Front" />
		<ClusterClient Address="Cube_Left" ClusterID="Client_Left" Viewports="Viewport_Left" />
		<ClusterClient Address="Cube_Right" ClusterID="Client_Right" Viewports="Viewport_Right" />
		<ClusterClient Address="Cube_Floor" ClusterID="Client_Floor" Viewports="Viewport_Floor" />
		<ClusterClient Address="Cube_Ceiling" ClusterID="Client_Ceiling" Viewports="Viewport_Ceiling" />
	</ClusterManager>
</MiddleVR>
