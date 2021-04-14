Received: from smtp126.iad3b.emailsrvr.com (smtp126.iad3b.emailsrvr.com [146.20.161.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD66D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618403665;
	bh=vq+VWEArvHjOTOp97716GklPJ7I4FTVRfiTt0JcGlig=;
	h=Subject:To:From:Date:From;
	b=dpH/Zpa+EoTfZwV3q06/rKMmv4AXtX4Jc4Kkg6/eMuAdEUkjvQxbRNPRZ4uwbwEuR
	 od9N8TR/0hQmJSrH+nD5c1cWQQpxkIxjKF9/4HIb4rOXh3yv/zsbt54iWrr8u3wIUc
	 Il/ItI8JdC3MiTOIB7w9m4cPTTpQmnVNAHRTYFCg=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp8.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id BF19540107;
	Wed, 14 Apr 2021 08:34:24 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com> <20210414100905.GD6048@kadam>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
Date: Wed, 14 Apr 2021 13:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210414100905.GD6048@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 314de81d-363d-430a-971a-47ca2674f8a4-1-1

On 14/04/2021 11:09, Dan Carpenter wrote:
> The test_ni_get_reg_value() function calls
> 	unittest(ni_get_reg_value_roffs(-1, O(0), T, 1) == -1,
> 		 "check bad direct trigger arg for first reg->dest w/offs\n");
> The -1 is type promoted to a high positive value so src is greater than
> NI_NAMES_BASE.  It's not clear that that was intentional.
> drivers/staging/comedi/drivers/tests/../ni_routes.h:269 ni_get_reg_value_roffs() warn: 'src' possible negative type promoted to high

I agree that it appears that ni_get_reg_value_roffs() will be returning 
-1 as expected, but for the wrong reason.  I think the intention was for 
ni_get_reg_value_roffs() to call route_register_is_valid() with src=0 in 
this case, but it actually calls ni_route_to_register() with src=-1 
(because -1 gets converted to 0xffffffff in the test `if (src < 
NI_NAMES_BASE)` where NI_NAMES_BASE is defined as 0x8000u).

> 
> drivers/staging/comedi/drivers/ni_routes.c:61 ni_find_route_values() warn: 'device_family' sometimes too small '8,11' size = 30
>      59          for (i = 0; ni_all_route_values[i]; ++i) {
>      60                  if (memcmp(ni_all_route_values[i]->family, device_family,
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      61                             strnlen(device_family, 30)) == 0) {
>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> This whole memcmp() is very strange.  Why not just use:
> 
> 	if (strncmp(ni_all_route_values[i]->family, device_family, 30) == 0)

I think even a simple strcmp() would do as well because all the device 
family strings and board name strings are null terminated.  I don't know 
why the magic number 30 is used here!

The above applies similarly to ni_find_valid_routes() too.

> 
>      62                          rv = &ni_all_route_values[i]->register_values[0][0];
>      63                          break;
>      64                  }
>      65          }
> 
> There are a couple places where conditions could probably be deleted.
> drivers/staging/comedi/drivers/ni_mio_common.c:2363 ni_ai_cmd() warn: we tested 'dev->irq' before and it was 'true'

Agreed.  In fact ni_ai_cmd() shouldn't be getting called at all if 
dev->irq is 0.

> drivers/staging/comedi/drivers/usbdux.c:1192 usbduxsub_pwm_irq() warn: we tested 'devpriv->pwm_cmd_running' before and it was 'true'

Agreed.

> There is some commented out code that might be worth reviewing.
> drivers/staging/comedi/drivers/ni_mio_common.c:6306 ni_E_init() warn: odd binop '0x2 & 0x0'

Yes, that can be simplified.

> drivers/staging/comedi/drivers/cb_pcidas64.c:2229 use_hw_sample_counter() warn: ignoring unreachable code.

Yes, that is preceded by:

/* disable for now until I work out a race */
	return 0;

But that change dates back to 2002.  Perhaps we should use `#if 0` 
`#endif` around the unreachable lines of code on the off-chance that it 
gets revisited sometime!

> These places are using char for bitwise operations and there is some
> sign extension going on.
> drivers/staging/comedi/drivers/icp_multi.c:120 icp_multi_ai_insn_read() warn: using signed char for bitops

Agreed, range_code_analog[] ought to be unsigned char instead of plain char.

> drivers/staging/comedi/drivers/usbdux.c:1290 usbdux_pwm_pattern() warn: using signed char for bitops
> drivers/staging/comedi/drivers/usbdux.c:1292 usbdux_pwm_pattern() warn: using signed char for bitops

I think usbdux_pwm_pattern() should be using unsigned char throughout. 
Also, the initialization `char sgn_mask = (16 << chan);` seems strange 
because `chan` can be in the range 0 to 7 here!

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
