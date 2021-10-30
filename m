Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66C2C81
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 10:22:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FF966023D;
	Sat, 30 Oct 2021 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635589333;
	bh=lxVR3CgfwBZMcp+jRTPlUl0H+H6egn5umgsObQp4CMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kM0/y0YfAhukCYTQ0UxPMPLIp8Z+FpfZoQEK7TzES+mHQFcOyxTd4j0GGkWP1m+9G
	 lJjanVlf+qmtdpaHYNnvxIH/Ai9qoTlE9XYeJL+LzUcp3YY2t1zVZws/CFUVRNEo3i
	 kmawBwJzXGW/OPTx8FVyWYdQK3GdSbr8b5uTbnR8=
Date: Sat, 30 Oct 2021 12:22:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Goller <gabrielgoller123@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: Fix formatting of block comments
Message-ID: <YX0c00VaVrcbD2UE@kroah.com>
References: <YX0Zmb6Osu3tODfJ@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YX0Zmb6Osu3tODfJ@desktop>

On Sat, Oct 30, 2021 at 12:08:25PM +0200, Gabriel Goller wrote:
> Fixed warnings of checkpatch.pl in prism2mib.c:
> Block comments use * on subsequent lines.
> 
> Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2mib.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
> index 24ba10d6bd0b..c04fc17b3c64 100644
> --- a/drivers/staging/wlan-ng/prism2mib.c
> +++ b/drivers/staging/wlan-ng/prism2mib.c
> @@ -680,15 +680,15 @@ static int prism2mib_priv(struct mibrec *mib,
>  					       (u8 *)&wpa,
>  					       sizeof(wpa));
>  			/*
> -			pstr->len = le16_to_cpu(wpa.datalen);
> -			memcpy(pstr->data, wpa.data, pstr->len);
> -			*/
> +			 * pstr->len = le16_to_cpu(wpa.datalen);
> +			 * memcpy(pstr->data, wpa.data, pstr->len);
> +			 */

Why keep this code at all?  Please just delete it as it's obviously not
being used.

thanks,

greg k-h
