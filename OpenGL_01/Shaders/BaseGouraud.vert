#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out vec3 shadingColor;

uniform vec3 lightPos;
uniform vec3 lightColor;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);

    // calculating a normal matrix which works on non-uniform scale. inverse is costly operation, in real life do it on CPU and pass with uniform as other matricies ;)

    vec3 FragPos = vec3(view * model * vec4(aPos, 1.0));
    vec3 Normal = mat3(transpose(inverse(view * model))) * aNormal;
    vec3 LightPos = vec3(view * vec4(lightPos, 1.0));

    // ambient color
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor;

    // diffuse color
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(LightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;

    // specular color
    float specularStrength = 1.0;
    vec3 viewDir = normalize(-FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 64);
    vec3 specular = specularStrength * spec * lightColor;

    shadingColor = ambient + diffuse + specular;
}
