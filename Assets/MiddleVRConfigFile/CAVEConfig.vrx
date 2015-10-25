<?xml version="1.0" encoding="UTF-8"?>
<MiddleVR>
	<Kernel LogLevel="2" LogInSimulationFolder="0" EnableCrashHandler="0" Version="1.6.1.f6" />
	<DeviceManager>
		<Driver Type="vrDriverDirectInput" />
		<Driver Type="vrDriverVRPN">
			<Tracker Address="Glasses@192.168.40.4:3883" ChannelIndex="0" ChannelsNb="1" Name="EGT4" Right="-X" Front="Z" Up="Y" NeutralPosition="0.000000,0.000000,0.000000" Scale="1" WaitForData="0" />
			<Tracker Address="F710@192.168.40.4:3883" ChannelIndex="0" ChannelsNb="1" Name="GamepadF710" Right="-X" Front="Z" Up="Y" NeutralPosition="0.000000,0.000000,0.000000" Scale="1" WaitForData="0" />
		</Driver>
		<Wand Name="Wand0" Driver="0" Axis="Controller (XBOX 360 For Windows).Axis" HorizontalAxis="0" HorizontalAxisScale="1" VerticalAxis="1" VerticalAxisScale="1" AxisDeadZone="0.3" Buttons="Controller (XBOX 360 For Windows).Buttons" Button0="0" Button1="1" Button2="2" Button3="3" Button4="4" Button5="5" />
	</DeviceManager>
	<DisplayManager Fullscreen="0" AlwaysOnTop="1" WindowBorders="0" ShowMouseCursor="0" VSync="1" GraphicsRenderer="1" AntiAliasing="0" ForceHideTaskbar="1" SaveRenderTarget="0" ChangeWorldScale="0" WorldScale="1">
		<Node3D Name="VRSystemCenterNode" Tag="VRSystemCenter" Parent="None" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<Node3D Name="HeadNode" Tag="Head" Parent="VRSystemCenterNode" Tracker="EGT4.Tracker0" IsFiltered="0" Filter="0" UseTrackerX="1" UseTrackerY="1" UseTrackerZ="1" UseTrackerYaw="1" UseTrackerPitch="1" UseTrackerRoll="1" />
		<CameraStereo Name="CameraFrontTop" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenFrontTop" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="4" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraFrontBottom" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenFrontBottom" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="4" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraRight" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenRight" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraLeft" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenLeft" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraFloorLeft" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenFloorLeft" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1.16667" InterEyeDistance="0.065" LinkConvergence="1" />
		<CameraStereo Name="CameraFloorRight" Parent="HeadNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" VerticalFOV="60" Near="0.1" Far="1000" Screen="ScreenFloorRight" ScreenDistance="1" UseViewportAspectRatio="0" AspectRatio="1.16667" InterEyeDistance="0.065" LinkConvergence="1" />
		<Node3D Name="Screens" Parent="VRSystemCenterNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,1.500000,1.500000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<Screen Name="ScreenFrontTop" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,1.500000,0.750000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" Width="6" Height="1.5" />
		<Screen Name="ScreenFrontBottom" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,1.500000,-0.750000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" Width="6" Height="1.5" />
		<Screen Name="ScreenLeft" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="-3.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.707107,0.707106" Width="3" Height="3" />
		<Screen Name="ScreenRight" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="3.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,-0.707107,0.707106" Width="3" Height="3" />
		<Screen Name="ScreenFloorLeft" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="-1.250000,0.000000,-1.500000" OrientationLocal="-0.707107,0.000000,0.000000,0.707106" Width="3.5" Height="3" />
		<Screen Name="ScreenFloorRight" Parent="Screens" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="1.250000,0.000000,-1.500000" OrientationLocal="-0.707229,0.000000,0.000000,0.706984" Width="3.5" Height="3" />
		<Camera Name="CameraServer" Parent="VRSystemCenterNode" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,-1.400000,3.800000" OrientationLocal="-0.342020,0.000000,0.000000,0.939693" VerticalFOV="60" Near="0.1" Far="1000" Screen="0" ScreenDistance="1" UseViewportAspectRatio="1" AspectRatio="1.33333" />
		<Node3D Name="HandRotation" Parent="VRSystemCenterNode" Tracker="GamepadF710.Tracker0" IsFiltered="0" Filter="0" UseTrackerX="1" UseTrackerY="1" UseTrackerZ="1" UseTrackerYaw="1" UseTrackerPitch="1" UseTrackerRoll="1" />
		<Node3D Name="Inter" Parent="HandRotation" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,1.000000,0.000000" />
		<Node3D Name="HandNode" Tag="Hand" Parent="Inter" Tracker="0" IsFiltered="0" Filter="0" PositionLocal="0.000000,0.000000,0.000000" OrientationLocal="0.000000,0.000000,0.000000,1.000000" />
		<Viewport Name="ViewportFrontTop" Left="0" Top="0" Width="4096" Height="1024" Camera="CameraFrontTop" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="ViewportFrontBottom" Left="0" Top="1024" Width="4096" Height="1024" Camera="CameraFrontBottom" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="ViewportLeft" Left="0" Top="0" Width="1200" Height="1200" Camera="CameraLeft" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="ViewportRight" Left="0" Top="0" Width="1200" Height="1200" Camera="CameraRight" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="ViewportFloorLeft" Left="0" Top="0" Width="1400" Height="1200" Camera="CameraFloorLeft" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="ViewportFloorRight" Left="0" Top="0" Width="1400" Height="1200" Camera="CameraFloorRight" Stereo="1" StereoMode="0" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
		<Viewport Name="Viewportserver" Left="0" Top="0" Width="1920" Height="960" Camera="CameraServer" Stereo="0" StereoMode="3" CompressSideBySide="0" StereoInvertEyes="0" OculusRiftWarping="0" UseHomography="0" />
	</DisplayManager>
	<ClusterManager NVidiaSwapLock="0" DisableVSyncOnServer="1" ForceOpenGLConversion="1" BigBarrier="0" SimulateClusterLag="0" MultiGPUEnabled="1" ImageDistributionMaxPacketSize="8000" ClientConnectionTimeout="60">
		<ClusterServer Address="192.168.40.2" Viewports="Viewportserver" />
		<ClusterClient Address="192.168.40.13" ClusterID="GPU_Front_Top" Viewports="ViewportFrontTop" CPUAffinity="8,9,10,11,12,13,14,15" />
		<ClusterClient Address="192.168.40.13" ClusterID="GPU_Front_Bottom" Viewports="ViewportFrontBottom" CPUAffinity="0,1,2,3,4,5,6,7" />
		<ClusterClient Address="192.168.40.12" ClusterID="GPU_Right" Viewports="ViewportRight" />
		<ClusterClient Address="192.168.40.14" ClusterID="GPU_FLoor_Left" Viewports="ViewportFloorLeft" />
		<ClusterClient Address="192.168.40.15" ClusterID="GPU_Floor_Right" Viewports="ViewportFloorRight" />
		<ClusterClient Address="192.168.40.11" ClusterID="GPU_Left" Viewports="ViewportLeft" />
	</ClusterManager>
</MiddleVR>
