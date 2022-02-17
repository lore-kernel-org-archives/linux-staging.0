Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA764347
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 15:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94420C340E8;
	Thu, 17 Feb 2022 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645112166;
	bh=Zx+rgR2hkDkUpjC2HrW0GPCmiJR+q3mTUymGonHF0Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yJOBxsu+z07yoINNUn7hTlhwrQx5S2OlmjLojEN1iNHSjTvb1OedtTRc/vf/JKU2a
	 fybEj/ZyQodudhdIEAXMOH9ilkmqHFoYKXblPRC3ZUhOwUk+Sbd3RGXuDKa61e1aaJ
	 0LsjrY/87AevrE2eakIbiGMMcKoZQzCoD1OWqUtM=
Date: Thu, 17 Feb 2022 16:36:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: jerome.pouiller@silabs.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wfx: fix the error handling in wfx_init_common()
Message-ID: <Yg5rY3Qo7dPHbLI0@kroah.com>
References: <tencent_A552D77F0E081BB36EAE11C720455D78BD06@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_A552D77F0E081BB36EAE11C720455D78BD06@qq.com>

On Thu, Feb 17, 2022 at 11:29:06PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> All the error handlers of wfx_init_common() return without calling
> ieee80211_free_hw(hw), which may result in memory leak. So I add
> one err label to unify the error handlers.
> 
> Suggested-by: Jérôme Pouiller <jerome.pouiller@silabs.com>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/wfx/main.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
> index 4b9fdf9..f83df9f 100644
> --- a/drivers/staging/wfx/main.c
> +++ b/drivers/staging/wfx/main.c
> @@ -309,7 +309,8 @@ struct wfx_dev *wfx_init_common(struct device *dev,
>  	wdev->pdata.gpio_wakeup = devm_gpiod_get_optional(dev, "wakeup",
>  							  GPIOD_OUT_LOW);
>  	if (IS_ERR(wdev->pdata.gpio_wakeup))
> -		return NULL;
> +		goto err;
> +
>  	if (wdev->pdata.gpio_wakeup)
>  		gpiod_set_consumer_name(wdev->pdata.gpio_wakeup, "wfx wakeup");
>  
> @@ -325,9 +326,13 @@ struct wfx_dev *wfx_init_common(struct device *dev,
>  	wdev->force_ps_timeout = -1;
>  
>  	if (devm_add_action_or_reset(dev, wfx_free_common, wdev))
> -		return NULL;
> +		goto err;
>  
>  	return wdev;
> +
> +err:
> +	ieee80211_free_hw(hw);
> +	return NULL;
>  }
>  
>  int wfx_probe(struct wfx_dev *wdev)
> -- 

Please make this a patch series, properly numbered, and not 2 individual
and separate patches as the second one relies on this one, yet that it
not conveyed to anyone at all :(

thanks,

greg k-h
