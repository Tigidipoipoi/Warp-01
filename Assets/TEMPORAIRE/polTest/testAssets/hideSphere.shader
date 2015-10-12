// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32423,y:32689|diff-464-OUT,spec-464-OUT,gloss-451-R,emission-429-OUT,transm-485-OUT,voffset-410-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33287,y:32615,ptlb:glitchT,ptin:_glitchT,tex:e80c3c84ea861404d8a427db8b7abf04,ntxv:0,isnm:False|UVIN-3-UVOUT;n:type:ShaderForge.SFN_Panner,id:3,x:33287,y:32445,spu:20,spv:20;n:type:ShaderForge.SFN_NormalVector,id:28,x:32689,y:33340,pt:False;n:type:ShaderForge.SFN_Multiply,id:29,x:32689,y:33210|A-91-OUT,B-28-OUT,C-66-OUT,D-292-OUT,E-380-OUT;n:type:ShaderForge.SFN_ValueProperty,id:66,x:32689,y:33504,ptlb:offset,ptin:_offset,glob:False,v1:1;n:type:ShaderForge.SFN_Sin,id:91,x:33426,y:33532|IN-113-OUT;n:type:ShaderForge.SFN_Time,id:92,x:33740,y:33204;n:type:ShaderForge.SFN_Multiply,id:94,x:33426,y:33228|A-663-OUT,B-96-OUT;n:type:ShaderForge.SFN_ValueProperty,id:96,x:33890,y:33277,ptlb:speed,ptin:_speed,glob:False,v1:5;n:type:ShaderForge.SFN_Add,id:113,x:33426,y:33390|A-94-OUT,B-133-OUT;n:type:ShaderForge.SFN_ValueProperty,id:119,x:33890,y:33355,ptlb:wave,ptin:_wave,glob:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:133,x:33686,y:33355|A-119-OUT,B-134-Y;n:type:ShaderForge.SFN_FragmentPosition,id:134,x:33890,y:33443;n:type:ShaderForge.SFN_Multiply,id:256,x:33694,y:33643|A-134-X,B-310-OUT;n:type:ShaderForge.SFN_Sin,id:292,x:33426,y:33831|IN-294-OUT;n:type:ShaderForge.SFN_Add,id:294,x:33426,y:33683|A-94-OUT,B-256-OUT;n:type:ShaderForge.SFN_ValueProperty,id:310,x:33877,y:33860,ptlb:wave_copy,ptin:_wave_copy,glob:False,v1:5;n:type:ShaderForge.SFN_Multiply,id:378,x:33693,y:33935|A-134-Z,B-384-OUT;n:type:ShaderForge.SFN_Sin,id:380,x:33425,y:34123|IN-382-OUT;n:type:ShaderForge.SFN_Add,id:382,x:33425,y:33975|A-94-OUT,B-378-OUT;n:type:ShaderForge.SFN_ValueProperty,id:384,x:33876,y:34152,ptlb:wave_copy_copy,ptin:_wave_copy_copy,glob:False,v1:6;n:type:ShaderForge.SFN_Multiply,id:410,x:32689,y:33008|A-585-OUT,B-29-OUT;n:type:ShaderForge.SFN_Multiply,id:429,x:32689,y:32793|A-2-RGB,B-568-OUT;n:type:ShaderForge.SFN_Tex2d,id:451,x:32971,y:32438,ptlb:regT,ptin:_regT,tex:ab6e37db14b453f48b378c315345a0ab,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:462,x:33005,y:32830|IN-555-OUT;n:type:ShaderForge.SFN_Multiply,id:464,x:32689,y:32660|A-451-RGB,B-462-OUT;n:type:ShaderForge.SFN_Vector1,id:485,x:32971,y:32725,v1:0.7;n:type:ShaderForge.SFN_Sqrt,id:555,x:33193,y:32830|IN-698-OUT;n:type:ShaderForge.SFN_Power,id:568,x:33099,y:33005|VAL-585-OUT,EXP-572-OUT;n:type:ShaderForge.SFN_Vector1,id:572,x:33257,y:33049,v1:3;n:type:ShaderForge.SFN_Slider,id:585,x:33509,y:32906,ptlb:HIDE,ptin:_HIDE,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:624,x:33890,y:32980|A-462-OUT,B-626-OUT;n:type:ShaderForge.SFN_Vector1,id:626,x:34141,y:32935,v1:2;n:type:ShaderForge.SFN_Add,id:663,x:33426,y:33069|A-624-OUT,B-92-T;n:type:ShaderForge.SFN_Sqrt,id:698,x:33348,y:32830|IN-585-OUT;proporder:2-66-96-119-310-384-451-585;pass:END;sub:END;*/

Shader "Custom/hideSphere" {
    Properties {
        _glitchT ("glitchT", 2D) = "white" {}
        _offset ("offset", Float ) = 1
        _speed ("speed", Float ) = 5
        _wave ("wave", Float ) = 4
        _wave_copy ("wave_copy", Float ) = 5
        _wave_copy_copy ("wave_copy_copy", Float ) = 6
        _regT ("regT", 2D) = "white" {}
        _HIDE ("HIDE", Range(0, 1)) = 0
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
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
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                float4 node_134 = mul(_Object2World, v.vertex);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*node_134.g)))*v.normal*_offset*sin((node_94+(node_134.r*_wave_copy)))*sin((node_94+(node_134.b*_wave_copy_copy)))));
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_485 = 0.7;
                float3 backLight = max(0.0, -NdotL ) * float3(node_485,node_485,node_485);
                float3 diffuse = (forwardLight+backLight) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
////// Emissive:
                float4 node_751 = _Time + _TimeEditor;
                float2 node_750 = i.uv0;
                float2 node_3 = (node_750.rg+node_751.g*float2(20,20));
                float3 emissive = (tex2D(_glitchT,TRANSFORM_TEX(node_3, _glitchT)).rgb*pow(_HIDE,3.0));
///////// Gloss:
                float4 node_451 = tex2D(_regT,TRANSFORM_TEX(node_750.rg, _regT));
                float gloss = node_451.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float3 node_464 = (node_451.rgb*node_462);
                float3 specularColor = node_464;
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_464;
                finalColor += specular;
                finalColor += emissive;
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
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                float4 node_134 = mul(_Object2World, v.vertex);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*node_134.g)))*v.normal*_offset*sin((node_94+(node_134.r*_wave_copy)))*sin((node_94+(node_134.b*_wave_copy_copy)))));
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
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_485 = 0.7;
                float3 backLight = max(0.0, -NdotL ) * float3(node_485,node_485,node_485);
                float3 diffuse = (forwardLight+backLight) * attenColor;
///////// Gloss:
                float2 node_752 = i.uv0;
                float4 node_451 = tex2D(_regT,TRANSFORM_TEX(node_752.rg, _regT));
                float gloss = node_451.r;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float3 node_464 = (node_451.rgb*node_462);
                float3 specularColor = node_464;
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_464;
                finalColor += specular;
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
                V2F_SHADOW_COLLECTOR;
                float4 posWorld : TEXCOORD5;
                float3 normalDir : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                float4 node_134 = mul(_Object2World, v.vertex);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*node_134.g)))*v.normal*_offset*sin((node_94+(node_134.r*_wave_copy)))*sin((node_94+(node_134.b*_wave_copy_copy)))));
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
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float node_462 = (1.0 - sqrt(sqrt(_HIDE)));
                float4 node_92 = _Time + _TimeEditor;
                float node_94 = (((node_462*2.0)+node_92.g)*_speed);
                float4 node_134 = mul(_Object2World, v.vertex);
                v.vertex.xyz += (_HIDE*(sin((node_94+(_wave*node_134.g)))*v.normal*_offset*sin((node_94+(node_134.r*_wave_copy)))*sin((node_94+(node_134.b*_wave_copy_copy)))));
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
