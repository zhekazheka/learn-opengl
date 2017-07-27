#version 330 core
in vec3 ourColor;
in vec2 TexCoord;
in float sinValue;

out vec4 color;

uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;

void main()
{
//    color = vec4(ourColor.r, ourColor.g, ourColor.b, 1.0f);
    color = vec4(ourColor.r, ourColor.g, ourColor.b, 1.0f) * mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), sinValue);
    //* vec4(ourColor.r + sinValue * 0.23, ourColor.g + (1.0f - sinValue), ourColor.b + sinValue * 0.43, 1.0f);
}
