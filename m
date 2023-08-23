Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439420F1
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 07:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD3BC433C7;
	Wed, 23 Aug 2023 07:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692775504;
	bh=1studFEeQMbmLRoPYWeUq2xQ+7OX2VLP9fugdfnqMkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWyMlhWRv6sXMsR1yMY0M9pZpNmcpuiFGEDlVRBO4ODn9UpeuaWafzD6RukGWnyDg
	 PD0UtLcmgoyihQa3WbjhfDgV8NYgm03/Wr/rieFEDyRZT/R61YE5jdIQWvJuejV0Lt
	 yvDtExPHqxNWIMWIDxuYITnvaSL7zgXCS14NZj/RX5DlzX7bDlitsl9BOfLlAtLcIn
	 8wHhUZ7wrp2I9JCozw7Q/hLK674mQQX1Jj3jdt7zTAAaZYLONydoLMzgHJaZ7WAwjG
	 hyQRQAcJtEnmGcOHjAsp+aIBGs5X2OPXUyubrhgJ6+jowHRj31YFcYQg6S1AEWkEu2
	 niB3JP7EqEV+A==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qYiEX-0007eb-1b;
	Wed, 23 Aug 2023 09:24:53 +0200
Date: Wed, 23 Aug 2023 09:24:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
	hvaibhav.linux@gmail.com, elder@kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] staging: greybus: arche-apb-ctrl: remove
 unnecessary platform_set_drvdata()
Message-ID: <ZOW0ReI1EUM70YGm@hovoldconsulting.com>
References: <20230811070826.739049-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811070826.739049-1-yangyingliang@huawei.com>

On Fri, Aug 11, 2023 at 03:08:26PM +0800, Yang Yingliang wrote:
> Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
> the driver_data will be cleared in device_unbind_cleanup() after
> calling ->remove() in driver call code.

s/call/core/
 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 8541995008da..5c77c1813214 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -423,7 +423,6 @@ static void arche_apb_ctrl_remove(struct platform_device *pdev)
>  {
>  	device_remove_file(&pdev->dev, &dev_attr_state);
>  	poweroff_seq(pdev);
> -	platform_set_drvdata(pdev, NULL);
>  }

Should be ok:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
