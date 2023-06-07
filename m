Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2798F54
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
	b=aXSayM6ds2nRrTCS+Qcapo0hKe5xZcRkKIHsMW37HxsvqTFTnOaP5WEfUGSBIZzdIkPjlt
	9rLkbOfIAJzHzgOkZD4+AOEyUvO2djlHS2jt1vpj/oju5fNURqeU014t5/EPdXId48NiEj
	dTn5ytekCwdAMqymS9twHpBMLw9aU3Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-Nksto6-ZNO2Nicgxx4vZGQ-1; Wed, 07 Jun 2023 05:00:21 -0400
X-MC-Unique: Nksto6-ZNO2Nicgxx4vZGQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30c3ad3238bso3065614f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128420; x=1688720420;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
        b=J9lOXAXak7eKraxs+zMEhEhStsbQsswrTa8UQnp7ViqlGZBi8T+jPSSQREE08fizsV
         l8IJJkmqV3WvCeYdGJdAbHHX4+MnVpo7FqKQX9QSWqkudyeil5orT9i7lGRI9qjJAqGw
         zqEnLPsNg3Smm6Mz4u5RdVGf6wPmhaownPkJ8vG2Xkoxs6hdU5tgp/wHL2/rnc9NGAan
         dvJQohibLRXVQpVP6AXdWjGKAAQza2et/0JwFfMf3skDbspOf5p++GBNlcc8RtFWg36w
         pecmiulBFykMB4ud9SCcABxTiyoMDXAms2kwKzxv8ad8bfqchPLTFBcBCDMXvj/LpAf8
         Yi4A==
X-Gm-Message-State: AC+VfDztFZ2/kvtu1zJCZ40QXf4PHmPKHVH2Aqg/trYokrLQfnO6hNJK
	Ccw0PU/OKhljCgsSrKcjGaA9D8G9LH/A47T2HLDpnf87ea5ZFMl6YDBNwBJaXHttFo//nPNySC2
	/ManFjdg5yBWhmn0yCkVkM60p/Q==
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id a3-20020a056000050300b002efba4fc821mr3492630wrf.36.1686128420034;
        Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6K7G3bt0VUByq7FRT2lQ5ZRsRDVTyfbQ/GNM/0/foGN7SQ7frEuHnXH19X2JYBcLKX3c3pJQ==
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id a3-20020a056000050300b002efba4fc821mr3492608wrf.36.1686128419772;
        Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e12-20020a5d594c000000b0030ae16132besm14801751wri.12.2023.06.07.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:00:18 +0200
Message-ID: <87ilbzfxzx.fsf@minerva.mail-host-address-is-not-set>
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

> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
>
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

