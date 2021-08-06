Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B370
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 04:44:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n11so4751765wmd.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 21:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E0jyHp/rsGyUBSc/zm3UYnSO11nUqZFB/b8HFTileso=;
        b=ZaKaUNq4AgYnG4GdQ5eqSLqVW/wDX1bizpgI8lyRUVfSefWJR4gnOKcxUs4jO3WwR2
         8cWBh/lUuQADuFIiTYe19Pcp+2haBCGqJPhEW1kDuZXuIOboKM8et3RREU0J0Rge3BE0
         G2u9uF3iUEZ+s66H5z1skSMHc967llUi5zguD/vSEwG64XVsAjhyEfOil4/Myp5ziefK
         XmExXLvlOUJJlBo+EGSsyTcgrEUOckBJNRYvLMiWuxIHLkovGMsxjPmfVhuFYS5ZZHFW
         NeGk/Ewlr3op9jNz/21XH0REmy+elmcafRcoqQFGc3LhWPS1JE8s/ze8JrjRo0Yegc4u
         BfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0jyHp/rsGyUBSc/zm3UYnSO11nUqZFB/b8HFTileso=;
        b=sEJyLuwiOqkqdpLSSLYNMRkB4lgpTxpJBM8gSEkXyQ9dBpnXmW/QzCch1Wvbg5Y2JI
         r+jV0t4rzygjmVnnUqtsuxR4DVU+eXAw20JEEPDraJc3l755UBE/4pjyT8Ww1ZV7/L8C
         6M5OAbye0n6eASKq8MPvRUieretA5lBdaIQZyAj5H5p8Rk1tdXM2ZiyosqT4a8jbcTVt
         4QS629voQZOp38b08W0csQdQDhgJnySKXOq9Oey0pvAp1GH9nlHhjNrXfgY6JGNXiqfx
         Vm7R8Az2zumO6EaQzvS0v6ZNSnDNeZwGaQhqcrrjA6Ho83jzSFvFp7siOqOStellvBPY
         2+hA==
X-Gm-Message-State: AOAM533UjfgipBb1+7GMdtgEM92kr7ggBBVVseFoy7intXH8ezJdqOGJ
	WtmtIHLvTUW7gEYPYzUI0B8=
X-Google-Smtp-Source: ABdhPJxKDTpXqvSGlHpDAJS36fz0bWT2b7ZusMwx5tRfozqoV+Pq4PjSyJaVLySbfv23BEGZP0dJ2Q==
X-Received: by 2002:a7b:c8d9:: with SMTP id f25mr1217959wml.40.1628225077496;
        Thu, 05 Aug 2021 21:44:37 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id n11sm9766446wrs.81.2021.08.05.21.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 21:44:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: p.zabel@pengutronix.de, Ezequiel Garcia <ezequiel@collabora.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, emil.velikov@collabora.com, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Fix check for single irq
Date: Fri, 06 Aug 2021 06:44:35 +0200
Message-ID: <8101406.vZ8PxZ7URt@jernej-laptop>
In-Reply-To: <6761bb11f4554e9f9cbe468b5ff8f851c57515ef.camel@collabora.com>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com> <6761bb11f4554e9f9cbe468b5ff8f851c57515ef.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 06. avgust 2021 ob 00:03:36 CEST je Ezequiel Garcia napisal(a):
> Hi Jernej,
> 
> On Thu, 2021-08-05 at 21:04 +0200, Jernej Skrabec wrote:
> > Some cores use only one interrupt and in such case interrupt name in DT
> > is not needed. Driver supposedly accounted that, but due to the wrong
> > field check it never worked. Fix that.
> > 
> > Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single
> > irq/clk") Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/hantro/hantro_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c
> > b/drivers/staging/media/hantro/hantro_drv.c index
> > 8a2edd67f2c6..20e508158871 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device *pdev)
> >                 if (!vpu->variant->irqs[i].handler)
> >                         continue;
> >  
> > -               if (vpu->variant->num_clocks > 1) {
> > +               if (vpu->variant->num_irqs > 1) {
> 
> Oops, thanks for spotting this.
> 
> How about this instead?

No, original solution is more robust. With solution below, you're assuming 
that irq order in driver array is same as in DT. That doesn't matter if there 
is only one name or if names match. However, if there is a typo, either in DT 
node or in driver, driver will still happily assign clock based on index and 
that might not be correct one. Even if it works out, you can easily miss that 
you have a typo. Driver doesn't tell you which irq is used, if it is 
successfully acquired.

Best regards,
Jernej

> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c
> b/drivers/staging/media/hantro/hantro_drv.c index
> 31d8449ca1d2..af7054b04155 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -918,16 +918,15 @@ static int hantro_probe(struct platform_device *pdev)
>                 if (!vpu->variant->irqs[i].handler)
>                         continue;
> 
> -               if (vpu->variant->num_clocks > 1) {
> -                       irq_name = vpu->variant->irqs[i].name;
> -                       irq = platform_get_irq_byname(vpu->pdev, irq_name);
> -               } else {
> +               irq_name = vpu->variant->irqs[i].name;
> +               irq = platform_get_irq_byname(vpu->pdev, irq_name);
> +               if (irq <= 0) {
>                         /*
> -                        * If the driver has a single IRQ, chances are there
> -                        * will be no actual name in the DT bindings. +    
>                    * Missing interrupt-names property in device tree, +    
>                    * looking up interrupts by index.
>                          */
>                         irq_name = "default";
> -                       irq = platform_get_irq(vpu->pdev, 0);
> +                       irq = platform_get_irq(vpu->pdev, i);
>                 }
>                 if (irq <= 0)
>                         return -ENXIO;




