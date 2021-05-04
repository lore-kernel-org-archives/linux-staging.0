Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1571
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/A7CKIJkD9/yQn75x3dVFpMhloUMd6NMum1pcYmMTeo=; b=jvpKksiSRZ3SeFHAQJboopnq+B
	GNVKKVYHA+/40bO3bIePcpj/KfWaYqe0jurrKqmnvZqC7G0gvaoafckGZQ12H29Yk+2LJ0WI/t3k6
	6dbLoP2J4yVzOXInItFRlDUE0xlracOF0UQiPHEVIRO6eUS2zRUQpTHDH1NuZP5CBRxeGUnF0KdAl
	4xAeazZqmb4v/Xec1LOews7bHxyGotuQUgHlezxecR1U0A55zxlXw1hBxF18nSem9tPCgRYYwuo+s
	Vn2R2uhiO5e4GT+2MQ3uuUvmIAufnPIvBf6tg0WpOxPspmH+A7rcmT7JP1NJhaJgvbZtJhDufWRYX
	qkrcoqLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvJY-00Gd4j-CY; Tue, 04 May 2021 13:42:22 +0000
Date: Tue, 4 May 2021 14:42:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7] staging: unisys: visorhba: Convert module from IDR to
 XArray
Message-ID: <20210504134216.GG1847222@casper.infradead.org>
References: <20210504133253.32269-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504133253.32269-1-fmdefrancesco@gmail.com>

On Tue, May 04, 2021 at 03:32:53PM +0200, Fabio M. De Francesco wrote:
> Changes from v6; Added a call to xa_destroy() that I had forgotten.

What?  No!  Go back and re-read what I wrote about this previously.

> +static int setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
>  				       wait_queue_head_t *event, int *result)
>  {
> -	/* specify the event that has to be triggered when this */
> -	/* cmd is complete */
> -	cmdrsp->scsitaskmgmt.notify_handle =
> -		simple_idr_get(idrtable, event, lock);
> -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> -		simple_idr_get(idrtable, result, lock);
> +	int ret;
> +	u32 id;
> +
> +	/* specify the event that has to be triggered when this cmd is complete */
> +	ret = xa_alloc_irq(xa, &id, event, xa_limit_32b, GFP_KERNEL);
> +	if (ret) 
> +		return ret;
> +	else
> +		cmdrsp->scsitaskmgmt.notify_handle = id;

This 'else' is actively confusing.

> +	ret = xa_alloc_irq(xa, &id, result, xa_limit_32b, GFP_KERNEL);
> +	if (ret) {
> +		xa_erase_irq(xa, cmdrsp->scsitaskmgmt.notify_handle);
> +		return ret;
> +	} else
> +		cmdrsp->scsitaskmgmt.notifyresult_handle = id;

Ditto.

