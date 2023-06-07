Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F796AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686129028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
	b=TDOjJF8EMpgAyKJw78U1oYQgDsl94iF40zYtf7xoL/Hz6qhNAZGASyXqe1zHf3e/FKLQ5E
	JVhULfRwGqbd2e4rLQ0zI6w6lpJW9ixDDbwquXLudbMZ2OFrLAgzvLaaLnaNTNBWYgtXEt
	q92OvcmOkUT+relgOkjqPAimVYstt7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-1iT3NA5bPO-_QRJN2jozYQ-1; Wed, 07 Jun 2023 05:10:25 -0400
X-MC-Unique: 1iT3NA5bPO-_QRJN2jozYQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7e6582938so46154535e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129025; x=1688721025;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
        b=fSCb7NbrsIgjXjz4oBe9wBcKdYl1/zp+DY2OC3YNWv/Y1mjyG0kc1Pj9vDt4doMMnz
         hUliYGnVVMfJjOCpvD4Eti009LK8yVaE4RDec+L7hBY6ZtQws2+wiifoWriX/Jw2pMqg
         D2Dzm3YmGAz+D6NCT2062AGm5m/bmby8UPV4E+Jp3dvr1gqgXWTvICp+U7Q/IqVa3UYw
         +6TSmukuN4wVXZqdduIQBmybCdCZZL6LZtTI2X9pXuA3nsbIWeLrMyoij+uAsMAenJOo
         RVtKkmE04ToZDgqT7PfuRRuHhE/YiWFO5Sp8mVs/a6yR3sdhUDbXTSg3HZIGtYgKSpGM
         6C3w==
X-Gm-Message-State: AC+VfDwEJm9nw3g0/IUX0Zrt+bAjferfDbkm/35zCHvew53UO6ELx6q+
	FJ+DtIM0fioVZ6ORXGTuGIh9uBIIc92K0BoIbbi8Oc341D6bMD2ieNnzagngPmcnir+HQcqxca3
	5xVlBHkQeYX6zxt5CKXnwcM4isQ==
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id hn21-20020a05600ca39500b003f7340117acmr4587435wmb.5.1686129024879;
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ePD432YmabNuUR+sxJiR/Lq4y75rOFMJQocJYAFtsL3UId8CM+YY12IKNvHU0PgR+SDGlYA==
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id hn21-20020a05600ca39500b003f7340117acmr4587416wmb.5.1686129024708;
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003f7f249e7dfsm983105wml.4.2023.06.07.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:10:23 +0200
Message-ID: <87wn0feiyo.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

