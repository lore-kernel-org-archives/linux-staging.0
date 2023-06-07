Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1BE3B8B2
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686176613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
	b=hBp06NkP9boYZ402W2v8+ZZmZUxyn4IZ+kdLls75XEc/x6JFu/ahkrNMzWW2o26QaIyvkL
	O2UeFW77657y69Xhrd4K+tRt2xHeNlgzIQ99cUt2QP4K17bKWM2tAYrKL92HXIRaugrv6q
	U1NXKrfKtAiDXlKeTdCqqQnTET+GpWA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-JNHOSI7WPkGn6jbLn3PTNw-1; Wed, 07 Jun 2023 18:23:30 -0400
X-MC-Unique: JNHOSI7WPkGn6jbLn3PTNw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f7e8c24a92so12274215e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 15:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176609; x=1688768609;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
        b=FQyFUW9Wb+x3ElXDZrkJyNNyUPrUwaU89ep0beDxrQ8ifGNVaHQ8s66US+HNCgGZch
         jOHyGpz/Sjp7/PB+2FN2v8mkhmgC8zHpO17eq4o6ZPg/RLwmF7X6XSZuy74nXJtBYauB
         uqX64nDni0gLNClbr1Lky4PiRneiKIkFJsJ2m+GOsh4fjpVbB0MKbcsKuUzMqvh3CmvD
         xdwbf9WGfK4Gte1GZJipeeqpA+IKRPDrN8SqauYEnenoVXXSOKj0G4qbmsqzqwdGpZph
         B27QohhDn3CMUqIaPwxtY9vAM7nXSqQNs8W7PyW1uAECuN/qJ8hnLZ3KQEgnC+hb+oBD
         sMXA==
X-Gm-Message-State: AC+VfDwYbPgV5W7RbxLJNV+06Avj3sDlUS8i3G/0fb62RJPGV1u4fXuh
	Bc7gdMWZbCoawEVf/kohtFgNhr2M0A15/4UjCTufbmczCJMaLuP+8vE0ZY93jqLK2zl8GjUu4Ey
	Y2O2eNSU6cz7bO1Ra2sxE+lRfNg==
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id 12-20020a05600c230c00b003f7f4bcebf3mr1544754wmo.36.1686176609315;
        Wed, 07 Jun 2023 15:23:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46AO52oYq6hkZwI7LskizRRuqd6gfq8mv/AQFd6xOXiRAiGoamovfGXQJy96q8ipeUPGiuUw==
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id 12-20020a05600c230c00b003f7f4bcebf3mr1544739wmo.36.1686176608968;
        Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f42158288dsm3313271wmb.20.2023.06.07.15.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 23/30] fbdev/tdfxfb: Set i2c adapter parent to hardware
 device
In-Reply-To: <20230605144812.15241-24-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-24-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:23:27 +0200
Message-ID: <87bkhqewtc.fsf@minerva.mail-host-address-is-not-set>
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

> Use the 3dfx hardware device from the Linux device hierarchy as
> parent device of the i2c adapter. Aligns the driver with the rest
> of the codebase and prepares fbdev for making struct fb_info.dev
> optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

