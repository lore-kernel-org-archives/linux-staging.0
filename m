Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A02C80
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 08:18:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F6286115A;
	Sun,  7 Nov 2021 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636273121;
	bh=Vbjzal/eZHLWmeoR3+SoXkqQt/EcP5e+JTUd3sCrSig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvw4kucNBbjeK6cYRpSeAd50soKpuSHbMf0RCdGPigSVVljE7ocVuCSzgEp1wcLlY
	 9FlrrLLQ+svFHumx82iV2Lm4+7dmy4dJzANhXuyodFeaNeqrD9F0di4v74UmDWZjwr
	 4pzqLfkJdEGXLsz5xsZU1W3M0iksQXk4SIjUvXl4=
Date: Sun, 7 Nov 2021 09:18:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zameer Manji <zmanji@gmail.com>,
	Stable <stable@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: Fix breakage introduced when 5G code
 was removed
Message-ID: <YYeL2jSDE4XJy/nJ@kroah.com>
References: <20211107013123.14624-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107013123.14624-1-Larry.Finger@lwfinger.net>

On Sat, Nov 06, 2021 at 08:31:23PM -0500, Larry Finger wrote:
> In commit 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions
> and code"), two entries were removed from RTW_ChannelPlanMap[], but not replaced
> with zeros. The position within this table is important, thus the patch broke
> systems operating in regulatory domains listed later than entry 0x13 in the table.
> Unfortunately, the FCC entry comes before that point and most testers did not see
> this problem.
> 
> Reported-and-tested-by: Zameer Manji <zmanji@gmail.com>
> Fixes: 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions and code")
> Cc: Stable <stable@vger.kernel.org> # v5.5+
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 55c3d4a6faeb..d3814174e08f 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -107,6 +107,7 @@ static struct rt_channel_plan_map	RTW_ChannelPlanMap[RT_CHANNEL_DOMAIN_MAX] = {
>  	{0x01},	/* 0x10, RT_CHANNEL_DOMAIN_JAPAN */
>  	{0x02},	/* 0x11, RT_CHANNEL_DOMAIN_FCC_NO_DFS */
>  	{0x01},	/* 0x12, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
> +	(0x00), /* 0x13 */

I don't think you test-built this :(
