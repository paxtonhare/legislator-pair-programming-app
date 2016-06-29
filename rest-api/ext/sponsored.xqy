xquery version "1.0-ml";

module namespace ext = "http://marklogic.com/rest-api/resource/sponsored";

declare namespace roxy = "http://marklogic.com/roxy";
declare namespace rapi = "http://marklogic.com/rest-api";

declare
%roxy:params("uri=xs:string")
function ext:get(
  $context as map:map,
  $params  as map:map
) as document-node()*
{
  map:put($context, "output-types", "application/json"),
  map:put($context, "output-status", (200, "OK")),

  let $uri := map:get($params, "uri")
  let $thomas-id := fn:doc($uri)//thomas_id
  let $bills := fn:doc()[//sponsor/thomas_id = $thomas-id]
  return
    xdmp:to-json(json:to-array($bills))
};
