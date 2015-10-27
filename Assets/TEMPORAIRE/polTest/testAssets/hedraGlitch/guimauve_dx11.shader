// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:505,x:32953,y:32609,varname:node_505,prsc:2|diff-14-OUT,spec-5039-OUT,gloss-8085-OUT,disp-9477-OUT,tess-7882-OUT;n:type:ShaderForge.SFN_Tex2d,id:2730,x:31735,y:32987,ptovrint:False,ptlb:glitched,ptin:_glitched,varname:_regular_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-520-UVOUT;n:type:ShaderForge.SFN_Color,id:5925,x:31492,y:32403,ptovrint:False,ptlb:node_5925,ptin:_node_5925,varname:node_5925,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9632353,c2:0.3682959,c3:0.3682959,c4:1;n:type:ShaderForge.SFN_Panner,id:6537,x:31492,y:32695,varname:node_6537,prsc:2,spu:-1,spv:-1|UVIN-1634-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1634,x:31492,y:32546,varname:node_1634,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5925-RGB;n:type:ShaderForge.SFN_Append,id:1392,x:31735,y:32695,varname:node_1392,prsc:2|A-6537-UVOUT,B-5925-B;n:type:ShaderForge.SFN_Lerp,id:309,x:32176,y:32695,varname:node_309,prsc:2|A-4767-OUT,B-474-OUT,T-3581-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4652,x:31492,y:32871,varname:node_4652,prsc:2,cc1:1,cc2:2,cc3:-1,cc4:-1|IN-5925-RGB;n:type:ShaderForge.SFN_Append,id:2632,x:31735,y:32829,varname:node_2632,prsc:2|A-2035-UVOUT,B-5925-R;n:type:ShaderForge.SFN_Panner,id:2035,x:31492,y:33016,varname:node_2035,prsc:2,spu:1,spv:1|UVIN-4652-OUT;n:type:ShaderForge.SFN_Panner,id:520,x:31492,y:33174,varname:node_520,prsc:2,spu:0,spv:0.2|UVIN-1383-OUT;n:type:ShaderForge.SFN_Sin,id:4767,x:31956,y:32695,varname:node_4767,prsc:2|IN-1392-OUT;n:type:ShaderForge.SFN_Sin,id:474,x:31956,y:32829,varname:node_474,prsc:2|IN-2632-OUT;n:type:ShaderForge.SFN_Rotator,id:1050,x:32039,y:32116,varname:node_1050,prsc:2|UVIN-2288-OUT,ANG-7113-OUT;n:type:ShaderForge.SFN_Time,id:3801,x:32039,y:32242,varname:node_3801,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:6835,x:32039,y:32397,ptovrint:False,ptlb:speedMove,ptin:_speedMove,varname:node_6835,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:7113,x:32212,y:32242,varname:node_7113,prsc:2|A-3801-T,B-6835-OUT;n:type:ShaderForge.SFN_Lerp,id:14,x:32442,y:32611,varname:node_14,prsc:2|A-4189-RGB,B-309-OUT,T-5039-OUT;n:type:ShaderForge.SFN_Tex2d,id:4189,x:32176,y:32535,ptovrint:False,ptlb:regular,ptin:_regular,varname:node_4189,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e7a88268a460f384cbef52d988810865,ntxv:2,isnm:False|UVIN-1082-OUT;n:type:ShaderForge.SFN_Tex2d,id:4788,x:32389,y:32116,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_4788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:091bf43365066734a96bc327e0773c3b,ntxv:0,isnm:False|UVIN-1025-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:7093,x:32589,y:32116,varname:node_7093,prsc:2,frmn:0,frmx:1,tomn:0,tomx:2|IN-4788-RGB;n:type:ShaderForge.SFN_Clamp01,id:5039,x:32589,y:32290,varname:node_5039,prsc:2|IN-7093-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6819,x:31337,y:31785,varname:node_6819,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:1383,x:31337,y:31915,varname:node_1383,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6819-XYZ;n:type:ShaderForge.SFN_Multiply,id:9106,x:32188,y:33162,varname:node_9106,prsc:2|A-3581-OUT,B-5039-OUT,C-5475-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8085,x:32589,y:32439,varname:node_8085,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5039-OUT;n:type:ShaderForge.SFN_Subtract,id:1082,x:31885,y:32415,varname:node_1082,prsc:2|A-1383-OUT,B-9265-OUT;n:type:ShaderForge.SFN_Vector2,id:9265,x:31210,y:32343,varname:node_9265,prsc:2,v1:0,v2:-1;n:type:ShaderForge.SFN_Panner,id:1025,x:32056,y:31897,varname:node_1025,prsc:2,spu:0.1,spv:0.1|UVIN-1050-UVOUT;n:type:ShaderForge.SFN_Add,id:5095,x:31647,y:31605,varname:node_5095,prsc:2|A-6819-X,B-6819-Y;n:type:ShaderForge.SFN_Add,id:4541,x:31647,y:31743,varname:node_4541,prsc:2|A-6819-Y,B-6819-Z;n:type:ShaderForge.SFN_Append,id:2288,x:31849,y:31605,varname:node_2288,prsc:2|A-5095-OUT,B-4541-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5329,x:32371,y:32931,ptovrint:False,ptlb:displace,ptin:_displace,varname:node_5329,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9477,x:32566,y:32931,varname:node_9477,prsc:2|A-9106-OUT,B-5329-OUT;n:type:ShaderForge.SFN_RemapRange,id:3581,x:31742,y:33151,varname:node_3581,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1.2|IN-2730-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7882,x:32558,y:33360,ptovrint:False,ptlb:tessellation,ptin:_tessellation,varname:node_7882,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:20;n:type:ShaderForge.SFN_Transform,id:4337,x:31911,y:33528,varname:node_4337,prsc:2,tffrom:1,tfto:0|IN-6819-XYZ;n:type:ShaderForge.SFN_Normalize,id:5475,x:32093,y:33528,varname:node_5475,prsc:2|IN-4337-XYZ;proporder:2730-5925-6835-4189-4788-5329-7882;pass:END;sub:END;*/

Shader "Unlit/guimauve_dx11" {
    Properties {
        _glitched ("glitched", 2D) = "white" {}
        _node_5925 ("node_5925", Color) = (0.9632353,0.3682959,0.3682959,1)
        _speedMove ("speedMove", Float ) = 0.1
        _regular ("regular", 2D) = "black" {}
        _mask ("mask", 2D) = "white" {}
        _displace ("displace", Float ) = 0.5
        _tessellation ("tessellation", Float ) = 20
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 100
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Tessellation.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 5.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _glitched; uniform float4 _glitched_ST;
            uniform float4 _node_5925;
            uniform float _speedMove;
            uniform sampler2D _regular; uniform float4 _regular_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _displace;
            uniform float _tessellation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float4 node_5794 = _Time + _TimeEditor;
                    float2 node_1383 = mul(_Object2World, v.vertex).rgb.rg;
                    float2 node_520 = (node_1383+node_5794.g*float2(0,0.2));
                    float4 _glitched_var = tex2Dlod(_glitched,float4(TRANSFORM_TEX(node_520, _glitched),0.0,0));
                    float3 node_3581 = (_glitched_var.rgb*0.7+0.5);
                    float4 node_3801 = _Time + _TimeEditor;
                    float node_1050_ang = (node_3801.g*_speedMove);
                    float node_1050_spd = 1.0;
                    float node_1050_cos = cos(node_1050_spd*node_1050_ang);
                    float node_1050_sin = sin(node_1050_spd*node_1050_ang);
                    float2 node_1050_piv = float2(0.5,0.5);
                    float2 node_1050 = (mul(float2((mul(_Object2World, v.vertex).r+mul(_Object2World, v.vertex).g),(mul(_Object2World, v.vertex).g+mul(_Object2World, v.vertex).b))-node_1050_piv,float2x2( node_1050_cos, -node_1050_sin, node_1050_sin, node_1050_cos))+node_1050_piv);
                    float2 node_1025 = (node_1050+node_5794.g*float2(0.1,0.1));
                    float4 _mask_var = tex2Dlod(_mask,float4(TRANSFORM_TEX(node_1025, _mask),0.0,0));
                    float3 node_5039 = saturate((_mask_var.rgb*2.0+0.0));
                    float3 node_9477 = ((node_3581*node_5039*normalize(mul( _Object2World, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb))*_displace);
                    v.vertex.xyz += node_9477;
                }
                float Tessellation(TessVertex v){
                    return _tessellation;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o = (OutputPatchConstant)0;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v = (VertexInput)0;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 node_5794 = _Time + _TimeEditor;
                float4 node_3801 = _Time + _TimeEditor;
                float node_1050_ang = (node_3801.g*_speedMove);
                float node_1050_spd = 1.0;
                float node_1050_cos = cos(node_1050_spd*node_1050_ang);
                float node_1050_sin = sin(node_1050_spd*node_1050_ang);
                float2 node_1050_piv = float2(0.5,0.5);
                float2 node_1050 = (mul(float2((i.posWorld.r+i.posWorld.g),(i.posWorld.g+i.posWorld.b))-node_1050_piv,float2x2( node_1050_cos, -node_1050_sin, node_1050_sin, node_1050_cos))+node_1050_piv);
                float2 node_1025 = (node_1050+node_5794.g*float2(0.1,0.1));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_1025, _mask));
                float3 node_5039 = saturate((_mask_var.rgb*2.0+0.0));
                float gloss = node_5039.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = node_5039;
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float2 node_1383 = i.posWorld.rgb.rg;
                float2 node_1082 = (node_1383-float2(0,-1));
                float4 _regular_var = tex2D(_regular,TRANSFORM_TEX(node_1082, _regular));
                float2 node_520 = (node_1383+node_5794.g*float2(0,0.2));
                float4 _glitched_var = tex2D(_glitched,TRANSFORM_TEX(node_520, _glitched));
                float3 node_3581 = (_glitched_var.rgb*0.7+0.5);
                float3 diffuseColor = lerp(_regular_var.rgb,lerp(sin(float3((_node_5925.rgb.rg+node_5794.g*float2(-1,-1)),_node_5925.b)),sin(float3((_node_5925.rgb.gb+node_5794.g*float2(1,1)),_node_5925.r)),node_3581),node_5039);
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Tessellation.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 5.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _glitched; uniform float4 _glitched_ST;
            uniform float4 _node_5925;
            uniform float _speedMove;
            uniform sampler2D _regular; uniform float4 _regular_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _displace;
            uniform float _tessellation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float4 node_8639 = _Time + _TimeEditor;
                    float2 node_1383 = mul(_Object2World, v.vertex).rgb.rg;
                    float2 node_520 = (node_1383+node_8639.g*float2(0,0.2));
                    float4 _glitched_var = tex2Dlod(_glitched,float4(TRANSFORM_TEX(node_520, _glitched),0.0,0));
                    float3 node_3581 = (_glitched_var.rgb*0.7+0.5);
                    float4 node_3801 = _Time + _TimeEditor;
                    float node_1050_ang = (node_3801.g*_speedMove);
                    float node_1050_spd = 1.0;
                    float node_1050_cos = cos(node_1050_spd*node_1050_ang);
                    float node_1050_sin = sin(node_1050_spd*node_1050_ang);
                    float2 node_1050_piv = float2(0.5,0.5);
                    float2 node_1050 = (mul(float2((mul(_Object2World, v.vertex).r+mul(_Object2World, v.vertex).g),(mul(_Object2World, v.vertex).g+mul(_Object2World, v.vertex).b))-node_1050_piv,float2x2( node_1050_cos, -node_1050_sin, node_1050_sin, node_1050_cos))+node_1050_piv);
                    float2 node_1025 = (node_1050+node_8639.g*float2(0.1,0.1));
                    float4 _mask_var = tex2Dlod(_mask,float4(TRANSFORM_TEX(node_1025, _mask),0.0,0));
                    float3 node_5039 = saturate((_mask_var.rgb*2.0+0.0));
                    float3 node_9477 = ((node_3581*node_5039*normalize(mul( _Object2World, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb))*_displace);
                    v.vertex.xyz += node_9477;
                }
                float Tessellation(TessVertex v){
                    return _tessellation;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o = (OutputPatchConstant)0;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v = (VertexInput)0;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 node_8639 = _Time + _TimeEditor;
                float4 node_3801 = _Time + _TimeEditor;
                float node_1050_ang = (node_3801.g*_speedMove);
                float node_1050_spd = 1.0;
                float node_1050_cos = cos(node_1050_spd*node_1050_ang);
                float node_1050_sin = sin(node_1050_spd*node_1050_ang);
                float2 node_1050_piv = float2(0.5,0.5);
                float2 node_1050 = (mul(float2((i.posWorld.r+i.posWorld.g),(i.posWorld.g+i.posWorld.b))-node_1050_piv,float2x2( node_1050_cos, -node_1050_sin, node_1050_sin, node_1050_cos))+node_1050_piv);
                float2 node_1025 = (node_1050+node_8639.g*float2(0.1,0.1));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_1025, _mask));
                float3 node_5039 = saturate((_mask_var.rgb*2.0+0.0));
                float gloss = node_5039.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = node_5039;
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float2 node_1383 = i.posWorld.rgb.rg;
                float2 node_1082 = (node_1383-float2(0,-1));
                float4 _regular_var = tex2D(_regular,TRANSFORM_TEX(node_1082, _regular));
                float2 node_520 = (node_1383+node_8639.g*float2(0,0.2));
                float4 _glitched_var = tex2D(_glitched,TRANSFORM_TEX(node_520, _glitched));
                float3 node_3581 = (_glitched_var.rgb*0.7+0.5);
                float3 diffuseColor = lerp(_regular_var.rgb,lerp(sin(float3((_node_5925.rgb.rg+node_8639.g*float2(-1,-1)),_node_5925.b)),sin(float3((_node_5925.rgb.gb+node_8639.g*float2(1,1)),_node_5925.r)),node_3581),node_5039);
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
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "Tessellation.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 5.0
            uniform float4 _TimeEditor;
            uniform sampler2D _glitched; uniform float4 _glitched_ST;
            uniform float _speedMove;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _displace;
            uniform float _tessellation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float4 node_2845 = _Time + _TimeEditor;
                    float2 node_1383 = mul(_Object2World, v.vertex).rgb.rg;
                    float2 node_520 = (node_1383+node_2845.g*float2(0,0.2));
                    float4 _glitched_var = tex2Dlod(_glitched,float4(TRANSFORM_TEX(node_520, _glitched),0.0,0));
                    float3 node_3581 = (_glitched_var.rgb*0.7+0.5);
                    float4 node_3801 = _Time + _TimeEditor;
                    float node_1050_ang = (node_3801.g*_speedMove);
                    float node_1050_spd = 1.0;
                    float node_1050_cos = cos(node_1050_spd*node_1050_ang);
                    float node_1050_sin = sin(node_1050_spd*node_1050_ang);
                    float2 node_1050_piv = float2(0.5,0.5);
                    float2 node_1050 = (mul(float2((mul(_Object2World, v.vertex).r+mul(_Object2World, v.vertex).g),(mul(_Object2World, v.vertex).g+mul(_Object2World, v.vertex).b))-node_1050_piv,float2x2( node_1050_cos, -node_1050_sin, node_1050_sin, node_1050_cos))+node_1050_piv);
                    float2 node_1025 = (node_1050+node_2845.g*float2(0.1,0.1));
                    float4 _mask_var = tex2Dlod(_mask,float4(TRANSFORM_TEX(node_1025, _mask),0.0,0));
                    float3 node_5039 = saturate((_mask_var.rgb*2.0+0.0));
                    float3 node_9477 = ((node_3581*node_5039*normalize(mul( _Object2World, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb))*_displace);
                    v.vertex.xyz += node_9477;
                }
                float Tessellation(TessVertex v){
                    return _tessellation;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o = (OutputPatchConstant)0;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v = (VertexInput)0;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
