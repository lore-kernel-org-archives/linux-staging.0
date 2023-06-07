Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AABB6AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
	b=VSEnU5gvIaJsiOBfsy2vUg5bvd4f2ul3+gFs81IdOAPJKyny02GvBDS0o2H1FaV7op1u2I
	BiHsvgJD3zsyy0lGng4iX2iWD11gVp9hBEukkTKiNT1PldWHJzX6b+W/YrJJaZI/hMdmEp
	GGGyn8Mz6Ix2m1oh3P7rHDeSxppToi0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-_XXkHhpYNmy66SywQ_owGA-1; Wed, 07 Jun 2023 05:01:44 -0400
X-MC-Unique: _XXkHhpYNmy66SywQ_owGA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f725f64b46so97971105e9.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128503; x=1688720503;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dioh0Uh8M64nhVsxEDgz6W+eW/pWMCOha9EWfOMUYLQ=;
        b=kxfZTqnkIIxzkFHWWI/JWCTCL/EoeaqDjkHyDAvxvLWiKPGz5Kwe156DvytA0KyAvC
         ok0roVqVa6aXgDgKOpJkpCKoFDrWhU1fDgDuJ1pfQwL3vTk2KPMtN7LlSe3ObXdeRa+v
         HihLxBe6corD/s9wO/2A3z5QBsG+1v4TAItVcOLHhfnZtURIK45WHskYNNQ9t6YGlsmd
         MXWQhrcMUMAjlEMb8dm3SphNmogxIk4C1P+f4PyLTqtvrzIOiTyJedoNEiQZJYuK1Dam
         o0RSoZzUNfO9m1Vh8Fwo7DVz+KC1baGoAkwZJUp+UGNE7nqYaix1IsV/BhuvLMlXXxWZ
         vWBw==
X-Gm-Message-State: AC+VfDyP3SCAOnhmNktwZ8erPyDP2Mg5Q37+lcx9aLGTKsYyn6rhKSvM
	46hTpMRDXllP8PtTV9XQNSuA+iofRTZeJL9OJntx0pMUHVpROG3kxvigcqVrJKe3Ha/ywwCJUD4
	NeVEmhmXnc/JZ7/H1zZQGEEpzRA==
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id 4-20020a05600c22c400b003f7f398e1ccmr353854wmg.36.1686128503052;
        Wed, 07 Jun 2023 02:01:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72JJUmKTY0S/fTapCQpRDv/nnMwi2EWc1cCGgNDHz8vB5pxi81zoyZxiDc07QRDM6iPj/yxA==
X-Received: by 2002:a05:600c:22c4:b0:3f7:f398:e1cc with SMTP id 4-20020a05600c22c400b003f7f398e1ccmr353823wmg.36.1686128502608;
        Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b003093a412310sm14814796wrx.92.2023.06.07.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:01:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/30] fbdev/metronomefb: Use hardware device for dev_err()
In-Reply-To: <20230605144812.15241-14-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-14-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:01:41 +0200
Message-ID: <87cz27fxxm.fsf@minerva.mail-host-address-is-not-set>
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

> Replace the use of the fbdev software device, stored in struct
> fb_info.dev, with the hardware device from struct fb_info.device
> in load_waveform(). The device is only used for printing errors
> with dev_err().
>
> This change aligns load_waveform() with the rest of the driver and
> prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

