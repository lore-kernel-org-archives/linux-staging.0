Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EAD6D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 13:57:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id a4so2262841wrr.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6miOsCN9DRTNbPpezNAybueDA0Yo59tqLPZxCeBa914=;
        b=JSudo/YnP226VSlYgSaJSXG88wye+oZiMgoE00/4qim7e+dlKR7K6V6ix7W+6+n6Hp
         ed3JEtXifz3iX3nDYS1Iq34YpurpO0LSYa7YuY1NVx8Fsf+YzKROjh2hXQNxyqjH0T1N
         CPSlpcJlWh2UMoh3pjJdyey/23FU9nT/3oN9f36SLTPWzlsvp5onThBBCyXavJvm0yZ8
         sOX+ZmH6wYeVUHr/a0sYO+OiS+ilNogSb2zStrHQxV/4DLlIF8zLWZrVNmHb+XbUgzku
         GiBYdi7Ye3M6uDr/xfTk1Ir46f5uEcygEAHKdX0X9GUhq5XMtGvJMb1u5opLU+RtBizm
         +GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6miOsCN9DRTNbPpezNAybueDA0Yo59tqLPZxCeBa914=;
        b=DPcZa6fDLMCDd1Ml2WRyMGuZjir3/E5dALnoDEP/FK1W2ygfgLY07GU+uFfLiPObZG
         2hCc9TA4cZ5K+9DFCUniCsUQ6y+db0GVh/8qjfzINn7cXFZrB9uJVs4D714HUemMnQi6
         gxZIHXatomlQXjbiRmGIFtSkMfTpxYuODDD7WtyZtW0ucdDbKq0vybAWwA82lBaL42nC
         0g/jftYNpS1kkittBR/EUk6vih9PVI0TaoS7XmFbdp/o4DS45E1dg+P6s0BumXBNq/+p
         NvO6yNtxRxlS2u2Kr7nZCBforl5bQPfE7EbWuis484EE/NjmMd/UI+ekOYh9xHFRcLA4
         /4uw==
X-Gm-Message-State: AOAM533JnliutzpSxsCiGvpmKaLG+J6WcaEf2IcbMS7QEQkQX2euYxHx
	OTVh+3bNzxPVR07s9snOw3s=
X-Google-Smtp-Source: ABdhPJxhaKRC1qDi9jJ08/j9F42mAUlrBUmL4jBRLa/LIuGqxEGrEWbA6s6xO9LKEurZxU2YK80quA==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr11585327wrq.358.1617890224964;
        Thu, 08 Apr 2021 06:57:04 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 3sm10751500wma.45.2021.04.08.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:57:04 -0700 (PDT)
Date: Thu, 8 Apr 2021 14:57:02 +0100
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: kjlu@umn.edu, Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx7-mipi-csis: Fix runtime PM imbalance in
 mipi_csis_s_stream
Message-ID: <20210408135702.f7ikjvwirvtzsarv@arch-thunder.localdomain>
References: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>

Hi Liu,
Thanks for your patch.

On Thu, Apr 08, 2021 at 05:08:27PM +0800, Dinghao Liu wrote:
> When v4l2_subdev_call() fails, a pairing PM usage counter
> decrement is needed to keep the counter balanced. It's the
> same for the following error paths in case 'enable' is on.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index a01a7364b4b9..2a3fff231a40 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -627,21 +627,26 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  			return ret;
>  		}
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&state->pdev->dev);

I think here we should go completely pm_runtime_put to call the
mipi_csis_pm_suspend down the line, right?

>  			return ret;
> +		}
>  	}
>  
>  	mutex_lock(&state->lock);
>  	if (enable) {
>  		if (state->flags & ST_SUSPENDED) {
>  			ret = -EBUSY;
> +			pm_runtime_put_noidle(&state->pdev->dev);

since we are in ST_SUSPENDED state, for sure the pm counter was
already 0.

>  			goto unlock;
>  		}
>  
>  		mipi_csis_start_stream(state);
>  		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&state->pdev->dev);

here also we need the pm_runtime_put, maybe just changing the unlock
tag bellow from:
    if (!enable)
        pm_runtime_put(&state->pdev->dev);

to 
    if (!enable || (ret < 0))
        pm_runtime_put(&state->pdev->dev);

will not hurt the first case and will complete the suspend routine
afterward in the second case.

------
Cheers,
     Rui
>  			goto unlock;
> +		}
>  
>  		mipi_csis_log_counters(state, true);
>  
> -- 
> 2.17.1
> 
> 
