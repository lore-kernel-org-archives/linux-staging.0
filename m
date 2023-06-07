Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFD8F5B
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
	b=L49aUqtsRQVRu15UEllyJg0WrjA9XPNoaiwQ9dCd1jjfAT5YDguNS2TcZ7soHu9+Pluaui
	1VsDRY53MP3rOI441gcjs9aAI7ec/Vmn7UV92BSieFUgeSNscnufMe35u+J+Rx2b+ro6TE
	2MIXPsjvA74GX7ucv9mPzRVkj1u80vI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-F_HibbgsP7afRvoy7VwGmg-1; Wed, 07 Jun 2023 05:02:08 -0400
X-MC-Unique: F_HibbgsP7afRvoy7VwGmg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae7bd987dso3033514f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128527; x=1688720527;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=kwL9Z2BuBXTTgZ2BcYzJm3QGN5Ol3fiE0vgHswD86OS6hLRB2hNiiyEqSLD88dEP91
         s4asRxRkzafgVPNp0O4vHBPqy/i4pYjzcoP/hSAWFEhCA32iDRa+lsN/EcYXSdVTToAA
         pIf7Y1zcali6I0VPY/e7E4mEtq85zIj9LyKl45gY+fQImlFDMJ7/LD8eBdRcnhGKtMSC
         rTvgwPDqVjxCd9ibYbrQ5i5XmnZDiMl61AfOrv32i+WtYIUWl5r5v9en34hcU3xOiOrd
         l1SIlBg+FsBlmxgNuQ6NZafZmaPPNFq5oH3BWdJIh6idW1CTAVFvdjmyZ2k9GbH/F2I0
         0VvA==
X-Gm-Message-State: AC+VfDx1dMXzwF3cLC3u0YRNZn3R3kcxhz6FJtmV7JkTplrsCg4MJhaB
	HLvvm4yS5pAECWHpaD8DewIXqkT2ZcDUPrdtluWL5+hEnmDx+SUCwnjiCXzEz7O4aSon8PQzb62
	wvSJpiuxA06Jw0TzUIyCGLFQlYQ==
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id j2-20020a5d5642000000b00307bd64f5a4mr4077052wrw.52.1686128527752;
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+RtLt6z9BsPsahZF3tzNThAhq9O2T1soohVRASzXnOQHusHmP/yNJTyZBUwoEWLT/tzAX+w==
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id j2-20020a5d5642000000b00307bd64f5a4mr4077038wrw.52.1686128527482;
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d4b0a000000b0030789698eebsm14921477wrq.89.2023.06.07.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 14/30] fbdev/nvidiafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-15-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-15-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:02:06 +0200
Message-ID: <87a5xbfxwx.fsf@minerva.mail-host-address-is-not-set>
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
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
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

