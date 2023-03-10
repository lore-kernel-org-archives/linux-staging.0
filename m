Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB9E4C1;
	Fri, 10 Mar 2023 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qEweKj2XRd1QdCen7p39YnwekhKwRuZPaBCU90uMm9Q=;
  b=NjJoaJV6oy/BWhinnAsUvLcLBMrbqNx4vbd/LPyjAfyFrZrt86DnT6ve
   UuPhq/KGhC1nBWBfTs2LZQQjlX6E345ttnZE/FKxBaYp3OIuhV2fn7CV+
   ivXvcIIb9sinucFCdyk1r1ranJc/qbJkHuTWJiUcYz2oME7T0wbZyd4yV
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,250,1673910000"; 
   d="scan'208";a="96598565"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:52:12 +0100
Date: Fri, 10 Mar 2023 22:52:11 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Kloudifold <cloudifold.3125@gmail.com>
cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750: Rename camel case functions in
 sm750_cursor.*
In-Reply-To: <ZAuldn536Ci0fcrV@CloudiRingWorld>
Message-ID: <alpine.DEB.2.22.394.2303102250540.3199@hadrien>
References: <ZAuldn536Ci0fcrV@CloudiRingWorld>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 11 Mar 2023, Kloudifold wrote:

> Thank you for your advice! Should I change this patch and patch message
> and resend it?

Yes please.  But don't top post.

Also, you have the same strange reply to line in your message as I
mentioned for someone else recently.  Perhaps derived from the same mutt
configuration?

julia

>
> On Sat, 11 Mar 2023 at 05:39, Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> > You don't need the filename in the subject.
> >
> > On Sat, 11 Mar 2023, Kloudifold wrote:
> >
> > > This patch fixes the "CHECK: Avoid CamelCase" reported by
> > > checkpatch.pl by renaming camel case functions.
> > >
> > > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> > > ---
> > >  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
> > >  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
> > >  2 files changed, 13 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
> > > index 43e6f52c2..ff643e33f 100644
> > > --- a/drivers/staging/sm750fb/sm750_cursor.c
> > > +++ b/drivers/staging/sm750fb/sm750_cursor.c
> > > @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
> > >       poke32(HWC_ADDRESS, 0);
> > >  }
> > >
> > > -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> > > +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
> > >  {
> > >       cursor->w = w;
> > >       cursor->h = h;
> > >  }
> > >
> > > -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> > > +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
> > >  {
> > >       u32 reg;
> > >
> > > @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> > >       poke32(HWC_LOCATION, reg);
> > >  }
> > >
> > > -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > > +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > >  {
> > >       u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
> > >               HWC_COLOR_12_2_RGB565_MASK;
> > > @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > >       poke32(HWC_COLOR_3, 0xffe0);
> > >  }
> > >
> > > -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> > > -                          const u8 *pcol, const u8 *pmsk)
> > > +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> > > +                           const u8 *pcol, const u8 *pmsk)
> >
> > The indentation of the second line looks random.  It's not a multiple of
> > the tabs, and it doesn't line up with the right side of the (.  So there
> > doesn't seem to be any need to change it for this patch.
>
>
