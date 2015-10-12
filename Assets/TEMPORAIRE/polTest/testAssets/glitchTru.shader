// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:2,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32671,y:32578|diff-3-RGB,emission-3-RGB,custl-97-OUT,voffset-7-OUT;n:type:ShaderForge.SFN_NormalVector,id:2,x:33142,y:32776,pt:False;n:type:ShaderForge.SFN_Tex2d,id:3,x:33142,y:32578,ptlb:displace,ptin:_displace,tex:a181ca8e3c62f3e4b8f183f6c586b032,ntxv:0,isnm:False|UVIN-6-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:4,x:33480,y:32578,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-5-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:5,x:33711,y:32578;n:type:ShaderForge.SFN_Panner,id:6,x:33314,y:32578,spu:5,spv:5|UVIN-4-OUT;n:type:ShaderForge.SFN_Multiply,id:7,x:32936,y:32759|A-3-RGB,B-2-OUT,C-37-OUT;n:type:ShaderForge.SFN_ValueProperty,id:37,x:33142,y:32951,ptlb:intensity,ptin:_intensity,glob:False,v1:0.2;n:type:ShaderForge.SFN_LightVector,id:57,x:33602,y:32838;n:type:ShaderForge.SFN_ViewVector,id:58,x:33602,y:32970;n:type:ShaderForge.SFN_Distance,id:59,x:33417,y:32838|A-57-OUT,B-58-OUT;n:type:ShaderForge.SFN_RemapRange,id:60,x:33406,y:32970,frmn:0,frmx:2,tomn:1,tomx:-1|IN-59-OUT;n:type:ShaderForge.SFN_Multiply,id:97,x:32974,y:33019|A-3-R,B-60-OUT;proporder:3-37;pass:END;sub:END;*/

Shader "Custom/glitchTru" {
    Properties {
        _displace ("displace", 2D) = "white" {}
        _intensity ("intensity", Float ) = 0.2
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _displace; uniform float4 _displace_ST;
            uniform float _intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_110 = _Time + _TimeEditor;
                float2 node_6 = (mul(_Object2World, v.vertex).rgb.rb+node_110.g*float2(5,5));
                float4 node_3 = tex2Dlod(_displace,float4(TRANSFORM_TEX(node_6, _displace),0.0,0));
                v.vertex.xyz += (node_3.rgb*v.normal*_intensity);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 node_110 = _Time + _TimeEditor;
                float2 node_6 = (i.posWorld.rgb.rb+node_110.g*float2(5,5));
                float4 node_3 = tex2D(_displace,TRANSFORM_TEX(node_6, _displace));
                float3 emissive = node_3.rgb;
                float node_97 = (node_3.r*(distance(lightDirection,viewDirection)*-1.0+1.0));
                float3 finalColor = emissive + float3(node_97,node_97,node_97);
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _displace; uniform float4 _displace_ST;
            uniform float _intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_111 = _Time + _TimeEditor;
                float2 node_6 = (mul(_Object2World, v.vertex).rgb.rb+node_111.g*float2(5,5));
                float4 node_3 = tex2Dlod(_displace,float4(TRANSFORM_TEX(node_6, _displace),0.0,0));
                v.vertex.xyz += (node_3.rgb*v.normal*_intensity);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float4 node_111 = _Time + _TimeEditor;
                float2 node_6 = (i.posWorld.rgb.rb+node_111.g*float2(5,5));
                float4 node_3 = tex2D(_displace,TRANSFORM_TEX(node_6, _displace));
                float node_97 = (node_3.r*(distance(lightDirection,viewDirection)*-1.0+1.0));
                float3 finalColor = float3(node_97,node_97,node_97);
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            Cull Off
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _displace; uniform float4 _displace_ST;
            uniform float _intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float4 posWorld : TEXCOORD5;
                float3 normalDir : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_112 = _Time + _TimeEditor;
                float2 node_6 = (mul(_Object2World, v.vertex).rgb.rb+node_112.g*float2(5,5));
                float4 node_3 = tex2Dlod(_displace,float4(TRANSFORM_TEX(node_6, _displace),0.0,0));
                v.vertex.xyz += (node_3.rgb*v.normal*_intensity);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _displace; uniform float4 _displace_ST;
            uniform float _intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_113 = _Time + _TimeEditor;
                float2 node_6 = (mul(_Object2World, v.vertex).rgb.rb+node_113.g*float2(5,5));
                float4 node_3 = tex2Dlod(_displace,float4(TRANSFORM_TEX(node_6, _displace),0.0,0));
                v.vertex.xyz += (node_3.rgb*v.normal*_intensity);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
