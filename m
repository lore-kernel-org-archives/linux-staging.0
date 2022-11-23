Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783E1C31
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 10:13:46 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id h16so2484051qtu.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 02:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J1/Dk89lTEXUaWgB7PSlowyLzY8WAPYmQ4lIK/72+8=;
        b=lla97dQpJK4iJIlV51P18PMbrIx6xFn6q0oL9ZYihEZETt/2zBVSciR/lClX0M4WUn
         fWCmZHIyzBTJEDEaNdC3d1BakC5V7jElNRg7Nwn1qgLKhzdNUzvJA1QUUOuwt/3tLfri
         pDBQfbiv7YbBlyXJq3bu1zOD0EhOpzNH+DcOJB9sl1Ygw425Q2gEcaU0doAXJvtFzWsU
         D9RMJV33xaLiCq4++VI4efJag9S/vFG59mikQV0UhsGzosoTtVZT1j3GEn74AvGX5XUP
         bO1/HtlEgAKm2M1Da0zrDCCo3jnkyg7P0OvHLUAosaJadXpYkPaZ9Pz6UpddWWhQwLcS
         82Fw==
X-Gm-Message-State: ANoB5pmG6wtQ+aIzSyfKr/jal5vMIHPuXWB+VSGi+6MhaUumycex9Uf6
	G5IddACSq1d93Y251ceiufDUPHndzz3p4g==
X-Google-Smtp-Source: AA0mqf4jk3yqhd+QhH36RXj2RKKzYPhQ6qCFvxOeyjjHYvbpiPSB7jHSfm54fJrgmST0gEJuuA6W/Q==
X-Received: by 2002:ac8:5bd1:0:b0:39a:7b0e:cdef with SMTP id b17-20020ac85bd1000000b0039a7b0ecdefmr8248991qtb.23.1669198425124;
        Wed, 23 Nov 2022 02:13:45 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fbb833fef8sm11704790qkg.28.2022.11.23.02.13.42
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:13:43 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3a7081e3b95so65757667b3.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 02:13:42 -0800 (PST)
X-Received: by 2002:a05:690c:b01:b0:370:202b:f085 with SMTP id
 cj1-20020a05690c0b0100b00370202bf085mr25967882ywb.502.1669198422650; Wed, 23
 Nov 2022 02:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
In-Reply-To: <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 11:13:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
Message-ID: <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
<tommaso.merciai@amarulasolutions.com> wrote:
> On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > By moving support for the USB Syntek DC1125 Camera to staging, the
> > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> >
> > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
>
> Patch itself looks good but we have some style issue. Applying this
> patch I got the following warning from checkpatchl:
>
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> #10:
>
> You have to pass only the first 12 chars of the sha1 commit into Fixes
> msg:
>
> Use:
>
>  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
>
> Instead of:
>
>  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")

I always use 16 chars, to avoid these becoming ambiguous in a few years.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
