Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C699114AA3
	for <linux-staging@lists.linux.dev>; Fri,  9 Jun 2023 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686306280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
	b=gdRy1DbMh/dkWMrEuGnXxjFvvC17t200P9NUQY4QQkjDn0pf7kR7d/fWNu4MCT4ek8LWrt
	E7GoGUsIhYicAF3X/Jx/bzETSnnw7hti9S3B6lBc6pPBXC5JfnPpBXxlFyH0yZXT7Pk5kB
	SEyODphYfGAI5Lqrx6Yv7QNboOsQI8Q=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-p_q1IaRHMBmg1tXfVicqgA-1; Fri, 09 Jun 2023 06:24:39 -0400
X-MC-Unique: p_q1IaRHMBmg1tXfVicqgA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4ec790b902bso1339895e87.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Jun 2023 03:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686306278; x=1688898278;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMg53JOrE7LdjfO2Cif2xn5d4s7Q5BrveDabIgOUiSQ=;
        b=E8jhWfuYRl+TA9pWPQBAP8f+bgzwPOs8ic9AUiSHFjwalC18EFsKbBN+sW4Pn+GC8d
         +QS8KPd53oR5lRern3prRQzkLhyWryTqKv+3rdd7LawbykGA7lOypW/Lw/B23oiZ6k7U
         DFbmfR2dufO7bp5bKD7io9YJ8XNJUdyCOXfdpAh1ezCOzmCam2Ssd/h7j7Nd6Awzcq8T
         bGQh5qL8dNVzbGty1RVr7OMRkifoK9qJfVVKTwYFt62eprWg8AQWciB1Kd+IrsRGZxTv
         1mhLxLR5yHufqUKaDeXcACL2Uk7jJeV+gNPBUM7ee3a+kBwYTTJZN1+XFHGLDDtqWEKF
         nVbg==
X-Gm-Message-State: AC+VfDwy+WLFR/1b1LYqSNAMTHJQzm4U0nnxHPOpgb5H8LxenOvc2Zuf
	6dbkGxAXAsTI4HSPpYy/YSUJA56MnLaJ2CH6N23AbbpZVzb0xuHwEZ5yhkwb4jepiQYmduwmkWj
	pydInHCfNML/M8zxvwCwPGbSNow==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id y15-20020a19914f000000b004f3a4830557mr619110lfj.5.1686306277832;
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6S3RszxExiKf60rjrxsF2OLyJFkoRpusOuEfLcjyVkibfQrgNaGV/G0ODH5bqwWreayNq8WQ==
X-Received: by 2002:a19:914f:0:b0:4f3:a483:557 with SMTP id y15-20020a19914f000000b004f3a4830557mr619101lfj.5.1686306277475;
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y14-20020adfdf0e000000b003063772a55bsm4046255wrl.61.2023.06.09.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:24:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org,
 linux-staging@lists.linux.dev, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdU27OK1=B6Qgwd+tyda=MmN0EiC8taUpvAJJOYUFcm88A@mail.gmail.com>
Date: Fri, 09 Jun 2023 12:24:36 +0200
Message-ID: <87edml53x7.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Geert Uytterhoeven <geert@linux-m68k.org> writes:


>> * fbdev drivers + DRM fbdev emulation + fbdev user-space
>
> "fbdev drivers + fbdev user-space", I assume?
>

Right, I meant to also include "only fbdev drivers + fbdev user-space"
but forgot :)

>> * only DRM drivers without fbdev emulation nor fbdev user-space (your series)
>
> Thomas' series includes fbdev emulation here, for the text console.
>

Yes, I meant fbdev emulation for user-space. Probably should had included
fbcon in the options too...

But what I tried to say is that we need all combination of DRM drivers,
fbdev drivers, DRM emulation for fbcon and emulation for fbdev user-space.

And I think that Thomas' series + a FB_CORE as you suggested and done in
my old series should be enough to have that.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

