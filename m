Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6986E6AAE
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
	b=EDVzhVEPczS57/yev0h8IZ/w4N32yiesqOaReuUwOW8j++iBMOu1tSrBCR6s6K1gMeJ+Nk
	CGW9bHfrTwQ0qXpZTBPcUlcp7C7aQP+DAxS/p6mkgNpzRiH47EvY3SbA/pUkglWrHpDwjV
	6YLo40BCOuNaP+4ek/kdrRtRYwnpv6w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-EcYEGOhLO62XsErguTVLPQ-1; Wed, 07 Jun 2023 03:35:38 -0400
X-MC-Unique: EcYEGOhLO62XsErguTVLPQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30c5d31b567so2490273f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123337; x=1688715337;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
        b=gjm2Nb0lYHkCbdu+Yj9oAaX5CqvaB/ZiDi9zkD5l5c4ZXQuUVGqIjB+lYhnihMOV6B
         LvpGerB72TWqzeyNfENWjOQs2nMSm40hcTObDR5kk1cDkkvcg+KgJHh9UDTGkpZIkuX8
         +gKsTQfdfQ0MFDmdVfz8rAa2NE/HFajwNpOe+/xalBO3V/4zhGCX1oGCNsYS6dILoZ/4
         E6KzCJMtRME8OJf0cl/al85pUT5+0bs7dj22yTOK1wpz7omfd8sDiYHMjKUoZj8jxXc9
         EbJPjamj+IlBbNCApRW9IypWqUW3nYvrwO2o9rq5kD5asuhCUg0GL/wXQEyx/OJ8RYTq
         tnkA==
X-Gm-Message-State: AC+VfDxzS60n3ACLEzkuuWnYyymuZQx3Z8qdLNkpZ6w3H6fcAZkTQT23
	/K3/ddNGg9RSlYGIKBr9D7ayA5viI5ZIY41Tv+cLx9x4OmJc8UCPsSbp9aR+6PODKN89oAkwy33
	ljmk2qo2d5olLdPTwOWgNWNf+5Q==
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id m12-20020adfe94c000000b0030e3ccfd4b1mr3545201wrn.4.1686123337741;
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c4uJeHgefHAPZBCPOj0COJN3FPjwSoURcR8FFlOhwLdItHYCa5GZjGrjPHZg2iimtHbMokg==
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id m12-20020adfe94c000000b0030e3ccfd4b1mr3545188wrn.4.1686123337473;
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d69cf000000b0030af31c8c63sm14618215wrw.47.2023.06.07.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 03/30] backlight/lv5207lp: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-4-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-4-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:35:36 +0200
Message-ID: <875y7zhghj.fsf@minerva.mail-host-address-is-not-set>
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

> Struct lv5207lp_platform_data refers to a platform device within
> the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

