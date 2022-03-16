Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310C290E
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 06:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB50C340E9;
	Wed, 16 Mar 2022 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647412831;
	bh=TEEVCtov0uvaa0mtrBCOKBjl0ZC+ALGzF1+Ca8qo+NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFDhvXGs7fl172dILd97WD5BzFBV/8gpClpyZbmxCN+j2hpuvEWB33XyYOQ138Tna
	 glvBH0pLN5L8ABi6q47+IuTdMzZEcFAn7+XXrEdRBKwlg+nkkfZHfB9fpRr4tr7wjK
	 I08giLTBAxY2nIAw5vx7f6Co5/WdJ7Lw6nxGOea0=
Date: Wed, 16 Mar 2022 07:40:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] staging: r8188eu: remove local BIT macro
Message-ID: <YjGGV226yQv0vKMS@kroah.com>
References: <20220315205041.2714168-1-martin@kaiser.cx>
 <20220315205041.2714168-7-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315205041.2714168-7-martin@kaiser.cx>

On Tue, Mar 15, 2022 at 09:50:41PM +0100, Martin Kaiser wrote:
> The r8188eu driver defines a local BIT(x) macro. Remove this local macro
> and use the one from include/linux/bits.h.
> 
> The global BIT macro returns an unsigned long value. Therefore, we have to
> cast DYNAMIC_BB_DYNAMIC_TXPWR to u32 explicitly. This define is used with
> the bitwise not operator.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>  - cast DYNAMIC_BB_DYNAMIC_TXPWR to u32, fix build error on 64-bit systems
> 
>  drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
>  drivers/staging/r8188eu/include/wifi.h         | 7 +------
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> index 0c555ea6719b..2b5089be5156 100644
> --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> @@ -34,7 +34,7 @@
>  /*  BB ODM section BIT 0-15 */
>  #define	DYNAMIC_BB_DIG				BIT(0)
>  #define	DYNAMIC_BB_RA_MASK			BIT(1)
> -#define	DYNAMIC_BB_DYNAMIC_TXPWR	BIT(2)
> +#define	DYNAMIC_BB_DYNAMIC_TXPWR	((u32)BIT(2))

That's really odd, why the cast for just one define?  Try fixing up
where this is used instead.

thanks,

greg k-h
