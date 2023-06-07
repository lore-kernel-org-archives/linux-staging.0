Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E96AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
	b=ZzRYpWElq1MuitqBZ5e4fAztnidcMeQiHEuNYm04R0gcyLYMdg9NSVMBsLD5Kal9GseVK7
	Vt8aJ+0lbJKKxTNIXShXF7uL2zZsYyP9hsd9/1mN4bDYxqq/6K/AQ/ifBx9txjwaBpvF87
	9GZv/V1mKna5IefnqUb15FF2o75694Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-zr9hH1j0OMaJKXJG7Dh2eA-1; Wed, 07 Jun 2023 05:09:24 -0400
X-MC-Unique: zr9hH1j0OMaJKXJG7Dh2eA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5ec8aac77so43018475e9.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128963; x=1688720963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
        b=OvBHOYu+EuZG9cO6ywzCOEOeuvLIL48UXu19LNo/HhhldY1tr5itXc8T6Iq+wKqhsP
         WJ54w9djbB7/q+9ElFQpIAK9+IsmGk5X60RkDiRCV3Q3LzUzWPb8whoeqfXQLQ4V5RZ5
         HMa9WNibXsUG6w2BfXpvWlpKKdrhYLuqTBLP9G/QvKrbZ03W7m+8ea61B1gk6/41+AyZ
         7s+c5+rPoULBPb4wOb6I2Gjf9/WxAEzTqr7cwYKlBb0RzdJ0cToWcAZNpqJWhJ6fmldk
         bTFUAhHageasUC6G1d2xwgXALRGsITQnGbLg2/1mD9ljz2FqzHu1niRLlpfv/QVllfp8
         +7/w==
X-Gm-Message-State: AC+VfDwsF6Oldaa4KB6zR5ostzq+/l9Bx/tpOHr/7UTOYQzFS2RdR6lq
	YzsYQkwa8o5sgqRv6QEANP1oYmW5SEoN4916jIocQj9Jf5JIsr5JDfesVYeSIhzbxD8VNfLPp0s
	AyCfwA6vBxbTVEAPYbRPh4QlS6w==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id k5-20020a05600c0b4500b003f4d18fb2fbmr4423501wmr.8.1686128962967;
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KIDwr6/boDKEelyImr80QUEOg3IdkbWZ6AUo87k2W9nGNMdMne7IQ3JZzUQzQ4CBO1bqmKA==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id k5-20020a05600c0b4500b003f4d18fb2fbmr4423483wmr.8.1686128962700;
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k26-20020a7bc41a000000b003f60e143d38sm1426996wmi.11.2023.06.07.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 16/30] fbdev/pxa168fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-17-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-17-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:09:21 +0200
Message-ID: <873533fxku.fsf@minerva.mail-host-address-is-not-set>
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

> Do not assign the hardware device to struct fb_info.dev. The
> field references the fbdev software device, which is unrelated.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

