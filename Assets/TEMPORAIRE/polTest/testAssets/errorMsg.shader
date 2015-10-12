// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|emission-6-OUT,voffset-28-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33403,y:32546,ptlb:text,ptin:_text,tex:5a296b6d09babdd40b2b76ca29a97179,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4,x:33403,y:32733,ptlb:noise,ptin:_noise,tex:31f5a8611c4ed1245b18456206e798dc,ntxv:0,isnm:False|UVIN-5-UVOUT;n:type:ShaderForge.SFN_Panner,id:5,x:33586,y:32733,spu:0,spv:5;n:type:ShaderForge.SFN_Multiply,id:6,x:33154,y:32733|A-2-RGB,B-4-R;n:type:ShaderForge.SFN_Multiply,id:28,x:33154,y:32957|A-4-G,B-31-OUT,C-70-OUT;n:type:ShaderForge.SFN_ValueProperty,id:31,x:33361,y:32974,ptlb:displace,ptin:_displace,glob:False,v1:0.2;n:type:ShaderForge.SFN_Vector3,id:70,x:32997,y:33141,v1:0,v2:1,v3:0;proporder:2-4-31;pass:END;sub:END;*/

Shader "Custom/errorMsg" {
    Properties {
        _text ("text", 2D) = "white" {}
        _noise ("noise", 2D) = "white" {}
        _displace ("displace", Float ) = 0.2
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _text; uniform float4 _text_ST;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _displace;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                float4 node_80 = _Time + _TimeEditor;
                float2 node_79 = o.uv0;
                float2 node_5 = (node_79.rg+node_80.g*float2(0,5));
                float4 node_4 = tex2Dlod(_noise,float4(TRANSFORM_TEX(node_5, _noise),0.0,0));
                v.vertex.xyz += (node_4.g*_displace*float3(0,1,0));
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_79 = i.uv0;
                float4 node_80 = _Time + _TimeEditor;
                float2 node_5 = (node_79.rg+node_80.g*float2(0,5));
                float4 node_4 = tex2D(_noise,TRANSFORM_TEX(node_5, _noise));
                float3 emissive = (tex2D(_text,TRANSFORM_TEX(node_79.rg, _text)).rgb*node_4.r);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            
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
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _displace;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float2 uv0 : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                float4 node_82 = _Time + _TimeEditor;
                float2 node_5 = (o.uv0.rg+node_82.g*float2(0,5));
                float4 node_4 = tex2Dlod(_noise,float4(TRANSFORM_TEX(node_5, _noise),0.0,0));
                v.vertex.xyz += (node_4.g*_displace*float3(0,1,0));
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
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
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _displace;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                float4 node_84 = _Time + _TimeEditor;
                float2 node_5 = (o.uv0.rg+node_84.g*float2(0,5));
                float4 node_4 = tex2Dlod(_noise,float4(TRANSFORM_TEX(node_5, _noise),0.0,0));
                v.vertex.xyz += (node_4.g*_displace*float3(0,1,0));
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
