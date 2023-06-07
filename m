Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D2D882D
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
	b=D8jLe4RTtmfGhAcEJxXjAFPx7HjW1vCUC0xw3TIAStKvl36v4DdnO6lLtAn3uwfqjeFSs7
	pUX2ZppUU/gdj50lNON9jlqEMFAkU2xNOgL849yENUDtB8mXiXC40FGwmslqB/55o2ITUu
	vn+nAPQ4jP2U7ZVVwdwvP8CxrBSw+4c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-VcIM4CS6MYuCjYj6vKZvog-1; Wed, 07 Jun 2023 05:02:30 -0400
X-MC-Unique: VcIM4CS6MYuCjYj6vKZvog-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30ade645c59so3219241f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128549; x=1688720549;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=Hkd0duqw1VwvaNKNOaFdZnI9ZoX7Cnhuz7LVxMx6DZRj520Nu39pT4yWCe9OF9TDxw
         vXRsAgpz9syTKRocz+Kx4dNBWJrP0TGvOSyrro7sOdk5GVsx1v9zQiF0NoLZKc9i9CPG
         GrPwE+2RKfLsElksftQHpPjdH+tn6S2E5dhZAzo3NibkYwHHjXgse0xJwuwjJSU25NCb
         OrxFymd9hJkPrwCo1ihiAxfcWF3whCBW/J62EZEKGVAQ2Ten6U2RjiS/uug6CP+uadti
         bZ9kCkR3ToHH3Z30V/lwDy5yYtmWQCm/yE0PbMt0tNqyegZC+DT1XgTrTkwxTGjAR3fP
         rfvQ==
X-Gm-Message-State: AC+VfDzf+x9S37V7J+NAgra1wRfrZAULzpeGLfJyGIt+pOMSA8es3hup
	cDRzjY0QA25Tg6LRF2d2jyWdIEkiOdkl5xjQaDfiBFCOr+nYngWVM2JLTId5nURzUS8DsBT+ZW6
	fx5/9BRnIKE70CUMgXEVDLWw+2A==
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id l17-20020a5d5611000000b0030af0308637mr3810370wrv.22.1686128549044;
        Wed, 07 Jun 2023 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tdzlumiDh+lcZSgp5sjiYX3gXCJJUKDHiUf2E4K2nudny411fzwbP2HTNQbZ/H/p4MQRLhw==
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id l17-20020a5d5611000000b0030af0308637mr3810350wrv.22.1686128548788;
        Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y4-20020a056000108400b0030e5da3e295sm449804wrw.65.2023.06.07.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 15/30] fbdev/nvidiafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-16-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-16-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:02:27 +0200
Message-ID: <877csffxwc.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

