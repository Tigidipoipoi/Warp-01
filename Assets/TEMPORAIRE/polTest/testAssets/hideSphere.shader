// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:34189,y:32689,varname:node_1,prsc:2|diff-464-OUT,spec-464-OUT,gloss-451-R,normal-5483-OUT,emission-429-OUT,transm-485-OUT,voffset-410-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33394,y:32615,ptovrint:False,ptlb:glitchT,ptin:_glitchT,varname:node_4466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e80c3c84ea861404d8a427db8b7abf04,ntxv:0,isnm:False|UVIN-3-UVOUT;n:type:ShaderForge.SFN_Panner,id:3,x:33394,y:32445,varname:node_3,prsc:2,spu:20,spv:20;n:type:ShaderForge.SFN_NormalVector,id:28,x:33992,y:33340,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:29,x:33992,y:33210,varname:node_29,prsc:2|A-91-OUT,B-28-OUT,C-66-OUT,D-292-OUT,E-380-OUT;n:type:ShaderForge.SFN_ValueProperty,id:66,x:33992,y:33504,ptovrint:False,ptlb:offset,ptin:_offset,varname:node_7386,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Sin,id:91,x:33255,y:33532,varname:node_91,prsc:2|IN-113-OUT;n:type:ShaderForge.SFN_Time,id:92,x:32941,y:33204,varname:node_92,prsc:2;n:type:ShaderForge.SFN_Multiply,id:94,x:33255,y:33228,varname:node_94,prsc:2|A-663-OUT,B-96-OUT;n:type:ShaderForge.SFN_ValueProperty,id:96,x:32791,y:33277,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_2466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Add,id:113,x:33255,y:33390,varname:node_113,prsc:2|A-94-OUT,B-133-OUT;n:type:ShaderForge.SFN_ValueProperty,id:119,x:32791,y:33355,ptovrint:False,ptlb:wave,ptin:_wave,varname:node_7392,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:133,x:32995,y:33355,varname:node_133,prsc:2|A-119-OUT,B-134-Y;n:type:ShaderForge.SFN_FragmentPosition,id:134,x:32791,y:33443,varname:node_134,prsc:2;n:type:ShaderForge.SFN_Multiply,id:256,x:32987,y:33643,varname:node_256,prsc:2|A-134-X,B-310-OUT;n:type:ShaderForge.SFN_Sin,id:292,x:33255,y:33831,varname:node_292,prsc:2|IN-294-OUT;n:type:ShaderForge.SFN_Add,id:294,x:33255,y:33683,varname:node_294,prsc:2|A-94-OUT,B-256-OUT;n:type:ShaderForge.SFN_ValueProperty,id:310,x:32804,y:33860,ptovrint:False,ptlb:wave_copy,ptin:_wave_copy,varname:node_3007,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Multiply,id:378,x:32988,y:33935,varname:node_378,prsc:2|A-134-Z,B-384-OUT;n:type:ShaderForge.SFN_Sin,id:380,x:33256,y:34123,varname:node_380,prsc:2|IN-382-OUT;n:type:ShaderForge.SFN_Add,id:382,x:33256,y:33975,varname:node_382,prsc:2|A-94-OUT,B-378-OUT;n:type:ShaderForge.SFN_ValueProperty,id:384,x:32805,y:34152,ptovrint:False,ptlb:wave_copy_copy,ptin:_wave_copy_copy,varname:node_2094,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:6;n:type:ShaderForge.SFN_Multiply,id:410,x:33992,y:33008,varname:node_410,prsc:2|A-585-OUT,B-29-OUT;n:type:ShaderForge.SFN_Multiply,id:429,x:33992,y:32793,varname:node_429,prsc:2|A-2-RGB,B-568-OUT;n:type:ShaderForge.SFN_Tex2d,id:451,x:33710,y:32438,ptovrint:False,ptlb:regT,ptin:_regT,varname:node_7381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ab6e37db14b453f48b378c315345a0ab,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:462,x:33676,y:32830,varname:node_462,prsc:2|IN-555-OUT;n:type:ShaderForge.SFN_Multiply,id:464,x:33992,y:32660,varname:node_464,prsc:2|A-451-RGB,B-462-OUT;n:type:ShaderForge.SFN_Vector1,id:485,x:33710,y:32725,varname:node_485,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Sqrt,id:555,x:33488,y:32830,varname:node_555,prsc:2|IN-698-OUT;n:type:ShaderForge.SFN_Power,id:568,x:33582,y:33005,varname:node_568,prsc:2|VAL-585-OUT,EXP-572-OUT;n:type:ShaderForge.SFN_Vector1,id:572,x:33424,y:33049,varname:node_572,prsc:2,v1:3;n:type:ShaderForge.SFN_Slider,id:585,x:33015,y:32906,ptovrint:False,ptlb:HIDE,ptin:_HIDE,varname:node_2588,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:624,x:32791,y:32980,varname:node_624,prsc:2|A-462-OUT,B-626-OUT;n:type:ShaderForge.SFN_Vector1,id:626,x:32540,y:32935,varname:node_626,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:663,x:33255,y:33069,varname:node_663,prsc:2|A-624-OUT,B-92-T;n:type:ShaderForge.SFN_Sqrt,id:698,x:33333,y:32830,varname:node_698,prsc:2|IN-585-OUT;n:type:ShaderForge.SFN_Tex2d,id:3724,x:32803,y:32247,ptovrint:False,ptlb:regNormal,ptin:_regNormal,varname:node_3724,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:990,x:32803,y:32427,ptovrint:False,ptlb:glitchNormal,ptin:_glitchNormal,varname:node_990,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector1,id:5473,x:32803,y:32585,varname:node_5473,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:5047,x:33069,y:32267,varname:node_5047,prsc:2|A-3724-R,B-3724-G,C-5473-OUT;n:type:ShaderForge.SFN_Append,id:839,x:33069,y:32423,varname:node_839,prsc:2|A-990-R,B-990-G,C-5473-OUT;n:type:ShaderForge.SFN_Lerp,id:5483,x:33377,y:32266,varname:node_5483,prsc:2|A-5047-OUT,B-839-OUT,T-585-OUT;proporder:451-2-3724-990-66-96-119-310-384-585;pass:END;sub:END;*/

Shader "Custom/hideSphere" {
    Properties {
        _regT ("regT", 2D) = "white" {}
        _glitchT ("glitchT", 2D) = "white" {}
        _regNormal ("regNormal", 2D) = "bump" {}
        _glitchNormal ("glitchNormal", 2D) = "bump" {}
        _offset ("offset", Float ) = 1
        _speed ("speed", Float ) = 5
        _wave ("wave", Float ) = 4
        _wave_copy ("wave_copy", Float ) = 5
        _wave_copy_copy ("wave_copy_copy", Float ) = 6
        _HIDE ("HIDE", Range(0, 1)) = 0
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _glitchT; uniform float4 _glitchT_ST;
            uniform float _offset;
            uniform float _speed;
            uniform float _wave;
            uniform float _wave_copy;
            uniform float _wave_copy_copy;
            uniform sampler2D _regT; uniform float4 _regT_ST;
            uniform float _HIDE;
            uniform sampler2D _regNormal; uniform float4 _regNormal_ST;
            uniform sampler2D _glitchNormal; uniform float4 _glitchNormal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*mul(_Object2World, v.vertex).g)))*v.normal*_offset*sin((node_94+(mul(_Object2World, v.vertex).r*_wave_copy)))*sin((node_94+(mul(_Object2World, v.vertex).b*_wave_copy_copy)))));
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
                float3 _regNormal_var = UnpackNormal(tex2D(_regNormal,TRANSFORM_TEX(i.uv0, _regNormal)));
                float node_5473 = 1.0;
                float3 _glitchNormal_var = UnpackNormal(tex2D(_glitchNormal,TRANSFORM_TEX(i.uv0, _glitchNormal)));
                float3 normalLocal = lerp(float3(_regNormal_var.r,_regNormal_var.g,node_5473),float3(_glitchNormal_var.r,_glitchNormal_var.g,node_5473),_HIDE);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _regT_var = tex2D(_regT,TRANSFORM_TEX(i.uv0, _regT));
                float gloss = _regT_var.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float3 node_464 = (_regT_var.rgb*node_462);
                float3 specularColor = node_464;
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_485 = 0.7;
                float3 backLight = max(0.0, -NdotL ) * float3(node_485,node_485,node_485);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = node_464;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_2977 = _Time + _TimeEditor;
                float2 node_3 = (i.uv0+node_2977.g*float2(20,20));
                float4 _glitchT_var = tex2D(_glitchT,TRANSFORM_TEX(node_3, _glitchT));
                float3 emissive = (_glitchT_var.rgb*pow(_HIDE,3.0));
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _glitchT; uniform float4 _glitchT_ST;
            uniform float _offset;
            uniform float _speed;
            uniform float _wave;
            uniform float _wave_copy;
            uniform float _wave_copy_copy;
            uniform sampler2D _regT; uniform float4 _regT_ST;
            uniform float _HIDE;
            uniform sampler2D _regNormal; uniform float4 _regNormal_ST;
            uniform sampler2D _glitchNormal; uniform float4 _glitchNormal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*mul(_Object2World, v.vertex).g)))*v.normal*_offset*sin((node_94+(mul(_Object2World, v.vertex).r*_wave_copy)))*sin((node_94+(mul(_Object2World, v.vertex).b*_wave_copy_copy)))));
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
                float3 _regNormal_var = UnpackNormal(tex2D(_regNormal,TRANSFORM_TEX(i.uv0, _regNormal)));
                float node_5473 = 1.0;
                float3 _glitchNormal_var = UnpackNormal(tex2D(_glitchNormal,TRANSFORM_TEX(i.uv0, _glitchNormal)));
                float3 normalLocal = lerp(float3(_regNormal_var.r,_regNormal_var.g,node_5473),float3(_glitchNormal_var.r,_glitchNormal_var.g,node_5473),_HIDE);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _regT_var = tex2D(_regT,TRANSFORM_TEX(i.uv0, _regT));
                float gloss = _regT_var.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float3 node_464 = (_regT_var.rgb*node_462);
                float3 specularColor = node_464;
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_485 = 0.7;
                float3 backLight = max(0.0, -NdotL ) * float3(node_485,node_485,node_485);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 diffuseColor = node_464;
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
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _offset;
            uniform float _speed;
            uniform float _wave;
            uniform float _wave_copy;
            uniform float _wave_copy_copy;
            uniform float _HIDE;
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
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*mul(_Object2World, v.vertex).g)))*v.normal*_offset*sin((node_94+(mul(_Object2World, v.vertex).r*_wave_copy)))*sin((node_94+(mul(_Object2World, v.vertex).b*_wave_copy_copy)))));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
