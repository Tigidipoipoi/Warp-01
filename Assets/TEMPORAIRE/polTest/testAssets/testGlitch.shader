// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:Unlit/Texture,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:11,ofsu:11,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32490,y:32707|emission-3-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:2,x:33214,y:32871,ptlb:glitch texture,ptin:_glitchtexture,glob:False;n:type:ShaderForge.SFN_Tex2d,id:3,x:32727,y:32810,ntxv:0,isnm:False|UVIN-9-UVOUT,TEX-2-TEX;n:type:ShaderForge.SFN_ScreenPos,id:9,x:33203,y:32520,sctp:0;n:type:ShaderForge.SFN_Time,id:11,x:32996,y:32380;n:type:ShaderForge.SFN_Multiply,id:12,x:33006,y:32619|A-11-T,B-21-OUT;n:type:ShaderForge.SFN_Vector2,id:19,x:33304,y:32725,v1:0.125,v2:0.33;n:type:ShaderForge.SFN_Add,id:20,x:32824,y:32574|A-12-OUT,B-9-UVOUT;n:type:ShaderForge.SFN_Vector1,id:21,x:32824,y:32436,v1:5;proporder:2;pass:END;sub:END;*/

Shader "Shader Forge/testGlitch" {
    Properties {
        _glitchtexture ("glitch texture", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            Offset 11, 11
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _glitchtexture; uniform float4 _glitchtexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 screenPos : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
////// Lighting:
////// Emissive:
                float2 node_9 = i.screenPos;
                float3 emissive = tex2D(_glitchtexture,TRANSFORM_TEX(node_9.rg, _glitchtexture)).rgb;
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Unlit/Texture"
    CustomEditor "ShaderForgeMaterialInspector"
}
