Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2D2F33
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 21:36:04 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id s128so8254100oie.10
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 14:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W1lfMFF7GwisucHEs2WhdN/ngSj9xjvJck8CvmDPr8Q=;
        b=m3zlf3eaY+ozNxIYDmb53Dyn4cP8iN10VPE2PcHMMkNQ9B2QriL/uoXD3KinNbSCAf
         R/jGyCPjVfs+Y/AURJLDM3VfiBz+w/TJUmx1mPLs5NfjNaUicM/sJBmLH7oa78GdqTRd
         dCfTnoM1Y/xR0GDVkc+OMWaXuozZ8hXrGWyFj3Oc8s9x/D7hYkqVt7waYUXceAKyQYBR
         hJGiu3OXz4anUqmK+YnlzMOskhRFOwH68SeARH3VE9rqYgvskwyPmoxINBIWCoKpQqS5
         ZS5z+fQYqavQg+9MF6Bgtw4OiOxkzfd4UPKbX12r6/rTuAJsMPguquCbHZi1YOP5NHGG
         CIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1lfMFF7GwisucHEs2WhdN/ngSj9xjvJck8CvmDPr8Q=;
        b=EEvzIMwu1IlWGntQWyFArWOHFOcMQxUL00QU+B71YWQnzuf3nUhf3Dm789USN3JxUC
         XCk8jIWG7s1oaBNMVVp/RW+zc3j/khVaPxhPWYs6RTytYIFKzIO6bGvSb+sapSDgnVVY
         U53pUP1oabgMRTq0yQm2LU6r9O+6ZQ4XU8UXjxeG04Hg0GIrk+P8WAPoCLF1v/4tSXo7
         lAOHTS/vSRJx+fe7jZladU6/+yjGkWDwLapK5pSyroC2iRAgBuOs0oSNHukv+f6ctNmC
         Nu39sQKTWtlJWV3L3KmRg5leyKi0VL/DQVxGMaOBbCkluGZ8n9wZX3804AfNPEnp/MTB
         uOgA==
X-Gm-Message-State: AJIora/M7tv07mhkH8TEU9tbxHpcQ8xcThgeRoV/5Af+rjCgDDmzR2Uh
	EqjdBU+CYa/uzVML+B8YFIT7MQ==
X-Google-Smtp-Source: AGRyM1ukzkSjiYh6xdbkafb6/cn72eoJoX+cxrroy+Ym4I4X16AsdivaNNxd+cGYK6dsX/hak9UA+A==
X-Received: by 2002:a05:6808:2127:b0:335:9807:959e with SMTP id r39-20020a056808212700b003359807959emr251350oiw.270.1657575363633;
        Mon, 11 Jul 2022 14:36:03 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id cj8-20020a0568081b8800b00339e4ca6a15sm3239334oib.45.2022.07.11.14.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:36:03 -0700 (PDT)
Date: Mon, 11 Jul 2022 18:35:57 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
	samuel@sholland.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: cedrus: Improve error messages for controls
Message-ID: <YsyXvfvjxWIPZle6@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
 <20220620175517.648767-4-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620175517.648767-4-jernej.skrabec@gmail.com>

On Mon, Jun 20, 2022 at 07:55:13PM +0200, Jernej Skrabec wrote:
> Currently error messages when control creation fails are very sparse.
> Granted, user should never observe them. However, developer working on
> codecs can. In such cases additional information like which control
> creation failed and error number are very useful.
> 
> Expand error messages with additional info.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index b12219123a6b..99c87319d2b4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -242,7 +242,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  	v4l2_ctrl_handler_init(hdl, CEDRUS_CONTROLS_COUNT);
>  	if (hdl->error) {
>  		v4l2_err(&dev->v4l2_dev,
> -			 "Failed to initialize control handler\n");
> +			 "Failed to initialize control handler: %d\n",
> +			 hdl->error);
>  		return hdl->error;
>  	}
>  
> @@ -257,7 +258,9 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  					    NULL);
>  		if (hdl->error) {
>  			v4l2_err(&dev->v4l2_dev,
> -				 "Failed to create new custom control\n");
> +				 "Failed to create %s control: %d\n",
> +				 v4l2_ctrl_get_name(cedrus_controls[i].cfg.id),
> +				 hdl->error);
>  
>  			v4l2_ctrl_handler_free(hdl);
>  			kfree(ctx->ctrls);
> -- 
> 2.36.1
> 
