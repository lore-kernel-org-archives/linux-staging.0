Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD3154A8
	for <linux-staging@lists.linux.dev>; Fri,  9 Jun 2023 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686310034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aq1HmhmHxt8U2DdHW6bpTJ6Q+ZwtPsKU6Rb33d5Ew+Q=;
	b=cEch5kHsJT6WLFgGiULshv8NrNAa/8lbK1np725lTwF9tw/hy/QG/C5JCzXvSonevUMuCG
	4gssgGqu99J8K2Zt5dN1TLtfnUzUjgYd20lFatr2a6x1QsQ9iAiHbxEidrOj3doYrpwdUJ
	Gfy8gBy+WYwBcJ6K8AUthWTywOq54EI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-1C5H8GlDM6e4w8pte_uMOg-1; Fri, 09 Jun 2023 07:27:12 -0400
X-MC-Unique: 1C5H8GlDM6e4w8pte_uMOg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7f8d101b1so27764975e9.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 04:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686310031; x=1688902031;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq1HmhmHxt8U2DdHW6bpTJ6Q+ZwtPsKU6Rb33d5Ew+Q=;
        b=LywXNY+MneIKbvBWlmLVafqIRMZfM8XidLlj7CZ3SJipLyhERw9/JIPPnFcdd2AZKb
         C7fYDGYgri0JnC35ZsZ/gzozMSmuTPz+fXVXplZZ3U5irA2ah0aFCylmGkLKIy65X32m
         wztroeC2r3SOezfiEO+odwmSVINaW05f1G1z32cYk/8HiXGJRPc2rjP7XFTYL2jfzfU0
         VgAMNk7NYBHwzKy0XFUvXfNDqlzZ86UgRm3KVlzSGm8PA+Gx50s58GcIGSgyEJTCUS3u
         XABTJ70/vtpGqvYfSC1sro1uEk0LSIohYVGR4eiKTGmthtNWzIdcUDLoaAsPUdsxE7QD
         btFQ==
X-Gm-Message-State: AC+VfDzBv5F5mMEl2gzVTi0WMwpQn2JHj2rmK2RN8KWjQYJqdbnx+IXh
	q5211XfRcnjfyOCvQ+TL3IEvQoIwdCKa6GtafsKw7IsxlXY+sB2xRHBwzw89WS6Q3MayV9rejBh
	nhRpSBvgMobKNzdO+NzIRwu6/vQ==
X-Received: by 2002:a1c:4b0f:0:b0:3f5:6e5:1689 with SMTP id y15-20020a1c4b0f000000b003f506e51689mr962599wma.17.1686310031581;
        Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6w7LsURM3swKe92CefNektpkFsYqmjCbB+q5BkwoFvHxCz92JpRifnJNOzeTnxZcxMM5HBOg==
X-Received: by 2002:a1c:4b0f:0:b0:3f5:6e5:1689 with SMTP id y15-20020a1c4b0f000000b003f506e51689mr962588wma.17.1686310031334;
        Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d48c4000000b0030903d44dbcsm4191258wrs.33.2023.06.09.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 04:27:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date: Fri, 09 Jun 2023 13:27:10 +0200
Message-ID: <87o7lodgfl.fsf@minerva.mail-host-address-is-not-set>
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

[...]

>> 
>> So with FB_CORE, you can have default y if you have a real fbdev driver,
>> and default n if you have only DRM drivers.
>> 

All this discussion about FB_CORE is unrelated to your series though and
that is covered by enabling CONFIG_FB_DEVICE. I think that there's value
on a FB_CORE option to allow disabling all the fbdev drivers with a single
option but still keep DRM_FBDEV_EMULATION enabled.

But I can repost my old series on top of this patch-set once it lands.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

