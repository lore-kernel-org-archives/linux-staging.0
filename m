Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DC72
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5LaqQeBsNBHU9D9jZgjWkNwbT7whKdIcOp7Scece9yQ=; b=ZlCvedhhe+0hN8sK0mbS6kAgvL
	+GPvZWgvOyaFM8lynXHsvjoIOKX0H3LR0Rw/IHh4vf/MDNJbypiFUjVTUWXbA+dti2wnCzteYyOf5
	NFRCWV+oAX0yzXfXp+S33CFFw5uTtlbRMOmKki+D89ne/gzmrfeWzFIYrlfJSvTAYVbnLOia0ghnw
	7Xf3wp8J2YMpgp0N756wucqRhoRlku1NqP5CVVKyGQMfmVXVnMCOV2rd3/TzD1UI6K098/yUksab/
	sx9wdnbzinoSkEj3GB48lsRBDHlFgVIJkyoYRwXHui3yBDqNSgZOld8MDNhP2DSziy/Hbi+Voh3rQ
	QV7ZfNbw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lb6mz-0060Kk-Fr; Mon, 26 Apr 2021 19:21:05 +0000
Date: Mon, 26 Apr 2021 20:21:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [PATCH v3] staging: unisys: visorhba: Convert
 module from IDR to XArray
Message-ID: <20210426192101.GQ235567@casper.infradead.org>
References: <20210426184245.12269-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426184245.12269-1-fmdefrancesco@gmail.com>

On Mon, Apr 26, 2021 at 08:42:45PM +0200, Fabio M. De Francesco wrote:
> +static void setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
>  				       wait_queue_head_t *event, int *result)
>  {
> -	/* specify the event that has to be triggered when this */
> -	/* cmd is complete */
> -	cmdrsp->scsitaskmgmt.notify_handle =
> -		simple_idr_get(idrtable, event, lock);
> -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> -		simple_idr_get(idrtable, result, lock);
> +	u32 id;
> +	int ret;
> +
> +	/* specify the event that has to be triggered when this cmd is complete */
> +	id = (u32)cmdrsp->scsitaskmgmt.notify_handle;
> +	ret = xa_alloc_irq(xa, &id, event, XA_LIMIT(1, INT_MAX), GFP_KERNEL);

OK, think this one through a bit.  When xa_alloc_irq() stores the ID that
it assigned into 'id', what happens to it next?

> +	id = (u32)cmdrsp->scsitaskmgmt.notifyresult_handle;
> +	ret = xa_alloc_irq(xa, &id, result, XA_LIMIT(1, INT_MAX), GFP_KERNEL);
>  }

> @@ -1053,8 +1018,6 @@ static int visorhba_probe(struct visor_device *dev)
>  	if (err)
>  		goto err_debugfs_info;
>  
> -	idr_init(&devdata->idr);

You still need to initialise the XArray, either with xa_init() or by
using DEFINE_XARRAY.  Since it's dynamically allocated, the former is
correct.

