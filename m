Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC32F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2EZ9wMn5IsrCWzyEdIPf+KOdPnl6OIWHe1m9e0dWRa8=; b=kBL8O9EWg/3wmo7Rz/ngkPBWvv
	/lDdibrv2XDWvOvRxeCuN6GBui4ZCegmuOEt0hj4oRbjRSHiTPOYscLy22+WWBpi1LG0CIpEEPe/7
	PE/hqkFuZJMa5lxF32I8uQp7pKtZP1a0AEIHL2W5P3KUOVoozDSosJw+GVBzTpzEn6JcTEEe0suNG
	WnbpyRZEhUIpLmlyraJE3EoJ/VQIt2/S/9h/6uxmSQ52AvaIzhBVgkQPwgHaB+ARVtkYARELujmYf
	BbW9WvwIPcb5CTXNnHIIljHUtpXGDHSXlmh/kXYAdlQfueNAJ+Xf/oUBv5I+WzIPJmfHIzVcIJRkZ
	zZe9U5nA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lbOC6-006zBS-0S; Tue, 27 Apr 2021 13:56:33 +0000
Date: Tue, 27 Apr 2021 14:56:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [PATCH v4] staging: unisys: visorhba: Convert
 module from IDR to XArray
Message-ID: <20210427135605.GZ235567@casper.infradead.org>
References: <20210427132522.14547-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427132522.14547-1-fmdefrancesco@gmail.com>

On Tue, Apr 27, 2021 at 03:25:22PM +0200, Fabio M. De Francesco wrote:
> +++ b/drivers/staging/unisys/include/iochannel.h
> @@ -474,8 +474,8 @@ struct uiscmdrsp_scsitaskmgmt {
>  	enum task_mgmt_types tasktype;
>  	struct uisscsi_dest vdest;
>  	u64 handle;
> -	u64 notify_handle;
> -	u64 notifyresult_handle;
> +	u32 notify_handle;
> +	u32 notifyresult_handle;
>  	char result;
>  
>  #define TASK_MGMT_FAILED 0

I'm scared of this change.  Read the top of the file:

 * Everything needed for IOPart-GuestPart communication is define in
 * this file. Note: Everything is OS-independent because this file is
 * used by Windows, Linux and possible EFI drivers.

I don't know that you can make any changes to this file.

> +static void setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
>  				       wait_queue_head_t *event, int *result)
>  {
> -	/* specify the event that has to be triggered when this */
> -	/* cmd is complete */
> -	cmdrsp->scsitaskmgmt.notify_handle =
> -		simple_idr_get(idrtable, event, lock);
> -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> -		simple_idr_get(idrtable, result, lock);
> +	int ret;
> +	u32 *id;
> +
> +	/* specify the event that has to be triggered when this cmd is complete */
> +	id = &cmdrsp->scsitaskmgmt.notify_handle;
> +	ret = xa_alloc_irq(xa, id, event, XA_LIMIT(1, INT_MAX), GFP_KERNEL);

You're still not handling the error here.

