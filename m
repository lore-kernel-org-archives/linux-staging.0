Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAA52F2D;
	Sat, 29 Oct 2022 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u8OiKICe3FtMF3Aua0AmfkX/86XOOv3X8TCH3zNeLhU=;
  b=syNpMhvlIWgyltAS/DbjuexL8QR36URSgWcCRu50Lkl9rOp8CNTkO+q6
   79UFYS/aBYzrgSvKMG3loK712sRRA8b7DO4mbG2Xly2oFYUkY5h8nmnkb
   Wpx2CDJy0NHgTJqZuwsYrG1/A1tQtXYAECAxHIa6oRc5dGlZoHYKcxKA3
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,224,1661810400"; 
   d="scan'208";a="72171987"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 19:35:22 +0200
Date: Sat, 29 Oct 2022 19:35:22 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: jovial umwari <umwarijovial@gmail.com>
cc: Alison Schofield <alison.schofield@intel.com>, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
In-Reply-To: <CAMk1CBOgUPjeMw9NmCthsQsDJXY8U4WCBTmNi-3h_BroGnh_QQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210291934400.2917@hadrien>
References: <20221028051420.GA30073@rdm> <Y1wg4y6k1fe/TF0d@aschofie-mobl2> <CAMk1CBOgUPjeMw9NmCthsQsDJXY8U4WCBTmNi-3h_BroGnh_QQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 29 Oct 2022, jovial umwari wrote:

> Noted. Thank you sir

Please don't top post.  Your reponse should appear below the text that you
are responding to.

julia


>
> On Fri, 28 Oct 2022 at 21:35, Alison Schofield
> <alison.schofield@intel.com> wrote:
> >
> > On Fri, Oct 28, 2022 at 08:14:20AM +0300, UMWARI JOVIAL wrote:
> > > i used checkpatch.pl script to identify the above
> > > Repetition of the same word in one sentence same line
> > >
> > > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> >
> > This is my (not yet automated) response:
> >
> > You are sending patches to the Outreachy list, in a way
> > that makes me suspect you have overlooked the Outreachy
> > Project Contribution Information.
> >
> > Please review:
> > https://www.outreachy.org/outreachy-december-2022-internship-round/communities/linux-kernel/  (only accepted applicants can see this link)
> >
> > https://lore.kernel.org/outreachy/Y0D+dzbjRtuc0KT4@aschofie-mobl2/
> >
> > Alison
> >
> > > ---
> > >  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> > > index 090345bad223..30a0276b8b58 100644
> > > --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> > > +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> > > @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
> > >   * If we turn on USE_RXTHREAD, then, no need for critical section.
> > >   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
> > >   *
> > > - * Must be very very cautious...
> > > + * Must be very cautious...
> > >   *
> > >   */
> > >  struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
> > > --
> > > 2.25.1
> > >
> > >
>
>
