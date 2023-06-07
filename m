Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8AE8F52
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686129143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
	b=LH3U67BU/cYzqI0d/F7J7cKYqlZtajySrmAF6xRNL1LXJlZDdZJMBQgc4NKUWwSNvsaFDp
	+UvbHjwI5jA7GbkaFD7V+9PbodUu6n1jjQvcdY4nRKlfJcFbUxt+YN79MKuMDc2ckDlPU/
	o9kOcz/KHUd4819Y0kiC5D+8ayL/WSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-youHPGEIO2i_4SHyqviZmA-1; Wed, 07 Jun 2023 05:12:20 -0400
X-MC-Unique: youHPGEIO2i_4SHyqviZmA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30ae9cf0178so3222769f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129139; x=1688721139;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
        b=a00/EhRdlSwYPz5G99EmflJhg2Ds/nbfCKTLRqapjv2IUuqrriDewwLQEN7iW6dmPR
         u1vfbrs6iBK+b7hMOqeHMq1k1TRtcpsZ/6bjiNGYrkAgfLGD1uVGjs7wgzbV5V1d+apf
         gpXmTSALZcA8ExDPNoBuIVzU/LKQD6dOGV5H/nXjDT9z10GZxIKkTDd8M+/tjlyGQzwp
         0od90R3Cx9A0F0yfDxHgFGl95DdpqAyvpGJ3ePj3xP8H4u6927xzYu/yNMEeD6cuG2qs
         wv8baYfLvizvW8u/dHYoLtV6vtkYMABSsgsGEOgwPb7UjlTy7o4Zq75bbVr9LhjbcJFJ
         vDpQ==
X-Gm-Message-State: AC+VfDzHZKYRDD9G6dFVLEIt5fTXZcUKQkwRQsbcn7JR2kHpwZZ+bmPv
	8XRqk7sRf1XEHEjPf3Y6FuxDtIRilKj5ljQJqzJBBqxtLOV6Ay2C3k8N5rQ/RaSHSpH6itOhoQA
	yWM82zXj4c31qFPCyqfZzwSV2SA==
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id i6-20020a5d55c6000000b0030e38d3cc4fmr3742543wrw.36.1686129139399;
        Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wzUZfsA9VSizf9bxaqukgTVAwDp5W+57tfKmlffItPyQVvcHhSQ5E8wYACr5/gCv7xQF2rA==
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id i6-20020a5d55c6000000b0030e38d3cc4fmr3742525wrw.36.1686129139085;
        Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003f60101074dsm1447712wmc.33.2023.06.07.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:12:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 21/30] fbdev/sm501fb: Output message with fb_err()
In-Reply-To: <20230605144812.15241-22-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-22-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:12:18 +0200
Message-ID: <87o7lreivh.fsf@minerva.mail-host-address-is-not-set>
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

> Fix case were dev_err() is being called with struct fb_info.dev.
> Use fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

