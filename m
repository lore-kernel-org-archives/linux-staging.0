Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276A10E7
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 10:35:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z20so22751224edc.13
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 02:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdk6ayM1Ct66O9yHo4VxrA9gKbs+xznnUkFGTJiMlC0=;
        b=ixd/SW/4mbmK6Eq8U/7u9FDripN0Ee0KDzFNOLNcZkTXpLexIRwydzZqRg+uK2N2Ru
         Dcdxr5iVaE74MXUhXzk1nNzoxluSpStPsJ/g5j/xJskSFfxW5u2r9voPSKtL08AendVN
         3nlEF2kGhoNuamYFmkMBRY1/o/FaI4tEX6WcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fdk6ayM1Ct66O9yHo4VxrA9gKbs+xznnUkFGTJiMlC0=;
        b=eYQF77yOIRhNG2XS8SD/mObbMBbmDV4ZWnB47Rotq1nI9xjqPrDwP/JUwSWcyCa5FY
         KNsAAgqIpxLBES2cWSzajjX20J/TBnVfKQmdq+CBFyg9JyZLDxsIh/T/Pw7CD/CGKKcP
         ZSFWRdL+KQCZNBZW99SD3S78P+p2H1k+yspUFxJ/fKAJwnm+ZIT13djvsAyjXpCYvzmf
         ul5GhkCPFBAqrF5a9EzCkd0ptGoACe+v4xbZQGFhljiGrknI5RM+IjR4/G80EAsgX+oJ
         aPbp4ylWrxWF2EZwITwOB4a+RgnJCamYOQDfRrr/gHSFYuz4zLB12kkyP3j1EF4NXZxb
         a/7w==
X-Gm-Message-State: ANoB5pkT/elKygbE6fI0IQ1ABqB4WcXYCZLuDtjyxIEm67T0bqFYuIXx
	BZCat7ElQOGXPMA4j+NJ+nTJDQ==
X-Google-Smtp-Source: AA0mqf74EvznZPyWVMWqJcVg8W8zFDmrOicPF2lAdmAcsc0cuX+YS8xaKiCmanEDyWJxlD9Befz3bw==
X-Received: by 2002:a05:6402:291b:b0:461:60b1:5c6d with SMTP id ee27-20020a056402291b00b0046160b15c6dmr13199766edb.182.1669199720603;
        Wed, 23 Nov 2022 02:35:20 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id e12-20020a1709062c0c00b0073d7b876621sm7043433ejh.205.2022.11.23.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:35:19 -0800 (PST)
Date: Wed, 23 Nov 2022 11:35:17 +0100
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <20221123103517.GA2874916@tom-ThinkPad-T14s-Gen-2i>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
 <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>

Hi Gaert,

On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> <tommaso.merciai@amarulasolutions.com> wrote:
> > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > >
> > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Patch itself looks good but we have some style issue. Applying this
> > patch I got the following warning from checkpatchl:
> >
> > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > #10:
> >
> > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > msg:
> >
> > Use:
> >
> >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Instead of:
> >
> >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> 
> I always use 16 chars, to avoid these becoming ambiguous in a few years.
> 
> Gr{oetje,eeting}s,

Thanks for sharing this info.

Regards,
Tommaso

> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
