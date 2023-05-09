Shader "Custom/TexNormal" 
{
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Texture", 2D) = "white" {}
		_BumpMap("Bumpmap", 2D) = "bump" {}
	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200

			CGPROGRAM
			#pragma surface surf WrapLambert

			// Use shader model 3.0 target, to get nicer looking lighting
			#pragma target 3.0

			half4 LightingWrapLambert(SurfaceOutput s, half3 lightDir, half atten) 
			{
				half NdotL = dot(s.Normal, lightDir);
				half diff = NdotL * 0.5 + 0.5;
				half4 c;
				c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten);
				c.a = s.Alpha;
				return c;
			}

			struct Input 
			{
				float2 uv_MainTex;
				float2 uv_BumpMap;
			};

			sampler2D _MainTex;
			sampler2D _BumpMap;
			fixed4 _Color;

			int _AtlasX;
			int _AtlasY;
			fixed4 _AtlasRec;

			void surf(Input IN, inout SurfaceOutput o) {
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				o.Albedo = c.rgb;
				o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
				o.Alpha = c.a;
			}
			ENDCG
	}
		Fallback "Diffuse"
}