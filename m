Received: from smtp93.iad3a.emailsrvr.com (smtp93.iad3a.emailsrvr.com [173.203.187.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9271
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618421061;
	bh=JMQj+VeVN0eSkJ7MbQ77HtRudxstUALxi9GNXVhX2ng=;
	h=Subject:To:From:Date:From;
	b=hg2+nvoqAXu5iPnC+uG2dSMWZqgGE1iB8Hsgi6WgMYVgRKK/9NTXSuUU3kRFZ0rMe
	 ligvGmwWR0shlw8m+anS9UuqIRdvwgsNkUH8IGUCb7Byoss4vD3fkaWK5PZwsgsq57
	 gxj/CNIT+kixXHVVZoClvcyoDbxVvkuAo/IYf5NU=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp20.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id BA5F8249FB;
	Wed, 14 Apr 2021 13:24:20 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com> <20210414100905.GD6048@kadam>
 <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
 <20210414132818.GF6048@kadam>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <a09c77de-488a-3c2d-1ea7-82d3a8ef507f@mev.co.uk>
Date: Wed, 14 Apr 2021 18:24:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210414132818.GF6048@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 1f0017b4-0c11-45be-ab5c-2d5c3e87f73b-1-1

On 14/04/2021 14:28, Dan Carpenter wrote:
> On Wed, Apr 14, 2021 at 01:34:23PM +0100, Ian Abbott wrote:
>>> drivers/staging/comedi/drivers/ni_routes.c:61 ni_find_route_values() warn: 'device_family' sometimes too small '8,11' size = 30
>>>      59          for (i = 0; ni_all_route_values[i]; ++i) {
>>>      60                  if (memcmp(ni_all_route_values[i]->family, device_family,
>>>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>      61                             strnlen(device_family, 30)) == 0) {
>>>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> This whole memcmp() is very strange.  Why not just use:
>>>
>>> 	if (strncmp(ni_all_route_values[i]->family, device_family, 30) == 0)
>>
>> I think even a simple strcmp() would do as well because all the device
>> family strings and board name strings are null terminated.  I don't know why
>> the magic number 30 is used here!
>>
>> The above applies similarly to ni_find_valid_routes() too.
>>
> 
> I was thinking maybe ni_all_route_values[i]->family has an additional
> string on the end.  For example, it could end in "_bar" and we want
> ->family "foo_bar" to match with device_family "foo"?

That doesn't seem to be the case.  The family names are just string
literals pointed to by the 'family' member of 'struct
family_route_values' in
".../comedi/drivers/ni_routing/ni_route_values.h".  Instances of 'struct
family_route_values' are statically defined in
".../comedi/drivers/ni_routing/ni_route_values/*.c".

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
