Received: from smtp102.iad3b.emailsrvr.com (smtp102.iad3b.emailsrvr.com [146.20.161.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FC6D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618404036;
	bh=2Le4TGHd0iTzvhmMnKrEIPoHuTqAG/8IDx8uRWnRdRw=;
	h=Subject:To:From:Date:From;
	b=JkUHRLBLNb3TyQmNWYiAOvsbdm9+jo82D2m2N3iriGGKCk5LxmI36I//jkQmC8tGT
	 uzoTDBsboDXI7GB5wUeyII+ng3k1dSnI7arAOaWBQI1yuVCxtJSRfSaiupOfis+YUi
	 XN53GzvAU95LxWRYuQ3QX0U9wy2z85Sprpgv5zyM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp5.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 9298C400BD;
	Wed, 14 Apr 2021 08:40:35 -0400 (EDT)
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
Message-ID: <87e957d3-12b8-bac8-b1a3-ea10abee4ef5@mev.co.uk>
Date: Wed, 14 Apr 2021 13:40:34 +0100
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
X-Classification-ID: 6e32c7e6-17c1-4f4c-8a12-df869ce1ebc8-1-1

On 14/04/2021 11:09, Dan Carpenter wrote:
> This driver is doing a bunch of DMA on stack which doesn't work on
> all architectures.  You have to use kmalloc() (or vmalloc() I suppose)
> memory for DMA.
> 
> drivers/staging/comedi/drivers/dt9812.c:249 dt9812_read_info() error: doing dma on the stack (&cmd)
> drivers/staging/comedi/drivers/dt9812.c:273 dt9812_read_multiple_registers() error: doing dma on the stack (&cmd)
> drivers/staging/comedi/drivers/dt9812.c:299 dt9812_write_multiple_registers() error: doing dma on the stack (&cmd)
> drivers/staging/comedi/drivers/dt9812.c:318 dt9812_rmw_multiple_registers() error: doing dma on the stack (&cmd)
> drivers/staging/comedi/drivers/dt9812.c:330 dt9812_digital_in() error: doing dma on the stack (value)
> drivers/staging/comedi/drivers/dt9812.c:456 dt9812_analog_in() error: doing dma on the stack (val)
> drivers/staging/comedi/drivers/dt9812.c:692 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> drivers/staging/comedi/drivers/dt9812.c:700 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> drivers/staging/comedi/drivers/dt9812.c:711 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> drivers/staging/comedi/drivers/dt9812.c:718 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> drivers/staging/comedi/drivers/dt9812.c:725 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> drivers/staging/comedi/drivers/dt9812.c:732 dt9812_reset_device() error: doing dma on the stack (&tmp32)

Yes, it seems it requires a bit of an overhaul!

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
