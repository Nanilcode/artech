Shader "Nan/simpleUnlitColor"
{
    Properties
    {
        _Color ("Color", Color) = (0, 0, 0, 1)
        [Enum(UnityEngine.Rendering.CullMode)]_CullMode("CullMode", float) = 2
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Cull [_CullMode]

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            fixed4 _Color;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {;
                return _Color;
            }
            ENDCG
        }
    }
}
