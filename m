Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBC7E;
	Wed, 15 Mar 2023 00:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678839997; x=1710375997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U1zdj8Dquc6MZUtI6kfFO20iWgohrm20xN5v1gR/6P0=;
  b=KA0LznXkfDLAHrg7LnyEErpk7GrX0pgQtugv43qa2KCpWDq/IgA9ytpg
   38bYmyoGhAaIZltRcmhQvbNnpdyL18i3UM9H7UOw1MaynYA/nj+Sqr0hn
   BT2Ia4R/RNb5MKotomMSL8Z3Pbpl8uWLzAmuStQbRJ1Fqp+g7SUioa6+3
   +EWYBs7YBNuW9bHM6rWjadQOUSOQGuq33Oh5ujtHocnFAN0Z22WvDyawD
   KrJDo9tcDXpYEWSjU9v/2MTMc19ATzPxVWsBTZ1gtLMxBaOfOK1XobMd1
   4zhQrWyggst/31l6ytad63Lf5phWVx0WLWw3Gbxv8hxIGYDo6JI9GBfVm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400157893"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="400157893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 17:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709480399"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="709480399"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.140.184])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 17:25:07 -0700
Date: Tue, 14 Mar 2023 17:25:06 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Julia Lawall <julia.lawall@inria.fr>, Dan Carpenter <error27@gmail.com>
Cc: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	outreachy@lists.linux.dev, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: enclose Macros with complex values
 in parentheses
Message-ID: <ZBEQYp/z+C/JeR98@aschofie-mobl2>
References: <20230312133347.120944-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303121507450.2865@hadrien>
 <174e4d14-8b3e-67f7-d901-bd77b054f7c3@gmail.com>
 <alpine.DEB.2.22.394.2303121525270.2865@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2303121525270.2865@hadrien>

On Sun, Mar 12, 2023 at 03:25:37PM +0100, Julia Lawall wrote:
> 
> 
> On Sun, 12 Mar 2023, Menna Mahmoud wrote:
> 
> >
> > On ١٢/٣/٢٠٢٣ ١٦:١٢, Julia Lawall wrote:
> > >
> > > On Sun, 12 Mar 2023, Menna Mahmoud wrote:
> > >
> > > > enclose Macros with complex values in parentheses is especially useful
> > > > in making macro definitions “safe” (so that they
> > > > evaluate each operand exactly once).
> > > enclose -> Enclose, and Macros -> macros
> > >
> > > I don't understand the above comment though.  How does adding parentheses
> > > around the body of a macro cause the operands to be evaluated only once?
> > > And the macros that you have changed don't have any operands.
> > >
> > > The value of adding parentheses is normally to ensure that the body of the
> > > macro doesn't interact with the context in a weird way.  For example, you
> > > could have
> > >
> > > #define ADD 3 + 4
> > >
> > > Then if you use your macro as 6 * ADD, you will end up evaluating
> > > 6 * 3 + 4, ie 18 + 4, when you might have expected 6 * 7.  The issue is
> > > that * has higher precedence than +.
> >
> >
> > yes, I mean that but i couldn't explain it well, thanks for your feedback.
> >
> >
> > >
> > > But I don't think that such a problem can arise with a cast expression, so
> > > parentheses around it should not be necessary.
> >
> >
> > So, no need for this patch?
> 
> No, I don't think so.
> 
> julia

Looping in Dan C explicitly.

Can we revisit this one?  It actually leads to a checkpatch ERROR.
So, anyone hoping to get an error free checkpatch run on this file,
is out of luck.

Is this something that checkpatch can learn about and allow, or
should we add the parens here, to dare I say, appease the checkpatch
god ;)

Alison


> 
> >
> >
> > > > this error reported by chechpatch.pl
> > > this error is reported by checkpatch.
> > >
> > > > "ERROR: Macros with complex values should be enclosed in parentheses"
> > > >
> > > > for ADE7854_SPI_SLOW, ADE7854_SPI_BURST and ADE7854_SPI_FAST
> > > > macros and this error fixed by enclose these macros in parentheses.
> > > The last two lines aren't needed.  One can easily see that from looking at
> > > the patch.
> >
> >
> > Got it, Thank you.
> >
> > Menna
> >
> > > julia
> > >
> > > > Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> > > > ---
> > > >   drivers/staging/iio/meter/ade7854.h | 6 +++---
> > > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/iio/meter/ade7854.h
> > > > b/drivers/staging/iio/meter/ade7854.h
> > > > index 7a49f8f1016f..41eeedef569b 100644
> > > > --- a/drivers/staging/iio/meter/ade7854.h
> > > > +++ b/drivers/staging/iio/meter/ade7854.h
> > > > @@ -139,9 +139,9 @@
> > > >   #define ADE7854_MAX_RX    7
> > > >   #define ADE7854_STARTUP_DELAY 1000
> > > >
> > > > -#define ADE7854_SPI_SLOW	(u32)(300 * 1000)
> > > > -#define ADE7854_SPI_BURST	(u32)(1000 * 1000)
> > > > -#define ADE7854_SPI_FAST	(u32)(2000 * 1000)
> > > > +#define ADE7854_SPI_SLOW	((u32)(300 * 1000))
> > > > +#define ADE7854_SPI_BURST	((u32)(1000 * 1000))
> > > > +#define ADE7854_SPI_FAST	((u32)(2000 * 1000))
> > > >
> > > >   /**
> > > >    * struct ade7854_state - device instance specific data
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> >

