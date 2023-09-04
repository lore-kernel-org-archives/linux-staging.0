Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE3BA42
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693832712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
	b=T5zWLRHrBVs1USqX/tvB5tN2WMDSXsH1eXhwvC8fsQ+zR+BLJAY+ZK+8eQX7saTwKWQtjA
	4LM34LkAfFrcqjbiVQVcW8ckeNShrt27IxgXRAwe5mjqnMOdl1HwmMOcNcWf86wHbxP+xC
	eyEtsPaVLx0lEyVLKbzyky9KEXT88W0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-FZ9Qf19oPp2eiZ44AI4laQ-1; Mon, 04 Sep 2023 09:05:11 -0400
X-MC-Unique: FZ9Qf19oPp2eiZ44AI4laQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3172a94b274so813544f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832710; x=1694437510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
        b=dIHXjMlHMaihAWqs68KMD9OQizwNSMTVicbGXCsXDCBRSLtEzAwSWyezzZJCbpmPi3
         CUqiSEdqlA0g/N4Dj1zIyKQuhtID3WXNi9swXv+5TlD1NPmlOkzz1LorE7FUyVCSxnW/
         7ksXS6bQd4lX0FvxLVZGDJoPCmsTyopTtcn4PZs0/CI/nAkFcFQydeV8nuQ+5BbAYBea
         P+5/Kra+WtW+FDW1w1QTO8KAL/nfZZn2y2K7hwEPiIQGgOZW50oD4ueMMwX9y4DK/cwa
         XjSAoawFQ45UVM83ZTf02OyPz0MaKzHcqYLoPqXUQt0/6FpMZrEMOkpdgT6kGkvR0fsu
         zqLQ==
X-Gm-Message-State: AOJu0Yyz9/2j4FCO59n6UaXeYp3mXUq9syZHZtkb+T2ChL/W94pUpjLW
	plq7xTp00RMErwRmL2FEnuiNl6SY7/m+2PBZf5bQEjn/clN32x/K6GlAaxKWpU7hA3RdzKygxsP
	m/zyZ+B5S5ebbH/fCgR0EKbYeJA==
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id t13-20020a05600001cd00b003175de386fbmr7162735wrx.10.1693832709956;
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXjVWzCt7e02jUxRGN8dZzdROG6Y6I7k2Dqt3rSE/+w+cQmE9Wq23/UuCwnni8eIyMrEIxCA==
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id t13-20020a05600001cd00b003175de386fbmr7162714wrx.10.1693832709657;
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b0031c7682607asm14485436wrs.111.2023.09.04.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bernie Thompson <bernie@plugable.com>
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-3-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:05:08 +0200
Message-ID: <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
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

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Bernie Thompson <bernie@plugable.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +	int start = max((int)(off / info->fix.line_length), 0);
> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
> +
> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
> +}
> +
> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +
> +	dlfb_offload_damage(dlfb, x, y, width, height);
> +}
> +

These two are very similar to the helpers you added for the smscufx driver
in patch #1. I guess there's room for further consolidation as follow-up ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

