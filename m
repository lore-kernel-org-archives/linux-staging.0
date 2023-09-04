Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C47471
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693832370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
	b=AYJDEEcc+Ui+3vgPX45vT/4XC4eP1Tb6WEVrknTTafPsCQUNyjYD6UOB6PjMIn2SIE3hIO
	NwGnNWr3O9YsJAASHU7aupR3okRGYZo0lCFenPysYxORsjYQpz/2/mh9jCALEUWNJXWRQN
	FH54GScAa+++RhlqG9XKwtnnTahZsgs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-tEUN7WPAPx2kwR7gLXgvMA-1; Mon, 04 Sep 2023 08:59:29 -0400
X-MC-Unique: tEUN7WPAPx2kwR7gLXgvMA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31aef4011cfso805702f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832368; x=1694437168;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
        b=ARotTN5jGMFTGU94lam2ooK4+hSWPqdGzZa54/3VNzZUXwzxLoOSE36FPZ3flHd2+F
         3oOPZQmQJlFH5oILLZKyqYMFEjIQ91GZxc4l24I58kosBMgz0eCWcbegTKM65NCPsMQI
         uZCaRVGzACI/KRMb1vOa4r9sUFLiqF73KHDBe4etKefiCG3xcXhVY2qgPExAXi7z1/dj
         +g6aozGUXoMTZAAbyTlgrR6HIms1lrvQ3NxvmdR019xpjpWwYZsxocsSaAVaroa1uuFP
         pzH31m/Bq6AMy1WYxNMpkZzsvaI7sTNUeGB09VJezuRMfo3flYJjlJgTiRy44i0q6U4q
         HLNg==
X-Gm-Message-State: AOJu0YyIIfa7gWrCpbZbYgEJUU2GqD8Ix6yTdv+tWxd4fmLHoUcV8G8U
	2i+zrglJ3GqetXzYoIVkUSyU7syCd19QM1kpc/ubt0v8l5qWVv6DRtfhnuKCTH5N+RjLJ7eqp4/
	A3ODf9JBIYQQNiEK72BEl19wMDA==
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id p17-20020a5d4591000000b0031dd9774e3dmr7801071wrq.19.1693832368175;
        Mon, 04 Sep 2023 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKikRn5bbMbcnbDDAwQ42B3JKHCa5zsGawpabxpCAhlcfEHQ3tfQsF2MOZFWXS2OqG+gZYTw==
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id p17-20020a5d4591000000b0031dd9774e3dmr7801053wrq.19.1693832367823;
        Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm14636476wrq.0.2023.09.04.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Steve Glendinning <steve.glendinning@shawell.net>
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-2-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 14:59:26 +0200
Message-ID: <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---

The patch looks good to me, but I've a question below.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
>  1 file changed, 22 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c

[...]

>  static const struct fb_ops ufx_ops = {
>  	.owner = THIS_MODULE,
> -	.fb_read = fb_sys_read,
> -	.fb_write = ufx_ops_write,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
>  	.fb_setcolreg = ufx_ops_setcolreg,
> -	.fb_fillrect = ufx_ops_fillrect,
> -	.fb_copyarea = ufx_ops_copyarea,
> -	.fb_imageblit = ufx_ops_imageblit,
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
>  	.fb_mmap = ufx_ops_mmap,

There are no generated functions for .fb_mmap, I wonder what's the value
of __FB_DEFAULT_DEFERRED_OPS_MMAP() ? Maybe just removing that macro and
setting .fb_mmap = fb_deferred_io_mmap instead if there's no custom mmap
handler would be easier to read ?

Alternatively, __FB_DEFAULT_DEFERRED_OPS_MMAP() could still be left but
not taking a __prefix argument since that is not used anyways ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

