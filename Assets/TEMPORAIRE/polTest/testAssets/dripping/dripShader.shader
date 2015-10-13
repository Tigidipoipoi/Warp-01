// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:8485,x:32827,y:32665,varname:node_8485,prsc:2|diff-1219-OUT,emission-1219-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5726,x:32019,y:32660,varname:node_5726,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:4396,x:32196,y:32660,varname:node_4396,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5726-XYZ;n:type:ShaderForge.SFN_Tex2d,id:5921,x:32391,y:32660,varname:node_5921,prsc:2,tex:af0ee855115198c4faa85f52e6b3f056,ntxv:0,isnm:False|UVIN-4396-OUT,TEX-7768-TEX;n:type:ShaderForge.SFN_Tex2d,id:8513,x:32391,y:32854,varname:_texture_copy,prsc:2,tex:af0ee855115198c4faa85f52e6b3f056,ntxv:0,isnm:False|UVIN-3502-OUT,TEX-7768-TEX;n:type:ShaderForge.SFN_ComponentMask,id:3502,x:32196,y:32854,varname:node_3502,prsc:2,cc1:2,cc2:1,cc3:-1,cc4:-1|IN-5726-XYZ;n:type:ShaderForge.SFN_Lerp,id:1219,x:32639,y:32660,varname:node_1219,prsc:2|A-5921-RGB,B-8513-RGB,T-1007-OUT;n:type:ShaderForge.SFN_NormalVector,id:8502,x:32196,y:33025,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:3978,x:32391,y:33025,varname:node_3978,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8502-OUT;n:type:ShaderForge.SFN_Abs,id:1007,x:32568,y:33025,varname:node_1007,prsc:2|IN-3978-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7768,x:32196,y:32405,ptovrint:False,ptlb:texture,ptin:_texture,varname:node_7768,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:af0ee855115198c4faa85f52e6b3f056,ntxv:0,isnm:False;proporder:7768;pass:END;sub:END;*/

Shader "Custom/dripShader" {
    Properties {
        _texture ("texture", 2D) = "white" {}
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _texture; uniform float4 _texture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float2 node_4396 = i.posWorld.rgb.rg;
                float4 node_5921 = tex2D(_texture,TRANSFORM_TEX(node_4396, _texture));
                float2 node_3502 = i.posWorld.rgb.bg;
                float4 _texture_copy = tex2D(_texture,TRANSFORM_TEX(node_3502, _texture));
                float3 node_1219 = lerp(node_5921.rgb,_texture_copy.rgb,abs(i.normalDir.r));
                float3 emissive = node_1219;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
