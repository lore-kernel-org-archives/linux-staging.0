Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6B27B;
	Thu, 20 Oct 2022 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RmB53N3zcCqqM2YVI7EHCvcS0/0+T5CMq3VyOkBQo/g=;
  b=M045BzmS2fnNhVvxDPiH4JZEQjIfnLj0rPjshkjch7M+gTLebh80ygCl
   7FYX/KmaSNXCoVYh3fofR1G/JWNgAmY/U82STIatsxwtAWpttSUrZwAsA
   v4aOB0dslGwdy1Fw6YOOGhyyu2n2J0GsY8kDaILTJbgZBUmdgstL4264k
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,198,1661810400"; 
   d="scan'208";a="31969425"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 13:59:13 +0200
Date: Thu, 20 Oct 2022 13:59:12 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: Request for assistance
In-Reply-To: <CAHJEyKXLFyYkz2sVxSu_GDgT878=qcHOmvT=38gBGqJvaz3tTQ@mail.gmail.com>
Message-ID: <476b0f0-2b9-a9c1-f5c-67d6b6158d0@inria.fr>
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net> <Y1EskCZF7qkiPW2O@kroah.com> <CAHJEyKXLFyYkz2sVxSu_GDgT878=qcHOmvT=38gBGqJvaz3tTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 20 Oct 2022, Tanju Brunostar wrote:

> On Thu, Oct 20, 2022 at 12:10 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 20, 2022 at 11:00:59AM +0000, Ubuntu wrote:
> > > Hello,
> > > I have a diffictly deciding where exactly to split a long line of code. for example, this line of code is too long
> > >
> > > uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> > >
> > > if i spit it this way:
> > > uCTSTime =
> > >         bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> > >
> > > It does not help as the second line is still too long. I considered doing it this way instead:
> > > uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
> > >                                 pDevice->byTopCCKBasicRate);
> > > But i did this on one of my patches and i was told it is not advisable to split a line between
> > > parenthesis '(' and ')'
> >
> > Who told you that?

I did, but the context was different.  It's fine to have a newline among
the of arguments of a function call.  It's less desirable to put a newline
in the middle of (A | B), it if can be avoided.

julia

> >
> > You are close, the code should look like:
> >         uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
> >                                      pDevice->byTopCCKBasicRate);
> >
> > Like millions of other lines in the kernel source tree.  When in doubt,
> > look at existing implementations.
> >
> > hope this helps,
> >
> > greg k-h
> Thank you for the clarification
>
>
