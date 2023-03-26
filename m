Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AB64E;
	Sun, 26 Mar 2023 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1dlb05qC1Np6VuLvDRnihXwqBP9eENNSLwWKReaC1EU=;
  b=QP12dvnzbU3TrxmksXnvsOEAUtebWmf66ldEk0EGiGuYMIBls/c7qdkc
   MyxwtXF2H3FyY/bogDxNlUpoGDp1p1iVIUb0A0DH4XzatlidDBkgOgT5j
   qMt43dIsvGh/r8J7akMT2AkI7CATJXq4OoMXo/JxK+c54BavMf0awjyoG
   Q=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,292,1673910000"; 
   d="scan'208";a="51262119"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 07:51:52 +0200
Date: Sun, 26 Mar 2023 07:51:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: greybus: Inline
 pwm_chip_to_gb_pwm_chip()
In-Reply-To: <20230326052420.GA179105@sumitra.com>
Message-ID: <alpine.DEB.2.22.394.2303260751290.3294@hadrien>
References: <cover.1679732179.git.sumitraartsy@gmail.com> <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com> <ZB63EVLK6/29UUi0@kroah.com> <20230326052420.GA179105@sumitra.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 25 Mar 2023, Sumitra Sharma wrote:

> On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> > On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > > inline function, to make the relevant types apparent in the
> > > definition and to benefit from the type checking performed by
> > > the compiler at call sites.
> > >
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > ---
> > >  drivers/staging/greybus/pwm.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > > index 3fda172239d2..88da1d796f13 100644
> > > --- a/drivers/staging/greybus/pwm.c
> > > +++ b/drivers/staging/greybus/pwm.c
> > > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> > >  	struct pwm_chip		chip;
> > >  	struct pwm_chip		*pwm;
> > >  };
> > > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > > -	container_of(chip, struct gb_pwm_chip, chip)
> > >
> > > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > > +{
> > > +	return container_of(chip, struct gb_pwm_chip, chip);
> > > +}
> > >
> > >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> > >  {
> > > --
> > > 2.25.1
> > >
> > >
> >
> > This patch didn't apply due to changes made in my tree by a patch from
> > someone else before yours.  Can you rebase it and resend?
> >
>
> Hi greg,
>
> I am confused, will that be a totally new patch or a new version(v4 in
> this case)?

New version.

julia

>
> Regards,
>
> Sumitra
>
> > thanks,
> >
> > greg k-h
>
>
