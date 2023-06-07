Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8C3B8B2
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686176920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
	b=LK7H0Q/x9n71RWDSBYFHRYJ1HIaVYYShaGXFklRU1DeCMHlciQe67/Be8WvsOZA/vYOxeZ
	a4tuZLHbmXqmL04vEYXF33x1pwT+LKJLmCNfM/j5FWjhZ0dIf1L0CXUlWEmuFQ38M7o9ST
	XvMiPRHlC3Bml1UYIm4yF9mZEo8AzUo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-sj7NPjW8OwSx43AD8AQYpw-1; Wed, 07 Jun 2023 18:28:37 -0400
X-MC-Unique: sj7NPjW8OwSx43AD8AQYpw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30b88392ac6so4318821f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 15:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176916; x=1688768916;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
        b=I4hKLmtL4ddYNAoperUTTLEgwTxIv9LPinV4m3RL2OI3dTKDjdnHvMMuyEKcaVwrEd
         Xw5y146H3mtq9Wp6FHRYK6+0Z92bpZhVPLwFxewo6y3XTX+Y+39ERsQho36BSkdc8BmG
         722lI1FF3xEpVf6gPgHRX+FGH7HuC1ToaRRcLGt3rBhb5KtALjlQLL/fe17ATQGGll3R
         Jt+v6ijjlDhz1pQkFQBSYChbwfqdge2LKM66PP2SoPcL05s/L0SNgfP6YbzlcCktUx4+
         a0tIv0C4sZwVbZyXNlQ6bt6gWmU/I4ZyWDwOJtOirhcGCRC3ROAK8HIgYqqXvjfZw9JG
         Q4wA==
X-Gm-Message-State: AC+VfDyC+m+fOdU858Xrx8JOdV/LT5N3za/sWwh6Ya+WiS5D54FxkzfC
	taQ9aEk/mzcP9DtOGKKpgzPzYC0vu5yegX8XiIZydPthPHyVdFoB4ox6ihbvJqYb/G7qZatTGuB
	e7Yzf9YyeLKofyEhTBcUZWcLnSw==
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id x14-20020a5d650e000000b003079da1c9d8mr4923764wru.4.1686176916352;
        Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61tYV/VqxAjAws580IyjPbyEEBH7wxqnNFkzkRRkVd9vumKgbQUzpT98wO/2M3vhdVG8VhKw==
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id x14-20020a5d650e000000b003079da1c9d8mr4923745wru.4.1686176916109;
        Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v25-20020a1cf719000000b003f736735424sm3323437wmh.43.2023.06.07.15.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:28:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
In-Reply-To: <20230605144812.15241-29-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-29-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:28:35 +0200
Message-ID: <877cseewks.fsf@minerva.mail-host-address-is-not-set>
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

> Move fbdev's file-I/O code into a separate file and contain it in
> init and cleanup helpers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +
> +#include <linux/console.h>

#include <linux/compat.h> here, the robot complained about:

   drivers/video/fbdev/core/fb_devfs.c:183:9: error: unknown type name 'compat_caddr_t'

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

