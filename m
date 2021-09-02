Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE372
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:21:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2777960F6C;
	Thu,  2 Sep 2021 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630574459;
	bh=Q2uYr1StgndRxWJ5vI83t1KnU1e0/MBW/UEtfaBfT8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIP+QkNrbd8Sb9tSGQg/GS2C8xuDV0VPA2aZiKGuLQ/3mtyZoPB4hZBhW7ED/i81m
	 ty5/bxVjc0IJZXGurW4oqKTny0uvjIXZnIxRVZkeKruzbsoaAphl5fZ5PMs+bYanqn
	 XE0mq6DFZFCaKPCOdVlj8Zq2nlUqKMt0M461P0Zw=
Date: Thu, 2 Sep 2021 11:20:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc
 and memcpy
Message-ID: <YTCXef5o9JHtQhuD@kroah.com>
References: <YSp9z2/JmvHGhW5m@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSp9z2/JmvHGhW5m@user>

On Sat, Aug 28, 2021 at 11:47:51PM +0530, Saurav Girepunje wrote:
> Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 81d4255d1785..495fadd2b8c8 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
>  	}
> 
>  	if (ielen) {
> -		buf = kzalloc(ielen, GFP_KERNEL);
> +		buf = kmemdup(pie, ielen, GFP_KERNEL);
>  		if (!buf) {
>  			ret =  -ENOMEM;
>  			goto exit;
>  		}
> 
> -		memcpy(buf, pie, ielen);
> -
>  		/* dump */
>  		{
>  			int i;
> --
> 2.32.0
> 
> 

This patch never showed up on lore.kernel.org for some reason.  Please
resend and see if it was a mailing issue on your side...

thanks,

greg k-h
