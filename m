Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CFE4C1;
	Fri, 10 Mar 2023 21:47:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y11so7079903plg.1;
        Fri, 10 Mar 2023 13:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678484857;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvqFMoukHnbi8zZDWrIR0Cqy/xe4wY5XQEtCWDlrMbs=;
        b=BeDvODNBbxMyZd3xLBMTn42Ye5wUOBf3+W6xynBoF1HKwlfiXBTl7fR4zm7QJPwoZZ
         cmKJbTnaLgjaJ+aTnMOwAlpxW8myh6xHG8rX7jrFZDBqxQMttj+CdJiJGPkZXVEur2hD
         p+8PLPnJBxxGOEwEYR7rn3WJp3ZeHyNgRwxYLyvLwf3hN0EWNzNxkadxxFrTT5ipenRw
         +nlWqKFSkJGPRuxE5nHF+p7/lADlSDQywvp0zsyZrpft8rlB659wDvzC0oQ07B1882vd
         GL3hHafPSRSsXwgSQricA/HUVKJpRj2NCsAFjzdEkbciO+07L96H1QwIYZKDX7Av1L6k
         Zq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484857;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvqFMoukHnbi8zZDWrIR0Cqy/xe4wY5XQEtCWDlrMbs=;
        b=Nwoy9eLjFuvhE+mETTotfovX3ps81R0fRPHNm4kuXTTeA+/X+kcgqeN1C2UUJHX4f4
         NL64jY1IY68SEy69vznRxL2nKaOLOVFZqDJ9KuJnf8F8iPS60Uj5FltFCjxFb1M/TrJk
         rIijozCpV5uMSstmyO8wbkhDRmXw5k05MueK74OxqAQQZSyvHDXkDMTdB704cp6S04I9
         Uw1VPjK2hHJfX0k+6yftN3fC3KLDmeolY/NRcqlDLgIdlAx00r5z2r/VC478mRz1IFEa
         wt8t2hKdn+UqzWRJneq+qXPozZszogtx6vVNjfOEz/OuJVVa6wj+hWu/i3Lm9Y99lX2O
         iX7g==
X-Gm-Message-State: AO0yUKUaVO6jQ/K7IOP3vlsyzvPipFXjaF64PC6s/4lcWrXhmIh6aEBl
	vgA6YxmGzUXVRcsX0bnFxso=
X-Google-Smtp-Source: AK7set81yoZfs27jmZWjD5lcqJFLlosobBO6dGfYY0pTt3rY7iVNSgVyfQifMqMFA2RVvbm4WsF6bw==
X-Received: by 2002:a17:90a:2c2:b0:233:e305:f617 with SMTP id d2-20020a17090a02c200b00233e305f617mr28341289pjd.32.1678484857168;
        Fri, 10 Mar 2023 13:47:37 -0800 (PST)
Received: from CloudiRingWorld ([122.231.69.163])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090ab78f00b002369e16b276sm360893pjr.32.2023.03.10.13.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:47:36 -0800 (PST)
Date: Sat, 11 Mar 2023 05:47:34 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: julia.lawall@inria.fr
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750: Rename camel case functions in
 sm750_cursor.*
Message-ID: <ZAuldn536Ci0fcrV@CloudiRingWorld>
Reply-To: alpine.DEB.2.22.394.2303102236190.3199@hadrien
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thank you for your advice! Should I change this patch and patch message
and resend it?

On Sat, 11 Mar 2023 at 05:39, Julia Lawall <julia.lawall@inria.fr> wrote:
>
> You don't need the filename in the subject.
>
> On Sat, 11 Mar 2023, Kloudifold wrote:
>
> > This patch fixes the "CHECK: Avoid CamelCase" reported by
> > checkpatch.pl by renaming camel case functions.
> >
> > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
> >  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
> > index 43e6f52c2..ff643e33f 100644
> > --- a/drivers/staging/sm750fb/sm750_cursor.c
> > +++ b/drivers/staging/sm750fb/sm750_cursor.c
> > @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
> >       poke32(HWC_ADDRESS, 0);
> >  }
> >
> > -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> > +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
> >  {
> >       cursor->w = w;
> >       cursor->h = h;
> >  }
> >
> > -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> > +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
> >  {
> >       u32 reg;
> >
> > @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> >       poke32(HWC_LOCATION, reg);
> >  }
> >
> > -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >  {
> >       u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
> >               HWC_COLOR_12_2_RGB565_MASK;
> > @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >       poke32(HWC_COLOR_3, 0xffe0);
> >  }
> >
> > -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> > -                          const u8 *pcol, const u8 *pmsk)
> > +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> > +                           const u8 *pcol, const u8 *pmsk)
>
> The indentation of the second line looks random.  It's not a multiple of
> the tabs, and it doesn't line up with the right side of the (.  So there
> doesn't seem to be any need to change it for this patch.

