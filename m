Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6080A17EC
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 08:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB3BC341C7;
	Sun, 26 Jun 2022 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656231659;
	bh=j4UfyQrlOyGm/1PgSuQ/6EcYNsoqlK+aVO223Z4irGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jYKkmQF/icVatvfbN8EFX8RpGRiEINdNegABCSyzAUB/0UH5j9s000U5c8d+cJHvC
	 2Q7m3AZi3Ckh+LmZPRwkXSeOF7OZBvMY6UJZ9HvTXmFubhnVXOHYhbwYK5NibZHW9d
	 RDIFUjOy0OyfJW1LqGwWHoP327ey6ubJV58xOBYw=
Date: Sun, 26 Jun 2022 10:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SebinSebastian <mailmesebin00@gmail.com>
Cc: skhan@linuxfoundation.org, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove null checking before freeing
 functions
Message-ID: <YrgW5vB0Nxs/hqwC@kroah.com>
References: <20220626074417.661312-1-mailmesebin00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626074417.661312-1-mailmesebin00@gmail.com>

On Sun, Jun 26, 2022 at 01:14:11PM +0530, SebinSebastian wrote:
> Fix the following coccicheck warning:
> drivers/staging/r8188eu/os_dep/usb_intf.c:376:2-7: WARNING: NULL check before some freeing functions is not needed.
> 
> Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 68869c5daeff..f5f1119b5444 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -372,8 +372,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>  free_adapter:
>  	if (pnetdev)
>  		rtw_free_netdev(pnetdev);
> -	else if (padapter)
> -		vfree(padapter);
> +	
> +	vfree(padapter);

You introduced another coding style issue, and you changed the logic to
be different here.  Are you sure you want this change to be accepted?

thanks,

greg k-h
