Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE91C3A
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686124542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
	b=HuuBJK36EksWvyRjsptVOhvlMnoybeuJ8PR+wNYlrY6OfsvKQkn83mi+zYyhRu8xsu0SYm
	u4CDjKd/+HDRfTA8ZmTW9qKT9lvVjIlE/jzKwYwy9LqcBH7SjbuynzBzIM/CQ0jz0pdnup
	3tfbff9ojREJoeWKzoIqtkD0dFIMSwM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-Q_WvD1eeMIah9jL72ymRxw-1; Wed, 07 Jun 2023 03:55:40 -0400
X-MC-Unique: Q_WvD1eeMIah9jL72ymRxw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7ecc15771so1647335e9.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124539; x=1688716539;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
        b=Fl39W7kvY2H3ORo+9mfsl/ZOEP3zOiajmGzeK6j9eY14AMYYrgo6lxbjxpNYGeosBM
         tcFq+EvEI28Ge1zqAkE8Kn6qyXgw0gPyk4aOZfObXXSn3nZOFpqBLYcVWOSeck6ad2WG
         IOmJdXOeNU9890FmpyIteMcVty5ZYPr8YoGLxlvbvrBktxTR0hIo0AiAHwHgUvE/+G9y
         hGBbzxX5TPjcTW3KFA8uEkxU5YuWFGmYWfqlBVWMp4bQY2dw0voFssbBoDwyIxNgFE+1
         8KbDFm4p4bA6ipKfrBIYNvxgc9YP51gMuKz0/zuXN3sRkK5KvB42i9uh5LfhZJpAWX4t
         x93A==
X-Gm-Message-State: AC+VfDwivE6enyVjCDtRen8bmMMQNBWXiQcj0atXxat3s+3w3tlU3P06
	eG8tA4I+7YykqfJ1bHOCzNtg+lw+TVBRtfuAwx6eAEHDnmLjBdALMXnCBWKXi07v1F0cul3TCrv
	FNLu7j8wU7cCcegwVPvMzqjJhL4T+VJeIWQ==
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id fl9-20020a05600c0b8900b003f732844e51mr8903492wmb.4.1686124539609;
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XsE1MIBLkrKPsF0to0MXFrankIK5l3IfIsZWE8tI4gRDcEz1ZX1KmYbQPpdwp7XOKQIbPMQ==
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id fl9-20020a05600c0b8900b003f732844e51mr8903472wmb.4.1686124539336;
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j27-20020a05600c1c1b00b003f4283f5c1bsm6978981wms.2.2023.06.07.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 08/30] fbdev/broadsheetfb: Call device_remove_file()
 with hardware device
In-Reply-To: <20230605144812.15241-9-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-9-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:55:37 +0200
Message-ID: <87r0qng0zq.fsf@minerva.mail-host-address-is-not-set>
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

> Call device_remove_file() with the same device that has been used
> for device_create_file(), which is the hardware device stored in
> struct fb_info.device. Prepares fbdev for making struct fb_info.dev
> optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

