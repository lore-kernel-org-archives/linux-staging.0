Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233E3B8B2
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686176569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
	b=RrY4GjPbWkjwTil5A21ybeGY6jhLTIUmuMDHkAuVuezKL7P4aoji5u4JM9ft10d9s+94BI
	xjskMCL6GGKhHUyFttsqs7aEejYMbAS+Vqy6Q3jh+0K3DpmYDgzPUWSbvuCGjtw9ttGZUE
	ZENXlz6molcCoyYfPIbVxTraQqeBzgk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-MYEVmcZxODC5bVZYnifkWg-1; Wed, 07 Jun 2023 18:22:46 -0400
X-MC-Unique: MYEVmcZxODC5bVZYnifkWg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f7f4dc6ec2so4150835e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 15:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176565; x=1688768565;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
        b=Mn5voT0H6s8xATQO+V3yGLwe7ZWRMzMemCyAqLkICnjts0TOqr+p9UroZF1I7DG8F3
         FuF6pQxgRcFF9D2mzDoF6fnoLMWHOcokjP3xeTe2Ik4FMN0EfiIgj1tJo3ptBZyPWXQF
         tfAqTf9uZlJW3ckF8tRrYnnl23favpGp5WgrLGb6Tn/0/Swd9IMsdJ599xmEncHndU/s
         GJrgV6ji8YM5JNK1vl7QYSqsFliDzVGd5Wkew18ffaxwvcplM1IA2lVJYPXwckFPQ0s8
         SRhChC/72gwKtXeTuSqZXFdj+rJrWwBvI/z8f6o4MTXg8VlD3XbwjdrBy1beV++hLp3X
         tHbw==
X-Gm-Message-State: AC+VfDx4cXF/bt0os0poa13UoxBc9SEnHKi0OgMjUvNDK+Ybx29kZN4f
	1YXUcMIC5HVsO24gk6sND91y0m8c4nO8D8Y6xDNF5sSnmkXRn8u1QZv3V34S2T1oMorWalBJJiE
	v1eLTlWf/nNCb3+NzFyKMA8dE4g==
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id z17-20020a1c4c11000000b003f726f84cd0mr5570488wmf.16.1686176564940;
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74+KkyeYoTNHdtFgdPjs/ko5gB/9QwThWFkjR0/oU0p3+M7MfNC36MRsPeTiM50kMg9GLwXA==
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id z17-20020a1c4c11000000b003f726f84cd0mr5570479wmf.16.1686176564616;
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v6-20020a7bcb46000000b003f6028a4c85sm3342086wmj.16.2023.06.07.15.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Steve Glendinning <steve.glendinning@shawell.net>
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
In-Reply-To: <20230605144812.15241-23-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:22:43 +0200
Message-ID: <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect registered instances of fb_info by reading the reference
> counter from struct fb_info.read. Avoids looking at the dev field
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---
>  drivers/video/fbdev/smscufx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
> index 17cec62cc65d..adb2b1fe8383 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
>  	u8 *edid;
>  	int i, result = 0, tries = 3;
>  
> -	if (info->dev) /* only use mutex if info has been registered */
> +	if (refcount_read(&info->count)) /* only use mutex if info has been registered */

The struct fb_info .count refcount is protected by the registration_lock
mutex in register_framebuffer(). I think this operation isn't thread safe ?

But that was also the case for info->dev check, so I guess is OK and this
change is for an old fbdev driver anyways.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

