Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF86D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 08:53:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f12so4872759wro.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5A7hip5HNnqqYLaE8cwZV0V2a06xYyPPsPaw4/onnlI=;
        b=E/8GgFwelU6ZMU3BlvWFt00DzbWUEBm+p5if5yuq3rd8uBeRrXl3L+F9A1CmFfxl61
         g/kXk3pws6NLEC8xhd+wm+VPLMNPsaFs047yGXm0k9mHdetig8vqDF5O/TfDsc5zm+oL
         1MWxS5g2Q7LUNt25SvQS/TtB81xp7x7WU2WQ7Di40zAZTElW3dvk4lvh7g4mVdewQ7Au
         PToOU1uAhPy0wrFSWmiOZkaFG4EaaJk9HJhkjtmJ4CRGR0q+rAorI3bizPQc7bKDdABb
         wcVfQpT3jQMhzx/4WBlVrU/zKXplS2tp+lk0ctKfNB3l6WBqY75jpjokU95VlI+qe+SM
         ipuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5A7hip5HNnqqYLaE8cwZV0V2a06xYyPPsPaw4/onnlI=;
        b=SdXKDyL87ifNQrKEnMmeuNtTljqDYqVPXeBVETPYm3VT59Ei/jjyR8H5K1E7bC/jpr
         kyofzFfNGRAGfzs+xza1aTmFpW3zpwQJKwfGYQ1wP99OJFRc4Qmocgkz5Zma9yD+YFUK
         xIgyAW+365RX9eU++3h5WS0t54C5OxVP7sIzzhH3TZ2WxEmJ5TvWPrn1lSbO+Zlm1tWc
         Cbpvi3IOhZ1WJ4tYJxbsNE4iqPGoDm2vxJWoO8f5EcpWQiG2KXsFYrIY2MnnpPbJ8/i6
         lD28CQUaRGwvNAJXVI21DKb6c6LQGXuQCTikblqdeFynBA8NTMVsyciIIgu/4sWhoMak
         kQ1g==
X-Gm-Message-State: AOAM5309Xt/2gK35c3shvSxXtSRlrlTV1r1ZiW6ncVNyrkU1HUkDp8vp
	v3SO/DFyPL/RRH2mVt4A/5A=
X-Google-Smtp-Source: ABdhPJy/hMUhoUXl46PoPPOyK3KQawtQgk1CfJKQDeLLRw4/8Cfdeh7A5T2E2ovfJVBF3SouidyLFg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr16303013wrd.47.1617958399990;
        Fri, 09 Apr 2021 01:53:19 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id m67sm1659146wme.27.2021.04.09.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 01:53:19 -0700 (PDT)
Date: Fri, 9 Apr 2021 09:53:17 +0100
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
Subject: Re: [PATCH] [v2] media: imx: imx7-mipi-csis: Fix runtime PM
 imbalance in mipi_csis_s_stream
Message-ID: <20210409085317.ycj273fqwbmowfqb@arch-thunder.localdomain>
References: <20210409082225.22461-1-dinghao.liu@zju.edu.cn>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409082225.22461-1-dinghao.liu@zju.edu.cn>

Hi Liu,
Many thanks for the patch.

On Fri, Apr 09, 2021 at 04:22:25PM +0800, Dinghao Liu wrote:
> When v4l2_subdev_call() fails, a pairing PM usage counter
> decrement is needed to keep the counter balanced. It's the
> same for the following error paths in case 'enable' is on.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

LGTM
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
> 
> Changelog:
> 
> v2: - Use pm_runtime_put() to balance the refcount.
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index a01a7364b4b9..6f3e8a15e7c4 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -628,7 +628,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  		}
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0)
> -			return ret;
> +			goto pm_put;
>  	}
>  
>  	mutex_lock(&state->lock);
> @@ -657,7 +657,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  
>  unlock:
>  	mutex_unlock(&state->lock);
> -	if (!enable)
> +pm_put:
> +	if (!enable || (ret < 0))
>  		pm_runtime_put(&state->pdev->dev);
>  
>  	return ret;
> -- 
> 2.17.1
> 
> 
