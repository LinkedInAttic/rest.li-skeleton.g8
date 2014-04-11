package $organization$.$name;format="norm"$.impl;

import com.linkedin.restli.server.annotations.RestLiCollection;
import com.linkedin.restli.server.resources.CollectionResourceTemplate;
import $organization$.$name;format="norm"$.$restli_resource_entity;format="Camel"$;

@RestLiCollection(name = "$restli_resource;format="camel"$", namespace = "$organization$.$name;format="norm"$")
public class $restli_resource;format="Camel"$Resource extends CollectionResourceTemplate<Long, $restli_resource_entity;format="Camel"$>
{
  @Override
  public $restli_resource_entity;format="Camel"$ get(Long key)
  {
    return new $restli_resource_entity;format="Camel"$().setMessage("Hello, Rest.li!");
  }
}
