Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA34442D
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693833490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
	b=JSaCtwUapIaYsR7l6FcK6XEyuFHlAlzDnqiO4Eek9d4+nHsEvbWuDhAWkA/iuV3ED49Zpv
	+4Zyi1mp9cFMyBoDFHPfGUByd0ZA9lNlRafBtPhCgxUYviZv5A/7FXQyKJh/DmbXX1uOim
	ecO3+3TaxDJiwLl+2kpBg0nQbbzMgT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-YNU3EkzROK6VTDRQMKURFQ-1; Mon, 04 Sep 2023 09:18:09 -0400
X-MC-Unique: YNU3EkzROK6VTDRQMKURFQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4011fa32e99so9447605e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833488; x=1694438288;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
        b=YRqX86NSXqIbiLtNzW8nLFr+tszOoCW24Jym8v0tBnPkwO7OJ+iQ9IMnjnWsBuyhyg
         7W9kFFWbEem8vH1sFDLHh7eEb3DspmIhlV14v0g02AAJ7N14lSdbhmFWOE2JmS6gISVd
         rYgVizI+rvBdKD0cYiN3NiCY4QlkczGaq3MwpdJpXcZXsDRkDEbJYvi+IB0dkkHxgA36
         BLwbVuuMqnNsOJXPy1K0xSRTmGP1bq7F0OZWFIQTFVk+vV4jZmN/8EHcfKQgWpdm5kiX
         sBjtFnS37IhQPEOKnOb0r5l3zSwIFmtIbyt1H53ZgDM2lY3MYFoU6sfVIUvKALMpiFK3
         ODNQ==
X-Gm-Message-State: AOJu0YyUNHyBmq1Ihv4tIrTkUns5wbGTo5GCUibTW6iDQVizSS31H4aD
	PKKp6K9Jir5RwuT2jQ8JWgo7qpuUsrpNP/I47DDJBtj2CQK8xEH2OE9FJsYLTRLnxHwgzLntqt8
	u/v1zzgT0oNvITRhlfE4YS380Zg==
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id m2-20020a056000008200b0031dcd2f4a4bmr6453150wrx.50.1693833488025;
        Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMneOVTl+tO7EjPHxWk7aAIbA+6YIUPO8GkkaydyT763T9pc7YLR5Hmg/1C6iUl0u80TgQ3Q==
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id m2-20020a056000008200b0031dcd2f4a4bmr6453136wrx.50.1693833487752;
        Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d6643000000b00318147fd2d3sm14498682wrw.41.2023.09.04.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, "K.
 Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>
Subject: Re: [PATCH 4/8] fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-5-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-5-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:18:06 +0200
Message-ID: <87fs3ucc1d.fsf@minerva.mail-host-address-is-not-set>
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
> FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> The hyperv_fb driver is incomplete in its handling of deferred I/O
> and damage framebuffers. Write operations do no trigger damage handling.
> Fixing this is beyond the scope of this patch.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

