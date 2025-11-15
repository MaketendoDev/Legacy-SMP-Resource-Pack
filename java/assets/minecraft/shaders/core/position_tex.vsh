#version 150

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

in vec3 Position;
in vec4 Color;
in vec2 UV0;

out vec4 vertexColor;
out float vertexDistance;
out vec2 texCoord0;

// ---- Which quad to move ----
// Each quad has 4 vertices, so quadIndex = gl_VertexID / 4
// Set this number to the quad that contains your heart.
const int HEART_QUAD = 3;   // <-- change this number

void main() {
    vertexColor = Color;
    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    texCoord0 = UV0;

    // Vertex → quad index
    int quadIndex = gl_VertexID / 4;

    // New position
    vec3 newPos = Position;

    // If this vertex belongs to the heart quad, move it
    if (quadIndex == HEART_QUAD) {
        newPos += vec3(50.5, 0.0, 0.0);
    }

    gl_Position = ProjMat * ModelViewMat * vec4(newPos, 1.0);
}
