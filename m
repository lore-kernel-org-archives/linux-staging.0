Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCF6AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686129122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
	b=Rw3pCjTpt9XnUIyWO17xfgpW+nbLu/9Jc9vjwcKo+hetVemSQO6ga+9bMDuAk8eM9krOcP
	TNhWJVdY07re7tVP3KxRT7SULEng/Ku2wzqlUuci5pQIZtf0bqSWCMI+eIayYThZBSK+Sp
	YYvw/3Jr29Ql24FjwcwYIbWu6y4nPsA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-r-z6qBHTOR2li9Hytps_Xw-1; Wed, 07 Jun 2023 05:12:01 -0400
X-MC-Unique: r-z6qBHTOR2li9Hytps_Xw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30932d15a30so3877691f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129120; x=1688721120;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=b/dn5KmBz1uLo5E3BI/vHk9oWaxuGNDrQcW5pLusw9dTi/Dyt3MjwW3rgOsP2/EJaq
         Tp/ujipONGMlId4HM/6SbNld/1dO90zi5aIbxePEDqjWavSsXC6agqjWCA4J+lCAIdka
         9kwGvxLhDpllbSo1/X88IdT4lVFfsnRgR3y5SNlS6+lSu4ICeLPm9cnXhANbgw5vlEdX
         yhSRqDy3+bxI53WXftMd6NBBzwEVd+8qClFwRRMpoCmfKhm58WTMcnl5SWWDcLbe9YbF
         zF2E0JYaHwB6PItfOhPEQydHmZyicApoC4ybzNVgZUn27Uv4wR4hx8CXV1mccPBIxwL0
         ++xg==
X-Gm-Message-State: AC+VfDxLtoPWjvcHFGxicsberJFK3FZLv36AfPmJbR4nxcRADOvKHoeD
	gxuC9V1T/Xr+nWzvNiaxURsRfBesdfHo2c6InKRNLWP8ANkfjnlUaEVZ9N6qrpqX9JrP1A2Ekqf
	wV4/8QEBHaAtB9lhxFhRbXoMuFg==
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id i7-20020adfefc7000000b0030aeada8b9bmr4008357wrp.41.1686129120263;
        Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pKDNydRWrc71fW3bUFKqJDv/PfRpGWQYSkEIZ2IoZqLYQ3oH2ibQ9gh3nWmNRpad6J8Zxng==
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id i7-20020adfefc7000000b0030aeada8b9bmr4008341wrp.41.1686129120078;
        Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d6083000000b0030abe7c36b1sm14722806wrt.93.2023.06.07.02.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:11:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 20/30] fbdev/rivafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-21-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-21-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:11:59 +0200
Message-ID: <87r0qneiw0.fsf@minerva.mail-host-address-is-not-set>
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

