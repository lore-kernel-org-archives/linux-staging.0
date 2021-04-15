Received: from smtp88.ord1d.emailsrvr.com (smtp88.ord1d.emailsrvr.com [184.106.54.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081571
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618480630;
	bh=kFlM03EoL2D4mPkwYDV1OQLBHVLRwfizkjt7UK1y0Ns=;
	h=Subject:From:To:Date:From;
	b=E9O+uRGWpsOpt5+7XBF02OXzURTayHC2wpMqolT2rxz7ahSTD7+kd55Wgp8s9jmv2
	 1sea5rC2aF4wIfxGTpoHHbK1q4Lv50P5Is6TJZLMTCavmRVDDv7/IZiH2o9J2rF8mE
	 lUv5awdffPHcJnw9SQGDuZMJ22eYIrfaSv1dE4C0=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp4.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id AFCE140128;
	Thu, 15 Apr 2021 05:57:09 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
From: Ian Abbott <abbotti@mev.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com> <20210414100905.GD6048@kadam>
 <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <97a6c2fb-5b55-300d-1a0a-d0c150ae60ed@mev.co.uk>
Date: Thu, 15 Apr 2021 10:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Classification-ID: fda348de-1fcb-40d6-9bbe-1412a1cf815a-1-1

On 14/04/2021 13:34, Ian Abbott wrote:
> On 14/04/2021 11:09, Dan Carpenter wrote:
>> The test_ni_get_reg_value() function calls
>>     unittest(ni_get_reg_value_roffs(-1, O(0), T, 1) == -1,
>>          "check bad direct trigger arg for first reg->dest w/offs\n");
>> The -1 is type promoted to a high positive value so src is greater than
>> NI_NAMES_BASE.  It's not clear that that was intentional.
>> drivers/staging/comedi/drivers/tests/../ni_routes.h:269 
>> ni_get_reg_value_roffs() warn: 'src' possible negative type promoted 
>> to high
> 
> I agree that it appears that ni_get_reg_value_roffs() will be returning 
> -1 as expected, but for the wrong reason.  I think the intention was for 
> ni_get_reg_value_roffs() to call route_register_is_valid() with src=0 in 
> this case, but it actually calls ni_route_to_register() with src=-1 
> (because -1 gets converted to 0xffffffff in the test `if (src < 
> NI_NAMES_BASE)` where NI_NAMES_BASE is defined as 0x8000u).

Since Spencer agrees that the existing behavior was unintentional, I 
think the least disruptive fix would be change `src < NI_NAMES_BASE` to 
`src < (int)NI_NAMES_BASE` in `ni_get_reg_value_roffs()` in 
".../comedi/drivers/ni_routes.h".

Either that, or change the interface to use unsigned `src` and 
`direct_reg_offset` values.  The negative values only seem to be used by 
the "ni_routes_test" unit testing module.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
