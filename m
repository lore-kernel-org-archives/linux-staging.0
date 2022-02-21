Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1316B2569
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236EBC340E9;
	Mon, 21 Feb 2022 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463124;
	bh=5MfT2oHc40ecxh8J5Ub5ggnpJn5KsjhhqhGoFvH2PBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Hw+yRmAqVoMat+juk54S2+mFp4mWhfVxu2KLCfHrJ8JUrst+w2uA7Ahf7716md/n
	 RVbJbOkBdpZBeyLPuAL5Vwox7mWNlfschmfoWbDtNKqBMbh5rt7XR+wharlsAXRLGa
	 okobl9AJXkSojAoVDgDxVigR3adCnawQZ3zgiz8s=
Date: Mon, 21 Feb 2022 18:05:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: jerome.pouiller@silabs.com, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: wfx: check the return value of
 devm_kmalloc()
Message-ID: <YhPGUlkeT3UtvIEd@kroah.com>
References: <tencent_24A24A3EFF61206ECCC4B94B1C5C1454E108@qq.com>
 <tencent_3CB9DC1C721449E14B4AD3FF65201CCC4C08@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3CB9DC1C721449E14B4AD3FF65201CCC4C08@qq.com>

On Fri, Feb 18, 2022 at 10:04:02PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> devm_kmalloc() returns a pointer to allocated memory on success, NULL
> on failure. While there is a memory allocation of devm_kmalloc()
> without proper check. It is better to check the return value of it to
> prevent wrong memory access.
> And I use the err label which is introduced by the previous patch to
> handle the error.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> Changelog
> v1->v2 update the description.
>  drivers/staging/wfx/main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
> index 9ff69c5..85fcdc3 100644
> --- a/drivers/staging/wfx/main.c
> +++ b/drivers/staging/wfx/main.c
> @@ -294,6 +294,9 @@ struct wfx_dev *wfx_init_common(struct device *dev,
>  	hw->wiphy->n_iface_combinations = ARRAY_SIZE(wfx_iface_combinations);
>  	hw->wiphy->iface_combinations = wfx_iface_combinations;
>  	hw->wiphy->bands[NL80211_BAND_2GHZ] = devm_kmalloc(dev, sizeof(wfx_band_2ghz), GFP_KERNEL);
> +	if (!hw->wiphy->bands[NL80211_BAND_2GHZ])
> +		goto err;
> +
>  	// FIXME: also copy wfx_rates and wfx_2ghz_chantable
>  	memcpy(hw->wiphy->bands[NL80211_BAND_2GHZ], &wfx_band_2ghz,
>  	       sizeof(wfx_band_2ghz));
> -- 

This patch does not apply to my tree at all.  Please rebase and resend.

thanks,

greg k-h
