// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:9874,x:33358,y:32488,varname:node_9874,prsc:2|emission-1546-RGB,voffset-8282-OUT;n:type:ShaderForge.SFN_Tex2d,id:1546,x:32444,y:32567,ptovrint:False,ptlb:map1,ptin:_map1,varname:node_1546,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e6687d72b827b3b4b9430ffdaf33535b,ntxv:0,isnm:False|UVIN-9551-OUT;n:type:ShaderForge.SFN_Tex2d,id:8434,x:32428,y:32747,ptovrint:False,ptlb:map2,ptin:_map2,varname:node_8434,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ddc3aeaa2618ed149aaab43a3e778d84,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:633,x:32428,y:32935,ptovrint:False,ptlb:map3,ptin:_map3,varname:node_633,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7ac09fc759df1084293a340b799ac4b1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:7293,x:32094,y:32449,varname:node_7293,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:9551,x:32283,y:32459,varname:node_9551,prsc:2|A-7838-OUT,B-7293-UVOUT,C-8014-OUT;n:type:ShaderForge.SFN_Multiply,id:7838,x:32441,y:32292,varname:node_7838,prsc:2|A-8621-R,B-6267-OUT;n:type:ShaderForge.SFN_Panner,id:2859,x:32181,y:32141,varname:node_2859,prsc:2,spu:1,spv:1;n:type:ShaderForge.SFN_Tex2dAsset,id:4161,x:32438,y:31805,ptovrint:False,ptlb:UVImpact,ptin:_UVImpact,varname:node_4161,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:091bf43365066734a96bc327e0773c3b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector2,id:6267,x:32276,y:32328,varname:node_6267,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_Tex2d,id:3019,x:32716,y:32139,varname:node_9217,prsc:2,tex:091bf43365066734a96bc327e0773c3b,ntxv:0,isnm:False|UVIN-3723-UVOUT,TEX-4161-TEX;n:type:ShaderForge.SFN_Panner,id:3723,x:32716,y:31987,varname:node_3723,prsc:2,spu:-0.3,spv:0.4;n:type:ShaderForge.SFN_Multiply,id:8014,x:32716,y:32297,varname:node_8014,prsc:2|A-3019-R,B-6267-OUT;n:type:ShaderForge.SFN_Tex2d,id:8621,x:32441,y:32121,varname:node_8621,prsc:2,tex:091bf43365066734a96bc327e0773c3b,ntxv:0,isnm:False|UVIN-2859-UVOUT,TEX-4161-TEX;n:type:ShaderForge.SFN_NormalVector,id:3659,x:32901,y:32838,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:3266,x:32901,y:32705,varname:node_3266,prsc:2|A-1546-R,B-3659-OUT,C-4890-OUT;n:type:ShaderForge.SFN_Add,id:9645,x:33157,y:32795,varname:node_9645,prsc:2|A-3266-OUT,B-351-OUT;n:type:ShaderForge.SFN_Vector1,id:4890,x:32660,y:32932,varname:node_4890,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Time,id:6608,x:32074,y:33269,varname:node_6608,prsc:2;n:type:ShaderForge.SFN_Sin,id:4024,x:32809,y:33140,varname:node_4024,prsc:2|IN-91-OUT;n:type:ShaderForge.SFN_Multiply,id:91,x:32626,y:33140,varname:node_91,prsc:2|A-4933-OUT,B-6250-OUT;n:type:ShaderForge.SFN_Vector1,id:6250,x:32429,y:33281,varname:node_6250,prsc:2,v1:0.23;n:type:ShaderForge.SFN_Append,id:351,x:33028,y:33140,varname:node_351,prsc:2|A-4024-OUT,B-4847-OUT,C-3519-OUT;n:type:ShaderForge.SFN_Multiply,id:1541,x:32626,y:33301,varname:node_1541,prsc:2|A-7620-OUT,B-8090-OUT;n:type:ShaderForge.SFN_Vector1,id:7620,x:32429,y:33442,varname:node_7620,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Sin,id:4847,x:32809,y:33301,varname:node_4847,prsc:2|IN-1541-OUT;n:type:ShaderForge.SFN_Multiply,id:1474,x:32626,y:33447,varname:node_1474,prsc:2|A-7435-OUT,B-2816-OUT;n:type:ShaderForge.SFN_Vector1,id:7435,x:32429,y:33588,varname:node_7435,prsc:2,v1:0.35;n:type:ShaderForge.SFN_Sin,id:3519,x:32809,y:33447,varname:node_3519,prsc:2|IN-1474-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:2507,x:32074,y:33122,varname:node_2507,prsc:2;n:type:ShaderForge.SFN_Add,id:4933,x:32269,y:33122,varname:node_4933,prsc:2|A-2507-X,B-6608-TDB;n:type:ShaderForge.SFN_Add,id:8090,x:32269,y:33247,varname:node_8090,prsc:2|A-2507-Y,B-6608-TDB;n:type:ShaderForge.SFN_Add,id:2816,x:32269,y:33370,varname:node_2816,prsc:2|A-2507-Z,B-6608-TDB;n:type:ShaderForge.SFN_Multiply,id:8282,x:33225,y:33140,varname:node_8282,prsc:2|A-351-OUT,B-694-OUT;n:type:ShaderForge.SFN_Vector1,id:694,x:33028,y:33301,varname:node_694,prsc:2,v1:3;proporder:1546-8434-633-4161;pass:END;sub:END;*/

Shader "Custom/slug" {
    Properties {
        _map1 ("map1", 2D) = "white" {}
        _map2 ("map2", 2D) = "white" {}
        _map3 ("map3", 2D) = "white" {}
        _UVImpact ("UVImpact", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _map1; uniform float4 _map1_ST;
            uniform sampler2D _UVImpact; uniform float4 _UVImpact_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_6608 = _Time + _TimeEditor;
                float3 node_351 = float3(sin(((mul(_Object2World, v.vertex).r+node_6608.b)*0.23)),sin((0.3*(mul(_Object2World, v.vertex).g+node_6608.b))),sin((0.35*(mul(_Object2World, v.vertex).b+node_6608.b))));
                v.vertex.xyz += (node_351*3.0);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 node_1262 = _Time + _TimeEditor;
                float2 node_2859 = (i.uv0+node_1262.g*float2(1,1));
                float4 node_8621 = tex2D(_UVImpact,TRANSFORM_TEX(node_2859, _UVImpact));
                float2 node_6267 = float2(1,1);
                float2 node_3723 = (i.uv0+node_1262.g*float2(-0.3,0.4));
                float4 node_9217 = tex2D(_UVImpact,TRANSFORM_TEX(node_3723, _UVImpact));
                float2 node_9551 = ((node_8621.r*node_6267)+i.uv0+(node_9217.r*node_6267));
                float4 _map1_var = tex2D(_map1,TRANSFORM_TEX(node_9551, _map1));
                float3 emissive = _map1_var.rgb;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 node_6608 = _Time + _TimeEditor;
                float3 node_351 = float3(sin(((mul(_Object2World, v.vertex).r+node_6608.b)*0.23)),sin((0.3*(mul(_Object2World, v.vertex).g+node_6608.b))),sin((0.35*(mul(_Object2World, v.vertex).b+node_6608.b))));
                v.vertex.xyz += (node_351*3.0);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
