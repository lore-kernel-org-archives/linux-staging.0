Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAC1CCCC;
	Sat, 12 Aug 2023 18:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fjShP+R73JvkzExClJjJoaqs0KgU7GKPFvHgV12d4o8=;
  b=tMdCukHeTTFNEUVgMy+xyPSwYQR2malzIgDzVvdGdTYaLXwmXJifPJdu
   dJP+TjJ+wZ134B4aKZ/CuFQ34BWayjZvGlGIwxLAS2zzzTE2p0WfdXOnD
   9ReuFURMnYer4QfrPsLGqH+bAs1LehRCAfwuXtxFtIevmhDAMrN9HCEoL
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,168,1684792800"; 
   d="scan'208";a="63412516"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 20:41:51 +0200
Date: Sat, 12 Aug 2023 20:41:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Pavan Bobba <opensource206@gmail.com>
cc: Greg KH <greg@kroah.com>, Forest Bond <forest@alittletooquiet.net>, 
    Michael Straube <straube.linux@gmail.com>, 
    Philipp Hortmann <philipp.g.hortmann@gmail.com>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linuxkernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
In-Reply-To: <ZNfPiQAL3ixA7tjz@ubuntu.myguest.virtualbox.org>
Message-ID: <alpine.DEB.2.22.394.2308122041160.3315@hadrien>
References: <ZNOK2u1sJoRAxhIC@ubuntu.myguest.virtualbox.org> <2023081150-hamster-sulfide-4231@gregkh> <ZNfPiQAL3ixA7tjz@ubuntu.myguest.virtualbox.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 12 Aug 2023, Pavan Bobba wrote:

> On Fri, Aug 11, 2023 at 11:27:10PM +0200, Greg KH wrote:
> > On Wed, Aug 09, 2023 at 06:17:22PM +0530, Pavan Bobba wrote:
> > > Replace array name of camel case by snake case. Issue found
> > > by checkpatch
> > >
> > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > ---
> > >  v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
> > >            2. typo in the subject line "small case" corrected with the
> > >               proper word "snake case"
> > >
> > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > ---
> > >  drivers/staging/vt6655/baseband.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> > > index 0e135af8316b..cc8793256661 100644
> > > --- a/drivers/staging/vt6655/baseband.c
> > > +++ b/drivers/staging/vt6655/baseband.c
> > > @@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
> > >  };
> > >
> > >  #define CB_VT3253B0_INIT_FOR_RFMD 256
> > > -static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> > > +static const unsigned char by_vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> >
> > Again, the "by" needs to just be dropped.
> >
> > thanks,
> >
> > greg k-h
>
> hi greg...did'nt get your comment. can you please provide more elaborate
> info?

Drop the letter "by_" at the beginning of the function name.  It is there
ot indicate the type, which isn't done in the kernel.

julia
