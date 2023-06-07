Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3B6AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686129076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
	b=hy1ts/e4vaL+GxeT4gl0KEkJq7sahjb/dEt7ryFgn/ffoGA4kvnzuwuU4JgUUC/JSNX/EP
	dkCw/sb4bNsf6vLm2W2On/zCHHILQFmyecybdbNKOiqcRV4mqRP70YFpRyEsP3NhLDRQcX
	VHOAzHFmifNs9chifU16fPEWcSG0gIA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-ZVwJHaNmPwK4cvZruPdRvw-1; Wed, 07 Jun 2023 05:11:15 -0400
X-MC-Unique: ZVwJHaNmPwK4cvZruPdRvw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae4ed92eeso3108923f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129074; x=1688721074;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=i/nyEQrF2fW4CBf9B/uVYPiQKCfEGAWzqVs7pWCszMjMMAP5knWlaDcxayZVv0WSex
         Woi3ADpQkk7oEfD9kXOWX4J1cplQ6qSuCFB+wFZ+S8/y9ksqNjBzIMLH99ydqHFdx3j+
         dyjnCTQrclL49WM7gLeOwU1nj5uQuQ0cMnKHCeg3WWZawOKz9ZxijeqS/QbVuT0czJgu
         ZtJgprO4sIUXXYVTu5zrPzB+Jcn0ZtbFYCLgs3fOLt2+/sB/VTsGd1E0WGQcSa3rIXUF
         Zuaewa9sXfWcaFpvX068bfFMaFfbRljA4ehPar1LcciNAoAIt2uXIWuins3EvD/uzN8F
         8lfQ==
X-Gm-Message-State: AC+VfDyLBF8Ri9AZwV6/zXspCW3XCr9KFfVntwrAdDOdCXOxu2LrKHjS
	eXXsq6cA4t4USVi/VoZY99aK7uVSh60hPjOU03Zo5akvDXGZ+BM1Vi+rMysO1Dtlwe4SYB6Q+GN
	0WDbFY9TtldepwOGnXr7pRrco/A==
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id r8-20020adfe688000000b0030e32b488b1mr3941825wrm.9.1686129074280;
        Wed, 07 Jun 2023 02:11:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KJfeyDxYfcACaVW0UaN5JNsg10BzGoz+FuMEljUH8CXhTXkm2kLiaHaEUmQ35VeCWg/34qw==
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id r8-20020adfe688000000b0030e32b488b1mr3941796wrm.9.1686129073975;
        Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c0b4100b003f735ba7736sm1412543wmr.46.2023.06.07.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 19/30] fbdev/rivafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-20-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-20-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:11:12 +0200
Message-ID: <87ttvjeixb.fsf@minerva.mail-host-address-is-not-set>
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

