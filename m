Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF591DDF8
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686585864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuCdplsPmJlzp+kH6QUrWWOm1LK9xg7d6ONJhnkdacI=;
	b=OT/QDNifTOKBstUlK90yj9BIbyLe+QDQsXJt34soaSC6rOixPIJaIspNiG0+b+h09XC5w5
	MZLhy83A5k7NY+3IXqRhpxuUEpIwy43G2xx30e75vBP+Tm5AGo57lYDQi9MU9jaxwg4jQv
	95BMcr0g5Awo6l2A7M2IZCySTMqUkOg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-YA4FMn4UNPKZHhh2SQDNJw-1; Mon, 12 Jun 2023 12:04:20 -0400
X-MC-Unique: YA4FMn4UNPKZHhh2SQDNJw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30fbaeec4c1so1002667f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 09:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686585859; x=1689177859;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuCdplsPmJlzp+kH6QUrWWOm1LK9xg7d6ONJhnkdacI=;
        b=iRne2jYyf9Gvb+8E8dHu/4JjFFcglp4PpoQTOtdHfO4MpqgwrWLwE4QVToOIfADk1p
         q+DVTPfMoQDxCxE3ClLUnX8MDp4ZV3VpNjenKKS3I3dGJfyqUYFplrSd6JgYCr4iUgpJ
         basGU1ZotOR9mcBVdOs/JJcdc1AZ6U5H8/CvF+5top1PX27RHLMCL2fKNIvdW5i4UgXA
         1/TpusPxkrfbhfFLR8P2DlwIj6DucXGXFzTTrjiASivjSeGfO8/8JpernHOW/xufNNz1
         Gt0KAtYG3VHDEOzSU9wAAE7ZIHViT/baMdcoeyzAyJldtY2Ld9u3fsOA6tRae/nzB9gy
         RR1Q==
X-Gm-Message-State: AC+VfDz/t3aFVFVWbpBwlAwVQ057FM68p4FUONtGtyGuuwqEjm+s8pYs
	FFfJI2gCDPVcZRiq/Eu0MScLkB5SSBNUPh9XavCL8AEgs3iIJfU5iz2IgbWPllpEgKhzJG+FGUo
	RfWiFY2I7YNPx2zpxmwFmPiDXFg==
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id h4-20020adfe984000000b0030abf2be020mr5819476wrm.45.1686585859688;
        Mon, 12 Jun 2023 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4owFNKmEWmuPb++u0T0aPDLLPsp/xgXSi0mOTbIfVKTyTKs1oJaK7lKDIf+8APpdspTz1ouQ==
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id h4-20020adfe984000000b0030abf2be020mr5819445wrm.45.1686585859272;
        Mon, 12 Jun 2023 09:04:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b0030aded83385sm12896655wrv.27.2023.06.12.09.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:04:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
In-Reply-To: <20230612155601.GC1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612155601.GC1243864@ravnborg.org>
Date: Mon, 12 Jun 2023 18:04:17 +0200
Message-ID: <87jzw83bwe.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Sam Ravnborg <sam@ravnborg.org> writes:

Hello Sam,

> Hi Thomas,
>
> Nice series, quite some preparations.
>
> On Mon, Jun 12, 2023 at 04:07:38PM +0200, Thomas Zimmermann wrote:

[...]

>>   fbdev/smscufx: Detect registered fb_info from refcount
> I did not try to understand the code, so others must review.
>

No worries, I already reviewed that one.

>>   fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>>   fbdev/sh7760fb: Alloc DMA memory from hardware device
> This smells like bug-fixes, and I do not see what impact the change has.
> So again, someone else needs to provide review here.
>

And same for these.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

