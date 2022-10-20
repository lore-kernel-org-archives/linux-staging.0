Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C67E;
	Thu, 20 Oct 2022 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+DA42MjVpbVR0TM66dJLt3gdRhQ0fymTZJPpw0F8kv8=;
  b=MPvNg/tubHXzRsdqUTGERAxaOE8RvPWSAPSAMxaqtHiVFvFCZn/tTcOY
   zlJCKkBhumL+c6T/iWxHMeQoYZQb9EHLb+ATKn4YswmbmYg0VcNr3gVey
   1KhUYBmv7n+KZTvGKkr6oNEFdMHjg0umhPikWliPFDw5UHdxZb7rNrmhN
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,198,1661810400"; 
   d="scan'208";a="31959120"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 12:21:36 +0200
Date: Thu, 20 Oct 2022 12:21:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net, 
    phil@philpotter.co.uk, paskripkin@gmail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v3 06/10] staging: r8188eu: Add space between function
 & macro parameters
In-Reply-To: <Y1EcmphZyExVVttR@debian-BULLSEYE-live-builder-AMD64>
Message-ID: <8e7c457c-a58a-9c2a-ba0-d520c5e0f53e@inria.fr>
References: <cover.1666249715.git.drv@mailo.com> <79e0aa96b1c8b2bc0c0f8ef9e651ab254629c7a8.1666249716.git.drv@mailo.com> <114d7521-a15-9569-cb38-69f4bb8990f7@inria.fr> <Y1EcmphZyExVVttR@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> > > -#define PlatformEFIOWrite1Byte(_a,_b,_c)		\
> > > -	rtw_write8(_a,_b,_c)
> > > -#define PlatformEFIOWrite2Byte(_a,_b,_c)		\
> > > -	rtw_write16(_a,_b,_c)
> > > -#define PlatformEFIOWrite4Byte(_a,_b,_c)		\
> > > -	rtw_write32(_a,_b,_c)
> > > -
> > > -#define PlatformEFIORead1Byte(_a,_b)		\
> > > -		rtw_read8(_a,_b)
> > > -#define PlatformEFIORead2Byte(_a,_b)		\
> > > -		rtw_read16(_a,_b)
> > > -#define PlatformEFIORead4Byte(_a,_b)		\
> > > -		rtw_read32(_a,_b)
> > > +#define PlatformEFIOWrite1Byte(_a, _b, _c)		\
> > > +	rtw_write8(_a, _b, _c)
> > > +#define PlatformEFIOWrite2Byte(_a, _b, _c)		\
> > > +	rtw_write16(_a, _b, _c)
> > > +#define PlatformEFIOWrite4Byte(_a, _b, _c)		\
> > > +	rtw_write32(_a, _b, _c)
> > > +
> > > +#define PlatformEFIORead1Byte(_a, _b)		\
> > > +		rtw_read8(_a, _b)
> > > +#define PlatformEFIORead2Byte(_a, _b)		\
> > > +		rtw_read16(_a, _b)
> > > +#define PlatformEFIORead4Byte(_a, _b)		\
> > > +		rtw_read32(_a, _b)
> >
> > Could these be inline functions?
>
> I am actually not seeing these macros being used anywhere. These macros were
> added recently [commit ID: 7884fc0a1473c2721f496f1d1ddc9d2c91aefa53] in 2021. I
> am unsure if they are intended to be used in the future or can removed entirely.
>
> Making these inline functions can be done, however, will we need to measure
> performance impact? I will need help and time for this evaluation.

Inline functions shouldn't have any performance impact.  For these simple
things the compiler should inline them.

The reason why a macro may be needed is if it is not possible to find a
single type for all of the possible argument values, or if some argument
values are assigned to by the macro definition, and not just read.

I would have suggested to look at all of the uses to see if there are any
concerns like this, but if there aren't any uses, that won't be possible.
There seems to be no special knowledge in these macros that is worth
preserving, so I think that they can just be dropped.

julia
