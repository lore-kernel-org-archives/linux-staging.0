Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD28F54
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
	b=ZbFeb5nnq2ruDN1iG1ZlhX88ZRXG9DqHpFvs8wibumgpFQs0ZxUL8LdUTuOug2LsV0Bqvj
	x5OkNzGN11AjFg+DIFaAgjdU/4clMyY5qIM5e7MVWrxRe8704gnYyDpmJgSzpMKMbFNMqe
	nLh1hW0VKzgNHfxSlIF0EkOK/mjWbTs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-3aTCcPQIPli5fTCBlU_o1g-1; Wed, 07 Jun 2023 05:09:57 -0400
X-MC-Unique: 3aTCcPQIPli5fTCBlU_o1g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f73283f6c7so1811065e9.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128996; x=1688720996;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
        b=Su+izFmOBY8/uKCYopUjD1dtl/3F66d7WLtX1TRcQWEUWjZs09MMmhMGzm47JryxHJ
         a8SVmkTxAUyG3x5oA+/72B2n6xvI/57uz1lHd1y9uhNudrdNz9JsB6tK+dPyTnS7iYJG
         TDCpN6yejw9KRgtXXGEZ5MCyyjzIu/d3u9oTIUtNbpk3AZfkvVTuIpsgtxzHOVbqRGFB
         +Vyi4D8pll+HcLYhNT1tPIb29wKIPDALNzZ+PBbcjrtknrSZa8wP4einwImb8JigTP5E
         A0pCTWBoUYKgHsorjQX1Mpt7J/D0uyBaefbjAspzXHVEkTK4KWnCDvJwp5SXfsZZ60A5
         kzdw==
X-Gm-Message-State: AC+VfDwBH89XxNuRwmEss3nXDfEtZ6j5ktRcYf0phuCouvHak7WHJx36
	fKBovJpwXwtWkLYy9GEOD3NkJwJJ9icx6Vi2q7LXpiReMGtR23GAjlYpcRbKWhA6JLJYRi/Yuoo
	AJJyQ1lICiuL1cGu4WWNyAuTo1A==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr7850358wml.15.1686128996490;
        Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S4Ug1fiHJ0oCExHc5SSiTGb/dJv10TIcn7zVRyFtmlI7TI/i0oDDpnO/bY0dqK+vi3g6l4w==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr7850336wml.15.1686128996200;
        Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v25-20020a1cf719000000b003f736735424sm1425404wmh.43.2023.06.07.02.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:09:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 17/30] fbdev/radeonfb: Reorder backlight and framebuffer
 cleanup
In-Reply-To: <20230605144812.15241-18-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-18-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:09:55 +0200
Message-ID: <87zg5beizg.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the cleanup calls for both data
> structures. The init calls are already in the correct order.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

