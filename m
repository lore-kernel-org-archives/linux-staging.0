Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE17C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 11:05:53 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r8so5255938oib.5
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 04:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5nNjTIYgpRbZw5I/VzC+f5/bljYzlHsJFDDO5VmuXF4=;
        b=ZALJ1zIYb+btHV9fF5mqAUH3lr58JYRyAtclQkdj24wtnkG8korJrsq6BGNI5Taa/8
         htEUb9QhjwVs8pDoXQ8D825fh4TCbN9lA2RsR16RVoy+V2GEkSYWknnbbrlj/lxJJYzx
         ztaOPs4SDSiKbekB8T5S9v/c/61//RT6Vj9FdlgCiVSItpqpz2M/vfS4p6mL3Uq2HGgF
         y0hPIdsDiBvxoJP2XfTDyy1f1efPWcdAUhhbuej3SJHxjWEXSl1JH6ZJ+UJ0kwijEKcd
         10teOP1iedzJPBGcHLTOqSrbSJX6UiGjiaQ1//oCQfCEeEpuCSt0pkKN1oIvpEFGCHV6
         j3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5nNjTIYgpRbZw5I/VzC+f5/bljYzlHsJFDDO5VmuXF4=;
        b=iem4h0aSeApWmawRslzFK36eNsVkYHaDmOZy4f4LHoru+kap7BbTRVBoKJ4BcIbmvk
         kK49jMszZ/pjnCwjRvbspv1yvz7Yvdzp30qijSN0q7m6g846YkRTnp+fq4Ienre09huO
         AuAkh9JBDqCPGbe23UTTZUHgIwkwdA/pCk246XafadXmIrEC2Sy9Z8RMyAodXesKRt+R
         SA9Mko83BBwlaBUed6/CYmf0zmQXT0FLOCvg51Wv1lfyc+WPje5nwHslTjh87DvgFElx
         8TpwaNrx47bUQCeKJ7SDEwRzxhEwORkY5EbJAY1Sdc53xJZR6/dnyVeMB9X6Czz+qQr8
         Hagg==
X-Gm-Message-State: AOAM532j+enh5augmZAUjdgMi0dj0tFniVqc6LWI1mBM3ph1m7g+UiV9
	AlvLPTfK4Y5vn+Lq3XeaIoCJEw==
X-Google-Smtp-Source: ABdhPJzPRczjH6KHvYSlj/i+EL+piiYu7Xx2mZo2CtSLq9y3JKUxXPusvcgWdoeQIGT46zZyG6a1GA==
X-Received: by 2002:a05:6808:1413:b0:2ef:4a81:2ee8 with SMTP id w19-20020a056808141300b002ef4a812ee8mr6278818oiv.125.1648897552507;
        Sat, 02 Apr 2022 04:05:52 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d644f000000b005ce0a146bfcsm2174508otl.59.2022.04.02.04.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:05:51 -0700 (PDT)
Date: Sat, 2 Apr 2022 08:05:46 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/23] media: rkvdec: Stop overclocking the decoder
Message-ID: <YkguChEzVz7T9qZV@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-13-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-13-nicolas.dufresne@collabora.com>

On Thu, Mar 31, 2022 at 03:37:14PM -0400, Nicolas Dufresne wrote:
> While this overclock hack seems to work on some implementations
> (some ChromeBooks, RockPi4) it also causes instability on other
> implementations (notably LibreComputer Renegade, but there were more
> reports in the LibreELEC project, where this has been removed). While
> performance is indeed affected (tested with GStreamer), 4K playback
> still works as long as you don't operate in lock step and keep at
> least 1 frame ahead of time in the decode queue.
> 
> After discussion with ChromeOS members, it would seem that their
> implementation indeed used to synchronously decode each frames, so
> this hack was simply compensating for their code being less
> efficient. In my opinion, this hack should not have been included
> upstream.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index c0cf3488f970..2df8cf4883e2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -1027,12 +1027,6 @@ static int rkvdec_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * Bump ACLK to max. possible freq. (500 MHz) to improve performance
> -	 * When 4k video playback.
> -	 */
> -	clk_set_rate(rkvdec->clocks[0].clk, 500 * 1000 * 1000);
> -
>  	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rkvdec->regs))
>  		return PTR_ERR(rkvdec->regs);
> -- 
> 2.34.1
> 
