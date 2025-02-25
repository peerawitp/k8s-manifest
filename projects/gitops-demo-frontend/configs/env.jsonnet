// Function to map key-value pairs to Kubernetes env format
local mapEnv(obj) =
  [
    { name: key, value: std.toString(obj[key]) }
    for key in std.objectFields(obj)
  ];

// Function that defines environment variables per namespace
local getMapEnv(namespace) = mapEnv(
  {
    'app-prod-14': {
      NEXT_PUBLIC_API_URL: 'https://api-group-14.iamgraph.live',
    },
  }[namespace]
);

{
  getMapEnv: getMapEnv,
}
