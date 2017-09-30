#version 330

layout(location = 0) in vec3  inVertexPosition;
layout(location = 1) in vec2  inTextureCoord;
out vec2 passTextureCoord;
out float passCardinalLight;

uniform mat4 projViewMatrix;
uniform float globalTime;


vec4 getWorldPos()
{
    vec3 inVert = inVertexPosition.xyz;
    inVert.y += sin((globalTime + inVert.x) * 2.3) / 16.8f;
    inVert.y += cos((globalTime + inVert.z) * 2.3) / 16.1f;
    inVert.y -= 0.2;
    return vec4(inVert, 1);
}

void main()
{
    gl_Position = projViewMatrix * getWorldPos();

    passTextureCoord    = inTextureCoord;
}