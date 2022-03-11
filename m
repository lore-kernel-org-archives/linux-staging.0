Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0D77E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 09:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F020C340E9;
	Fri, 11 Mar 2022 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646992571;
	bh=ab7VsNuXPDQdr+uyKwLbZQHgJSCgd/UFnatZwakfS+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2Bc0uAGpZvxa/tPnL02+nFYcgg0IW8Verha5rHsgyioFwshHofX3SkrhMFbfWa2W
	 7nxrIP6WftRAC9FGFMFlVC66sqCK+Uqd/Qa5+qBZ8S1Gxx0tWQ3dbjUP3pTn1QJr8s
	 TFKxuND+NeM4kK6mjhfGd2aklxkz5gee76Tv+Hoo=
Date: Fri, 11 Mar 2022 10:56:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Directly return 0 instead of using
 local ret variable
Message-ID: <YiscuJ33Q1+vjw4A@kroah.com>
References: <1646990586-14794-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646990586-14794-1-git-send-email-baihaowen@meizu.com>

On Fri, Mar 11, 2022 at 05:23:06PM +0800, Haowen Bai wrote:
> fixes coccinelle warning:
> drivers/staging/r8188eu/hal/rtl8188eu_xmit.c:152:5-9: Unneeded variable: "pull". Return "0" on line 302
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> index 293541d..6ab89f8 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
> @@ -149,7 +149,6 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
>  
>  static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
>  {
> -	int	pull = 0;
>  	uint	qsel;
>  	u8 data_rate, pwr_status, offset;
>  	struct adapter		*adapt = pxmitframe->padapter;
> @@ -299,7 +298,8 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
>  	ODM_SetTxAntByTxInfo_88E(&haldata->odmpriv, pmem, pattrib->mac_id);
>  
>  	rtl8188eu_cal_txdesc_chksum(ptxdesc);
> -	return pull;
> +
> +	return 0;
>  }

No, as this function can only return 0, please make it a void function
and fix up the callers to simplify this.

thanks,

greg k-h
