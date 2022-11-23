Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E67E
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 15:52:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t4so13347487wmj.5
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++E1vp6+xyfegCAT71khtdOEoE+9YsdkyoFRM1NuM3c=;
        b=GXLHAlwH+Njmvyj+SPjPfOH1/1e+wlgnzW2b8oN59RNi7+0RgESKcUiV6V9AxnLztK
         z50xDK/Njyfbb7uzRSs+2B/NxXl2ObEpOw4G098PzJVWYkmeu3KQKaOplm9vYhvbku2e
         Bh6FNqBAKj9jsrI9vy1Ezxrt34jD5jK+ySF4Rw8u2974AojnftTixzMdOZccwvKB4TDR
         4Y+wBiYu5pJPa798iAk/ttD8250UN08t9Qt6pq1xg38oGUDOXJj+vlu6dRdH1oFjzZ0a
         NcZCYXYisaeqFAjvjZHd1eVzP8hn0lHmIzSI4/qmXzYdeArTrpnG9PGJ1L/OuiuYk8HP
         FoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++E1vp6+xyfegCAT71khtdOEoE+9YsdkyoFRM1NuM3c=;
        b=AloCJ2ba83kQDJjUl5hv5E2XcZHABocV+9iXxQAwjVjQJCls57Smi8GZZ76pYKhUaV
         BXy2jsFDNYlmOpqum0vAWxyHmgl8A6NgGiIkjXzujO+RCdiEBratEq7zsbW7Ri6HoOe9
         sD6Io3h1sSaw3E6BtFH1Wtv5+a0rldhc39KdxZUWPKRI3Pwuo8iNULxIoID0+9LyBrFl
         MziI7cczlDqC8h1KO7vgoP7CB8G/4QP06Trb1bIlmYrqS2bsVjkkvc0MSdZfKnoSv0OH
         oVJ9kHt1A76GzeQiAx5wb8OHWikK80Y+H+i5V5Cz8cdFkPFHd6LLeB1VC/L7ayO4EvLc
         B9IA==
X-Gm-Message-State: ANoB5pkiVtaZ+mNtGLfT82gXL4q0sz0O+XVKTs4+TFO/etGDn+X2vGmS
	Wcxdq422puXHaTdrpucqDJg=
X-Google-Smtp-Source: AA0mqf71kvwmJPvlUO4d6EhKv/nSwsxHVmlh40//junEO4REeKrI6DGtUgYpipX4ygFdSNgOmdzVXg==
X-Received: by 2002:a7b:cb91:0:b0:3c6:cb54:ef66 with SMTP id m17-20020a7bcb91000000b003c6cb54ef66mr9934854wmi.90.1669218718769;
        Wed, 23 Nov 2022 07:51:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o7-20020a05600c510700b003cf5ec79bf9sm3006745wms.40.2022.11.23.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:51:58 -0800 (PST)
Date: Wed, 23 Nov 2022 18:51:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <Y35Bm8bhKojxzdox@kadam>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
 <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
 <Y344AdRANmS3STsd@kadam>
 <CAMuHMdVRZhBECgABtTxe00gM7_EqBaX5auZhmjUfmcLx4zoetQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVRZhBECgABtTxe00gM7_EqBaX5auZhmjUfmcLx4zoetQ@mail.gmail.com>

On Wed, Nov 23, 2022 at 04:49:05PM +0100, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, Nov 23, 2022 at 4:11 PM Dan Carpenter <error27@gmail.com> wrote:
> > On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> > > <tommaso.merciai@amarulasolutions.com> wrote:
> > > > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > > > >
> > > > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> > > >
> > > > Patch itself looks good but we have some style issue. Applying this
> > > > patch I got the following warning from checkpatchl:
> > > >
> > > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > > > #10:
> > > >
> > > > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > > > msg:
> > > >
> > > > Use:
> > > >
> > > >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> > > >
> > > > Instead of:
> > > >
> > > >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> > >
> > > I always use 16 chars, to avoid these becoming ambiguous in a few years.
> >
> > If we assume hashes are randomly distributed and that people commit
> > 100k patches every year then with 12 character we would have 17
> > collisions every 1000 years.
> 
> So I can expect to see a collision before my retirement day
> (which coincides with the signed 32-bit time_t flag day ;-)
> 
> BTW, does the above take into account that commit hashes can
> collide with other object type hashes, too?

I assumed that `git show` won't show those other object types, but I
don't really know if that's true.

regards,
dan carpenter

