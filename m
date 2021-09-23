Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CDF3FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 11:33:24 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 194so20614004qkj.11
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KocIdb5jGuc17zu7Ll5xKBIwOSA5eG6mKrlgAJ0LxPk=;
        b=jKGoPkObEigizFUz6D0Nb5woqSbqQAGmw9/51htmMj8HWAau+xga/3nbPrl3CPpvcq
         wpVoYqgk2b0zTJawstauM+EqApBwi9vrq95W/ceXU0vUQOSbwwlQ4gsTZWtJBjMzTnM4
         CPG3kdqfzNZ17Fd2Ti9Pnq3iVGwVe7aWAOhd1ofZkSd8lcLVl25NFDA33/sbAwyUe7ML
         NpNvXGoUJdJlfXJzc27A3eTI0krPfyc8yOBxltFuMiuBWKzoEOjf48iFPTXAdp6MWhQ3
         5eo/UQIgdatPHItWRLllFH8tzTpA9O9G7BIHWec3Hsz4bN8+TPZiJp3HrYIABwlgns//
         i5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KocIdb5jGuc17zu7Ll5xKBIwOSA5eG6mKrlgAJ0LxPk=;
        b=8A9tQU1/d/TJ+JZsTutC01XbwHbMBk9MgX++ubBm2DyG2aK0XcRfYMX44aHRVbdi9C
         koRWHkESO718zhyJEcq5g6hL/t1sIkNRblGixE5/7dl2GfYgwAw73UdZfvBDI/r0GiUV
         Ue1q3RRPHVYaqM8hAoTkPp9SYuK/2IkGMrrimwNUofWf6IF3Ox1n4x/5Uy/ma3KcvVAw
         MddFOBplTr8DTRt6F27gHXrdE6YeuNQ5zlpHPO3mj1zoex5FwFUhpS3rXz7+84+a4lb4
         0gM2uMWKBBxY3AltbixPESqpx9HmY9kkJBT3d5J2O0yHhRD2XtymKorfZWwXNuSBgkxp
         Yv6Q==
X-Gm-Message-State: AOAM533jR7lf5fm5cGAxXj7GOyDXSX7lYyOxf7AB9bIaiAWo/UE/tLJO
	vZBYWqI9k2eAhqbGf8+SkkHmJQ==
X-Google-Smtp-Source: ABdhPJwLwFfPzjykD3Copu6BELIep6lzhOLkv+Q6ahS3Z1gWTVrd+LZwseEjX8HGZsp0xkALgkgwAA==
X-Received: by 2002:a37:f615:: with SMTP id y21mr4154292qkj.523.1632396803762;
        Thu, 23 Sep 2021 04:33:23 -0700 (PDT)
Received: from fedora ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id v5sm3996894qkh.17.2021.09.23.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 04:33:22 -0700 (PDT)
Date: Thu, 23 Sep 2021 08:33:18 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Constify static struct v4l2_m2m_ops
Message-ID: <YUxl/r8P2/k13FQZ@fedora>
References: <20210920200210.18935-1-rikard.falkeborn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920200210.18935-1-rikard.falkeborn@gmail.com>

On Mon, Sep 20, 2021 at 10:02:10PM +0200, Rikard Falkeborn wrote:
> The only usage of vpu_m2m_ops is to pass its address to v4l2_m2m_init()
> which has a pointer to const struct v4l2_m2m_ops as argument. Make it
> const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index f23fc14b3562..fb82b9297a2b 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -179,7 +179,7 @@ static void device_run(void *priv)
>  	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
>  }
>  
> -static struct v4l2_m2m_ops vpu_m2m_ops = {
> +static const struct v4l2_m2m_ops vpu_m2m_ops = {
>  	.device_run = device_run,
>  };
>  
> -- 
> 2.33.0
> 
