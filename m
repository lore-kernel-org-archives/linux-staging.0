Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6C6AAE
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
	b=DcMtqFOks/T2jqDkgzKDsboQ0sNeHns63qbfmZyRKBR0G9U60VnMEjc8KEIt5ngQxcJuBD
	rUIHrzHhoxT7IXS29iLgdlBCDpkuza/C4tsARYxiNKkGL/B1UtNESxVoZZ40lm0PSEKSyH
	tBBMNEB+1ophg/tNIJqZHZaNIn5GXsk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-aXT-l3noNWmSasDzvO3uvA-1; Wed, 07 Jun 2023 03:41:47 -0400
X-MC-Unique: aXT-l3noNWmSasDzvO3uvA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ad885addcso150035f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123707; x=1688715707;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=JAFMvkUzn9hEvpOkuBk9HT5f+mNObLVj7ScvEwyWDv/hA3KEhdoR/N01CjOux8+w3t
         MK2pE1iVHSJb2i4bqSzdDldR0Wo/0kCwoFDvm1E8+r1ZVbuolY8Fdg+DGFPqBiMgvw07
         Q8mhEbQ6Rcq8AJVznpNML0tcSlT3IzxcLGNHJwnK3WPG4M16PAP58I0JPaSBr++Do828
         D5I6+knK79HIkIh2xRJK8S8KDcm7A7cTOaMWOKd3ZarAyXgcBWflqoEcHmbVLykzzyCP
         a8Ba04tdVJwW6sd5fHDGT7WOcHgfa0AZk7RvidcwW66SUjeL0H+EVV128E+RhA7PDdiB
         +J5w==
X-Gm-Message-State: AC+VfDxyzw1SlvMlsVnIGQqFUpZph/f+PVpg8/C0iLCbv8B2pqz6jho0
	NPuZeR14etii4yDOcH6gLhbiPyzqWJppNn6gBbdwhjUrGipGpsN+cbH29+OrVc55ZSE1RMGldD2
	8jsBtw4xcCRLV5dKA9VM8YDbV4g==
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id s14-20020a5d4ece000000b0030627130f7fmr10418234wrv.11.1686123706977;
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zd2a468z/A2yXcthK/MVOYuYJ+/wr3Irr4l7Jvn6olRO9xiMCz+lyONSCQCChNdNZRPbF/A==
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id s14-20020a5d4ece000000b0030627130f7fmr10418221wrv.11.1686123706744;
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f17-20020a7bc8d1000000b003f7e6d7f71esm1156174wml.36.2023.06.07.00.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/30] fbdev/atyfb: Use hardware device as backlight parent
In-Reply-To: <20230605144812.15241-6-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-6-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:41:45 +0200
Message-ID: <87zg5bg1mu.fsf@minerva.mail-host-address-is-not-set>
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
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

