Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77637E
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 15:49:19 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id k2so12663159qkk.7
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2hwfJ3OGi9bNFK3Bxx9uQ9VsJMFOKPpsAznNmxcF54=;
        b=CcSLf3W+aU0KGdb6BDkxki+Xn/egmrqyVbvtpIQvy7aFV6IjpIN7ExRYYnyR16Prts
         +55nSaR5h5xWmLXLi9NtK9528HkYbC5YMBhG3k9CEEzez1NCr+09N8MnYTnUKlYmvlJN
         KK1M52/cv0CLqHKFznqyZ4OpdFJaiVZw+eVBqKS01tx/dm0LeJopNxazCqgmP59cBI4/
         5TUvc5a/FdTbIWIoWJSwqm/ibv47CUacOCLvLapMuHT7gRwQu9lCksUWh0QwmXvzYrBt
         jAiWp/88aaekgZtbP7xTE8Kp8SjGRlXDpzGi/TRrn14bPZP2oM2j18yAZTm/cu12mCql
         p5Zw==
X-Gm-Message-State: ANoB5pkRHC7NNDug3CWqCULLC/OzABG9rw3gca2HqC4V2fAp5coB1OzP
	20/CNo94Kroh9Vqvi5fLgobRgQt1rYRdaw==
X-Google-Smtp-Source: AA0mqf7QntUtkTSZOrCVTrn+p9rmq/zkg5FaE2cpjkwe7bae5cVSsIXWEKTK7GXHOhkFZXgJrc0M3A==
X-Received: by 2002:ae9:e115:0:b0:6fc:2903:1dd1 with SMTP id g21-20020ae9e115000000b006fc29031dd1mr3679490qkm.232.1669218558513;
        Wed, 23 Nov 2022 07:49:18 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id s6-20020a05620a254600b006e07228ed53sm12585812qko.18.2022.11.23.07.49.17
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:49:17 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id y83so4744907yby.12
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:49:17 -0800 (PST)
X-Received: by 2002:a25:8249:0:b0:6dd:b521:a8f2 with SMTP id
 d9-20020a258249000000b006ddb521a8f2mr7980121ybn.380.1669218556787; Wed, 23
 Nov 2022 07:49:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i> <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
 <Y344AdRANmS3STsd@kadam>
In-Reply-To: <Y344AdRANmS3STsd@kadam>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 16:49:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRZhBECgABtTxe00gM7_EqBaX5auZhmjUfmcLx4zoetQ@mail.gmail.com>
Message-ID: <CAMuHMdVRZhBECgABtTxe00gM7_EqBaX5auZhmjUfmcLx4zoetQ@mail.gmail.com>
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
To: Dan Carpenter <error27@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Wed, Nov 23, 2022 at 4:11 PM Dan Carpenter <error27@gmail.com> wrote:
> On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> > <tommaso.merciai@amarulasolutions.com> wrote:
> > > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > > >
> > > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> > >
> > > Patch itself looks good but we have some style issue. Applying this
> > > patch I got the following warning from checkpatchl:
> > >
> > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > > #10:
> > >
> > > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > > msg:
> > >
> > > Use:
> > >
> > >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> > >
> > > Instead of:
> > >
> > >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> >
> > I always use 16 chars, to avoid these becoming ambiguous in a few years.
>
> If we assume hashes are randomly distributed and that people commit
> 100k patches every year then with 12 character we would have 17
> collisions every 1000 years.

So I can expect to see a collision before my retirement day
(which coincides with the signed 32-bit time_t flag day ;-)

BTW, does the above take into account that commit hashes can
collide with other object type hashes, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
