Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A163D7
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
	b=LVSDFBfhdSkwtzPFG4sZRf/u9CdMuQsD1qYl45GW13luVcLOgJaPqGtOios0WeGXypjdHX
	xhzjS4QZSoTP3yY9V2S9iTDBAFb1FutBahNOlbpdk6bBtv+eBq267Al7chBOHpzBCvztS6
	ddizKXKW71efKcWF5I/mCGOkM1/lNbE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-0-el_XKmMdKQbmeCbfjxgg-1; Wed, 07 Jun 2023 03:34:16 -0400
X-MC-Unique: 0-el_XKmMdKQbmeCbfjxgg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30af6a5b6b0so3065851f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123255; x=1688715255;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
        b=Zw0CD3DhvkC1QwX8CRB2ZDY9rYLeV4GdfEubQa6O765HrKztZ4WNtKCQZ20Jg0gQTo
         O3v7qeLB/5EohVHQmnN47xC/IBwcT9sCp6jrZpvLfuUD/J117U33p5e0gPHJytsxKI2k
         UxH4A5EbU9K+r1fQQeMD/+b3wRl2Hk37ctCYQzBk/+wh1Cwdz5HTL/2uTKEpraMcvnlK
         /zsevIyZxmcF0NcEbiTerGENx1g2JWd6Gl0t6u/szsADUf7Jbru9q0xuiYw22Xpb/CBo
         Pv0n2Uj95g8vOB7OVeq9OVxiz3KbLdqTjm6vpId6oTIj6x3d1dUEXmAfRmXRnUBu7OX1
         L/Mw==
X-Gm-Message-State: AC+VfDxK5D9D1ziFP5M3p7BDvw9qrHYiv+R5gm8rLUEfRLsehG3BV/MZ
	LFN2cCAmZ7rWqwibsNbede27ybiHnFnIFrjxhIgfcpVYCZnO9l19buur4pDouA5OgGtK3ZyVmDD
	QenJ/vBFR5U+DzwB4FAXY6AMVLQ==
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id w18-20020adfde92000000b002efbada2f25mr3634432wrl.67.1686123255196;
        Wed, 07 Jun 2023 00:34:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5kwgjMr0fDuyCE+y4fhZTqJkSHNU6+Lw9lBuHow6MJ+hyLq4N+EQ2nCyTNeqeilySEFyk4bw==
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id w18-20020adfde92000000b002efbada2f25mr3634421wrl.67.1686123254876;
        Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c028300b003f7eeec829asm1180357wmk.10.2023.06.07.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
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
Date: Wed, 07 Jun 2023 09:34:14 +0200
Message-ID: <878rcvhgjt.fsf@minerva.mail-host-address-is-not-set>
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

I agree with what was discussed in this thread, the check fix and rename
could be split in separate patches to make it easier to understand what
is changed. Regardless, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

