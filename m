Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43521C31
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 10:08:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d1so16503545wrs.12
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouhGwXSeaVgRDyF6aOYlnUe1G6PkcJ3a2Ia2veN59q8=;
        b=hbEPWRnyHRthni9llQ/pko59L9nujUbe07hiTRM2D3CWbFk2ap18EHe7YEPo5XTCEk
         dd4eQD3AdJsZoMCZrJjRUwPRKv/xQkJS7WttM6KeWBd8UFu2Runk2FKMdYFHk3LkgfZR
         ybYR3pbyVXD/b2cQMkSgaTquIo8exnsfE0Teg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouhGwXSeaVgRDyF6aOYlnUe1G6PkcJ3a2Ia2veN59q8=;
        b=j+sc6urreyr7CNa/ioKzwVeZYj3Y1C0+d16uS3i/lbbbhcmk3/9r0Yque3T16Rdvrd
         9iEdkpthB5pLGNEpkgLMXY0MALzulkc/xWLOVFmGdzDEwHjrrt4QTh9FKB7lSwRL4U5q
         +0KrWlCSf9KATAalf0CvPRCeWlFsCcZDP5RYpxT18YeSiP1Q0ld9iHEnZ3OsoBTYMUik
         QyN9sF1kuH228SZ/3+FIDUKCmEYfBdKjSwBaMfUPyE+x1GibbEGHbxSQ/sSuhK0f2HBe
         z4fzInJr9WaTyHNi3Zq1d5yzkV7jnA1g46dAhrSrKdDQatcDOL5+v3ZwA/AbRr+5+jG1
         YqVw==
X-Gm-Message-State: ANoB5ple3r2g0LnrGgtnrYSIQT540c33XNIQ6cdBcGoP2mKYUdKFyWGB
	PGLYUKefYvQL5RizVU34VW2Fgg==
X-Google-Smtp-Source: AA0mqf7JmrwWXtMFx88k5iciiSy2ZO2SDkDIGgwo8kBY1Ny7RPhvVd5HvnuLpUfi2CdI/K9sJvysrA==
X-Received: by 2002:adf:fb0e:0:b0:241:87cb:6e0c with SMTP id c14-20020adffb0e000000b0024187cb6e0cmr6841150wrr.166.1669198114044;
        Wed, 23 Nov 2022 02:08:34 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id m66-20020a1c2645000000b003cf9bf5208esm1695004wmm.19.2022.11.23.02.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:08:33 -0800 (PST)
Date: Wed, 23 Nov 2022 11:08:31 +0100
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>

Hi Geert,

On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> By moving support for the USB Syntek DC1125 Camera to staging, the
> dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> 
> Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")

Patch itself looks good but we have some style issue. Applying this
patch I got the following warning from checkpatchl:

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
#10: 

You have to pass only the first 12 chars of the sha1 commit into Fixes
msg:

Use:

 Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")

Instead of:

 Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")

Thanks & Regards,
Tommaso

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 4450403dff41fb64..7234498e634ac61c 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>  	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>  	depends on VIDEO_DEV
> -	depends on USB
> +	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here if you want to use this type of camera.
>  	  Supported devices are typically found in some Asus laptops,
> -- 
> 2.25.1
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
