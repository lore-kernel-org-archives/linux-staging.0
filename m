Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD744BA42
	for <linux-staging@lists.linux.dev>; Mon,  4 Sep 2023 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693834137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
	b=eVMR9mHWlE+I25vv9vjngZNjD2SmjS/XMAZrK8cTk7kD0sdVAcRBcFfxzL9T0UsOYvkrOB
	EqHSot500snx9SFPg50x42o8lsq7tDv+ig1u48ATVv56U+Tp/4vt5YAJvJJXI098KEylsM
	hVSQnMU3WuR9fJbI1equGbue5uVtSUo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-7pCyZe9YM8y5rVSaA1sqlQ-1; Mon, 04 Sep 2023 09:28:55 -0400
X-MC-Unique: 7pCyZe9YM8y5rVSaA1sqlQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3172a94b274so824820f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 06:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834134; x=1694438934;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
        b=YNjjoZZRFzWG19RDvPYYMV6dBhRkoDVIV93M3drxesWN0jOJPHTwixFwcfAkdquwiI
         FaQyOdxb5+AKO6neZ1uL30sPZx/S822y7YuvXJA++dz+kZuqzq2O31DTJmvPpDkhgBnp
         bsyQHqyDUKq5XCkZnR13cm2L9Y+08Cwwwdz8R/A5wgqWsxRd9LMeNBWIy7L7Cl3jP6S4
         EAmMLb/uocDFTX/C8fUM8zPhTRk+EyZIj2m8TCqOHH0jRT6a2u+ah2Dbj/rQ66dWLBPQ
         VRi25SWcQKXN6FVdlgZN8DVwzvaIkD5Qdx2m2EGJo/JqS6vZF8LTuxHCSRLWv+mdDeWT
         ZEsw==
X-Gm-Message-State: AOJu0YygMBgk/C7VjAhfbTOchaxHpDYNd7/TuJushfNxS5oc3mxUVQ0N
	eq/Mm3y/H5F+A4eKblsNzRzuqNxVVRo4Q/IPKtAM6i31e0bicCIW2jv5GAIB1MQx5TNzZt4nuw1
	z926nFNKBjic7mrPkWY1a9jgdcqPFxvjdXQ==
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id v3-20020a5d43c3000000b003173d36b2cdmr6107641wrr.71.1693834134387;
        Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3pL/7M37MZ8DDYOtxB0J933cOF0hsfKFCSqFaXm8ULHyrObL/1Lf5LyHUOXJD35lTdHtBaw==
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id v3-20020a5d43c3000000b003173d36b2cdmr6107629wrr.71.1693834134083;
        Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c1d8300b00401e32b25adsm14407260wms.4.2023.09.04.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:28:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/8] staging/fbtft: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-9-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-9-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:28:53 +0200
Message-ID: <874jkacbje.fsf@minerva.mail-host-address-is-not-set>
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

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

