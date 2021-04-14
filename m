Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BD6D14
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:12:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36BC5600CD;
	Wed, 14 Apr 2021 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618405924;
	bh=NWtj4dpdXgl6EC1DyTMcpHGDwC7Er0QrmdO2r3ioKpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qc80NSV/ay3sLkuVegGcJ5+KlijcSZ0rdHzYwfsHCJDR9qJUOmiliDbMRF0fxwNgO
	 gKpdVWSNSyinb7XQTqBaaPLeaCbxG52Sbswilf923J8fhqLe04ZlMmW9UUvGTnH9b3
	 5QxhME8rlImbmX6MGcEGA4Yei9T9w7H26sOVGNuc=
Date: Wed, 14 Apr 2021 15:12:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <YHbqImqxHfxRri3B@kroah.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
 <20210414100905.GD6048@kadam>
 <87e957d3-12b8-bac8-b1a3-ea10abee4ef5@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e957d3-12b8-bac8-b1a3-ea10abee4ef5@mev.co.uk>

On Wed, Apr 14, 2021 at 01:40:34PM +0100, Ian Abbott wrote:
> On 14/04/2021 11:09, Dan Carpenter wrote:
> > This driver is doing a bunch of DMA on stack which doesn't work on
> > all architectures.  You have to use kmalloc() (or vmalloc() I suppose)
> > memory for DMA.
> > 
> > drivers/staging/comedi/drivers/dt9812.c:249 dt9812_read_info() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:273 dt9812_read_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:299 dt9812_write_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:318 dt9812_rmw_multiple_registers() error: doing dma on the stack (&cmd)
> > drivers/staging/comedi/drivers/dt9812.c:330 dt9812_digital_in() error: doing dma on the stack (value)
> > drivers/staging/comedi/drivers/dt9812.c:456 dt9812_analog_in() error: doing dma on the stack (val)
> > drivers/staging/comedi/drivers/dt9812.c:692 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> > drivers/staging/comedi/drivers/dt9812.c:700 dt9812_reset_device() error: doing dma on the stack (&tmp8)
> > drivers/staging/comedi/drivers/dt9812.c:711 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:718 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:725 dt9812_reset_device() error: doing dma on the stack (&tmp16)
> > drivers/staging/comedi/drivers/dt9812.c:732 dt9812_reset_device() error: doing dma on the stack (&tmp32)
> 
> Yes, it seems it requires a bit of an overhaul!

As no one has complained about the warning messages they would be
getting if they tried to use this driver in the past year, are there any
real users of it?

This should be an easy thing to fix up for someone interested in getting
some experience in kernel development...

thanks,

greg k-h
