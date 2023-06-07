Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BC63D7
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
	b=cC85HVmSd57663wHKBzWS660CqmmQp21p51no3stSxMP1joBJwL+j1rDuj3KBPHgE9C8YC
	AHhZIfxb1dr/P5PNEZ2xva+git0HZGVNSbC/q/PicG03FiL7ER2x4Qh3B7EgHN9NR0oyju
	TWaBRAGWIafnocXcHzQ+MwWwxUqQOtg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-3309Zu9AOHeUZg9r9XcDCg-1; Wed, 07 Jun 2023 03:31:01 -0400
X-MC-Unique: 3309Zu9AOHeUZg9r9XcDCg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7f264c485so906315e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123060; x=1688715060;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
        b=TcfaBIVEJS6fWcCVqr0Im+aC3Nd79m0RTVjA0OtsNjmjoTF1Y18+Hf6qk+iT21fgus
         sqeKVqCb1mBkFsHheNaW9cTztGGXKHVNpCKbqg60jCqAa3o7t1HNqV05TRPfenL8dAyr
         39ExkbKlqlSIV5Eb6WwSxPQJI3UvpaVXuN58ky7VSsq12qxCXZ1ZFJaSwvcCA+RUH2Ux
         qMcCmQaEVK/3deVKyHb3125T41ZEGAqKyKIa8Eae9LLUIZumSMnF/wuHXgmRHTdl7zgp
         KEE0BY46b07SzRpI0d9aLdsicOb/C0qvnINY8KAHFZAc5JfbYijfIukpREEPQd32CK8Y
         FDMQ==
X-Gm-Message-State: AC+VfDw5St1+3tSBs0bwJaUd7UEH+9+q/ECaBmA5iP2Q9E/ejHpeO07v
	/AIC/J5T+jV9ahu5L9trcD/wDi8j8EFe0yEgC45XpuJk/UKWwiWhEwOfmWxFjO87y178jToCBTB
	a74JHdHnKTobz6QjFUiuUeHJeGw==
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id u23-20020a05600c211700b003f42328b5c2mr3787350wml.35.1686123060797;
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uGo6zRkvpQ5estM3pdndUe5o7FAstx3xMsdIS0ZhyvoEoxkSKZkfhbKkJxPjpvFo09QUYlQ==
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id u23-20020a05600c211700b003f42328b5c2mr3787327wml.35.1686123060473;
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003f4ddde398csm1142560wmj.21.2023.06.07.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/30] backlight/bd6107: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-2-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-2-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:30:59 +0200
Message-ID: <87bkhrhgp8.fsf@minerva.mail-host-address-is-not-set>
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

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

