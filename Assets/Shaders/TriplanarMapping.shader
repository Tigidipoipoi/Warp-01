// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2865,x:32898,y:32709,varname:node_2865,prsc:2|diff-875-OUT,spec-8044-OUT,gloss-1130-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:875,x:32210,y:32152,varname:node_875,prsc:2,chbt:0|M-4794-OUT,R-9962-R,G-8141-G,B-9878-B;n:type:ShaderForge.SFN_Tex2d,id:9962,x:31854,y:32114,ptovrint:False,ptlb:Texture YZ,ptin:_TextureYZ,varname:node_9962,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5905-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8141,x:31854,y:32286,ptovrint:False,ptlb:Texture ZX (horizontal),ptin:_TextureZXhorizontal,varname:_TextureR_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6764-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9878,x:31854,y:32457,ptovrint:False,ptlb:Texture XY,ptin:_TextureXY,varname:_TextureR_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3873-UVOUT;n:type:ShaderForge.SFN_Append,id:1081,x:31163,y:32116,cmnt: YZ projection,varname:node_1081,prsc:2|A-5675-Y,B-5675-Z;n:type:ShaderForge.SFN_Append,id:1036,x:31163,y:32288,cmnt: ZX projection,varname:node_1036,prsc:2|A-5675-Z,B-5675-X;n:type:ShaderForge.SFN_Append,id:8072,x:31163,y:32459,cmnt: XY projection,varname:node_8072,prsc:2|A-5675-X,B-5675-Y;n:type:ShaderForge.SFN_FragmentPosition,id:5675,x:30971,y:32288,varname:node_5675,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4794,x:31834,y:31846,varname:node_4794,prsc:2|A-8801-OUT,B-8801-OUT;n:type:ShaderForge.SFN_Abs,id:8801,x:31596,y:31846,varname:node_8801,prsc:2|IN-7536-OUT;n:type:ShaderForge.SFN_NormalVector,id:7536,x:31344,y:31846,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:8044,x:32447,y:32955,ptovrint:False,ptlb:Metalic,ptin:_Metalic,varname:node_8044,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1130,x:32447,y:33055,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metalic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Rotator,id:3873,x:31637,y:32457,varname:node_3873,prsc:2|UVIN-8072-OUT,ANG-1920-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5167,x:31273,y:32552,ptovrint:False,ptlb:B rotation,ptin:_Brotation,varname:node_5167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Rotator,id:5905,x:31630,y:32114,varname:node_5905,prsc:2|UVIN-1081-OUT,ANG-2543-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3285,x:31273,y:32211,ptovrint:False,ptlb:R rotation,ptin:_Rrotation,varname:_Brotationradian_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Rotator,id:6764,x:31630,y:32286,varname:node_6764,prsc:2|UVIN-1036-OUT,ANG-5023-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4869,x:31273,y:32386,ptovrint:False,ptlb:G rotation,ptin:_Grotation,varname:_Rrotationradian_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:2946,x:30826,y:31938,varname:node_2946,prsc:2,v1:180;n:type:ShaderForge.SFN_Pi,id:7001,x:30859,y:31835,varname:node_7001,prsc:2;n:type:ShaderForge.SFN_Divide,id:2943,x:30993,y:31835,cmnt: convert radian to degrees,varname:node_2943,prsc:2|A-7001-OUT,B-2946-OUT;n:type:ShaderForge.SFN_Multiply,id:2543,x:31455,y:32149,varname:node_2543,prsc:2|A-2943-OUT,B-3285-OUT;n:type:ShaderForge.SFN_Multiply,id:5023,x:31455,y:32322,varname:node_5023,prsc:2|A-2943-OUT,B-4869-OUT;n:type:ShaderForge.SFN_Multiply,id:1920,x:31455,y:32491,varname:node_1920,prsc:2|A-2943-OUT,B-5167-OUT;proporder:9962-3285-8141-4869-9878-5167-8044-1130;pass:END;sub:END;*/

Shader "Shader Forge/triplanarMapping" {
    Properties {
        _TextureYZ ("Texture YZ", 2D) = "white" {}
        _Rrotation ("R rotation", Float ) = 0
        _TextureZXhorizontal ("Texture ZX (horizontal)", 2D) = "white" {}
        _Grotation ("G rotation", Float ) = 0
        _TextureXY ("Texture XY", 2D) = "white" {}
        _Brotation ("B rotation", Float ) = 0
        _Metalic ("Metalic", Range(0, 1)) = 0
        _Gloss ("Gloss", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TextureYZ; uniform float4 _TextureYZ_ST;
            uniform sampler2D _TextureZXhorizontal; uniform float4 _TextureZXhorizontal_ST;
            uniform sampler2D _TextureXY; uniform float4 _TextureXY_ST;
            uniform float _Metalic;
            uniform float _Gloss;
            uniform float _Brotation;
            uniform float _Rrotation;
            uniform float _Grotation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                UnityGI gi = UnityGlobalIllumination (d, 1, gloss, normalDirection);
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 node_8801 = abs(i.normalDir);
                float3 node_4794 = (node_8801*node_8801);
                float node_2943 = (3.141592654/180.0); //  convert radian to degrees
                float node_5905_ang = (node_2943*_Rrotation);
                float node_5905_spd = 1.0;
                float node_5905_cos = cos(node_5905_spd*node_5905_ang);
                float node_5905_sin = sin(node_5905_spd*node_5905_ang);
                float2 node_5905_piv = float2(0.5,0.5);
                float2 node_5905 = (mul(float2(i.posWorld.g,i.posWorld.b)-node_5905_piv,float2x2( node_5905_cos, -node_5905_sin, node_5905_sin, node_5905_cos))+node_5905_piv);
                float4 _TextureYZ_var = tex2D(_TextureYZ,TRANSFORM_TEX(node_5905, _TextureYZ));
                float node_6764_ang = (node_2943*_Grotation);
                float node_6764_spd = 1.0;
                float node_6764_cos = cos(node_6764_spd*node_6764_ang);
                float node_6764_sin = sin(node_6764_spd*node_6764_ang);
                float2 node_6764_piv = float2(0.5,0.5);
                float2 node_6764 = (mul(float2(i.posWorld.b,i.posWorld.r)-node_6764_piv,float2x2( node_6764_cos, -node_6764_sin, node_6764_sin, node_6764_cos))+node_6764_piv);
                float4 _TextureZXhorizontal_var = tex2D(_TextureZXhorizontal,TRANSFORM_TEX(node_6764, _TextureZXhorizontal));
                float node_3873_ang = (node_2943*_Brotation);
                float node_3873_spd = 1.0;
                float node_3873_cos = cos(node_3873_spd*node_3873_ang);
                float node_3873_sin = sin(node_3873_spd*node_3873_ang);
                float2 node_3873_piv = float2(0.5,0.5);
                float2 node_3873 = (mul(float2(i.posWorld.r,i.posWorld.g)-node_3873_piv,float2x2( node_3873_cos, -node_3873_sin, node_3873_sin, node_3873_cos))+node_3873_piv);
                float4 _TextureXY_var = tex2D(_TextureXY,TRANSFORM_TEX(node_3873, _TextureXY));
                float node_875 = (node_4794.r*_TextureYZ_var.r + node_4794.g*_TextureZXhorizontal_var.g + node_4794.b*_TextureXY_var.b);
                float3 diffuseColor = float3(node_875,node_875,node_875); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metalic, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
                float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TextureYZ; uniform float4 _TextureYZ_ST;
            uniform sampler2D _TextureZXhorizontal; uniform float4 _TextureZXhorizontal_ST;
            uniform sampler2D _TextureXY; uniform float4 _TextureXY_ST;
            uniform float _Metalic;
            uniform float _Gloss;
            uniform float _Brotation;
            uniform float _Rrotation;
            uniform float _Grotation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 node_8801 = abs(i.normalDir);
                float3 node_4794 = (node_8801*node_8801);
                float node_2943 = (3.141592654/180.0); //  convert radian to degrees
                float node_5905_ang = (node_2943*_Rrotation);
                float node_5905_spd = 1.0;
                float node_5905_cos = cos(node_5905_spd*node_5905_ang);
                float node_5905_sin = sin(node_5905_spd*node_5905_ang);
                float2 node_5905_piv = float2(0.5,0.5);
                float2 node_5905 = (mul(float2(i.posWorld.g,i.posWorld.b)-node_5905_piv,float2x2( node_5905_cos, -node_5905_sin, node_5905_sin, node_5905_cos))+node_5905_piv);
                float4 _TextureYZ_var = tex2D(_TextureYZ,TRANSFORM_TEX(node_5905, _TextureYZ));
                float node_6764_ang = (node_2943*_Grotation);
                float node_6764_spd = 1.0;
                float node_6764_cos = cos(node_6764_spd*node_6764_ang);
                float node_6764_sin = sin(node_6764_spd*node_6764_ang);
                float2 node_6764_piv = float2(0.5,0.5);
                float2 node_6764 = (mul(float2(i.posWorld.b,i.posWorld.r)-node_6764_piv,float2x2( node_6764_cos, -node_6764_sin, node_6764_sin, node_6764_cos))+node_6764_piv);
                float4 _TextureZXhorizontal_var = tex2D(_TextureZXhorizontal,TRANSFORM_TEX(node_6764, _TextureZXhorizontal));
                float node_3873_ang = (node_2943*_Brotation);
                float node_3873_spd = 1.0;
                float node_3873_cos = cos(node_3873_spd*node_3873_ang);
                float node_3873_sin = sin(node_3873_spd*node_3873_ang);
                float2 node_3873_piv = float2(0.5,0.5);
                float2 node_3873 = (mul(float2(i.posWorld.r,i.posWorld.g)-node_3873_piv,float2x2( node_3873_cos, -node_3873_sin, node_3873_sin, node_3873_cos))+node_3873_piv);
                float4 _TextureXY_var = tex2D(_TextureXY,TRANSFORM_TEX(node_3873, _TextureXY));
                float node_875 = (node_4794.r*_TextureYZ_var.r + node_4794.g*_TextureZXhorizontal_var.g + node_4794.b*_TextureXY_var.b);
                float3 diffuseColor = float3(node_875,node_875,node_875); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metalic, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TextureYZ; uniform float4 _TextureYZ_ST;
            uniform sampler2D _TextureZXhorizontal; uniform float4 _TextureZXhorizontal_ST;
            uniform sampler2D _TextureXY; uniform float4 _TextureXY_ST;
            uniform float _Metalic;
            uniform float _Gloss;
            uniform float _Brotation;
            uniform float _Rrotation;
            uniform float _Grotation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float3 node_8801 = abs(i.normalDir);
                float3 node_4794 = (node_8801*node_8801);
                float node_2943 = (3.141592654/180.0); //  convert radian to degrees
                float node_5905_ang = (node_2943*_Rrotation);
                float node_5905_spd = 1.0;
                float node_5905_cos = cos(node_5905_spd*node_5905_ang);
                float node_5905_sin = sin(node_5905_spd*node_5905_ang);
                float2 node_5905_piv = float2(0.5,0.5);
                float2 node_5905 = (mul(float2(i.posWorld.g,i.posWorld.b)-node_5905_piv,float2x2( node_5905_cos, -node_5905_sin, node_5905_sin, node_5905_cos))+node_5905_piv);
                float4 _TextureYZ_var = tex2D(_TextureYZ,TRANSFORM_TEX(node_5905, _TextureYZ));
                float node_6764_ang = (node_2943*_Grotation);
                float node_6764_spd = 1.0;
                float node_6764_cos = cos(node_6764_spd*node_6764_ang);
                float node_6764_sin = sin(node_6764_spd*node_6764_ang);
                float2 node_6764_piv = float2(0.5,0.5);
                float2 node_6764 = (mul(float2(i.posWorld.b,i.posWorld.r)-node_6764_piv,float2x2( node_6764_cos, -node_6764_sin, node_6764_sin, node_6764_cos))+node_6764_piv);
                float4 _TextureZXhorizontal_var = tex2D(_TextureZXhorizontal,TRANSFORM_TEX(node_6764, _TextureZXhorizontal));
                float node_3873_ang = (node_2943*_Brotation);
                float node_3873_spd = 1.0;
                float node_3873_cos = cos(node_3873_spd*node_3873_ang);
                float node_3873_sin = sin(node_3873_spd*node_3873_ang);
                float2 node_3873_piv = float2(0.5,0.5);
                float2 node_3873 = (mul(float2(i.posWorld.r,i.posWorld.g)-node_3873_piv,float2x2( node_3873_cos, -node_3873_sin, node_3873_sin, node_3873_cos))+node_3873_piv);
                float4 _TextureXY_var = tex2D(_TextureXY,TRANSFORM_TEX(node_3873, _TextureXY));
                float node_875 = (node_4794.r*_TextureYZ_var.r + node_4794.g*_TextureZXhorizontal_var.g + node_4794.b*_TextureXY_var.b);
                float3 diffColor = float3(node_875,node_875,node_875);
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metalic, specColor, specularMonochrome );
                float roughness = 1.0 - _Gloss;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}