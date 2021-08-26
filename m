Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987A3FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:51:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE336108F;
	Thu, 26 Aug 2021 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629975117;
	bh=bYzoqaGaeVIa6hmFFr9DEiYpG3DMEBTslADS8rFb29A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZgaZoo6T6k6aZeGZpa25W8XHEpScpqKI8XBJxs/eTnbvxvt5b4tU1Pwr8OkX1lQY
	 xOwCRgQv+Fwz2T3F3O7Z7VUNkY4JS9I8/82R53RIXb3UTDOZI3n/g/E88+zWj5RyNL
	 HbWAq7yP9Iw7SEiGbku3KSxGESoK8GeOzu/z3rr4=
Date: Thu, 26 Aug 2021 12:51:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Provide a TODO file for this driver
Message-ID: <YSdySbNSHYGsXz1r@kroah.com>
References: <20210826014959.26857-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826014959.26857-1-fmdefrancesco@gmail.com>

On Thu, Aug 26, 2021 at 03:49:59AM +0200, Fabio M. De Francesco wrote:
> Provide a TODO file that lists the tasks that should be carried out in
> order to move this driver off drivers/staging.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Thanks to Phillip Potter <phil@philpotter.co.uk> for for providing the first draft.
> 
>  drivers/staging/r8188eu/TODO | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 drivers/staging/r8188eu/TODO
> 
> diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
> new file mode 100644
> index 000000000000..4bccca69abac
> --- /dev/null
> +++ b/drivers/staging/r8188eu/TODO
> @@ -0,0 +1,16 @@
> +To-do list:
> +
> +* Correct the coding style according to Linux guidelines; please read the document
> +at https://www.kernel.org/doc/html/latest/process/coding-style.html.

Indent and properly wrap your lines at the right width please.

> +* Remove unnecessary debugging/printing macros; for those that are still needed
> +use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
> +* Remove dead code such as unusued functions, variables, fields, etc..
> +* Use in-kernel API and remove unnecessary wrappers where possible.
> +* Remove the HAL layer and migrate its functionality into the relevant parts of
> +the driver.
> +* Switch to use LIB80211 (This work is currently in development by Larry Finger).
> +* Switch to use MAC80211 (This work is currently in development by Larry Finger).

No need to say "is being done by XXX" anywhere, as that stops people
from helping out on this instantly.

> +Please send any patches to Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
> +Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>
> +and CC linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org.

As the MAINTAINERS file lists this properly, no need for this paragraph.
That can also be removed from any remaining TODO files that have it in
it that also have correct MAINTAINERS entries.

thanks,

greg k-h
