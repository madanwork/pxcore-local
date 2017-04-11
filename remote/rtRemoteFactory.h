#include "rtRemoteIResolver.h"
#include "rtRemoteTypes.h"
#include "rtRemoteEnvironment.h"

enum rtResolverType
{
  RT_RESOLVER_MULTICAST,
  RT_RESOLVER_FILE,
  RT_RESOLVER_UNICAST
};


class rtRemoteEnvironment;

class rtRemoteFactory
{
private:
  rtRemoteFactory();
  ~rtRemoteFactory();
public:
  static rtRemoteIResolver* rtRemoteCreateResolver(rtRemoteEnvironment* env);
};
