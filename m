Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EF770
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 13:53:23 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso6830029wmc.1
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=or2n56rchUUN+O0Ey3IVBmf3hNw4ShOy6t6olT7Yts8=;
        b=kXvV09+x2hRrzcATNswB8+rrGsAVBOokL9TwVkrtw8xXa9K4ik9WqPLHHBDppD1mwp
         7VQ613T1gisYwYQ+QOBfOnLhM0exnAbNgRcuXXMYd4/cNU5nOgRuCtEocCGoOQM+R5dH
         gpiDYfU2AuIkHnIiI+b/F+/+Hfe3zGwqeuZPxK+zSizY1LF9pAkseLT30IclfRycC0zl
         J4pPu++Qz3A/TeJSS1XsRNhLPjSYtLgkpKN5THHd589XPhx1hbWQOCWv8Z8dVvz0tOVg
         K9zAYcLTHpkwdfS5yUWVMKH24cY+yKBuBqmjZa2WxuQY+sPGeUZWZxZ8rwBN45D8fS7O
         Fb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=or2n56rchUUN+O0Ey3IVBmf3hNw4ShOy6t6olT7Yts8=;
        b=PyzlCipUQYWhFwpDiI9H07WDT6Id51f6pwjBo1nIbAqGfORo3GSpq5kIwJ8dJtSzp8
         CCQSluWjR72IVHbFOyj9PH2l6KXLedViw6g3nggo/tLqhhjlsS9BC8pelQP01kf+vf0C
         NgJZ68GFrADYbTCzEocpzdAvNJVhB2sQO67pO5rvXwVoZ4VFIwOGEh7Xnrm2x8SbbZ6y
         qGMVH+3jXn+iIUOU7Ep326bJIeL3Id6Z7V9TkM7SOoYEiy0/2EjuovklYnKJPNiJTBxp
         MGevpnnx5pZzYH72u4rUNPHB/5i4BvTuRS0Clrm90rHsHCMok27/Qq/0tBqcKDWCi2eG
         FiFw==
X-Gm-Message-State: AOAM531ji6ijCWeanq/i3pamriHIMPKXZ81I+vEdiZZ4fqLd8dtR7VDD
	jCbvkc7YyrEbEuVXAOYaiHJ0Iw==
X-Google-Smtp-Source: ABdhPJwN7lE7w0omdAhf4mqhxLHo8pWY3JTt0XBG0Zpfm4KWIl26MB8LtrMB/fF2hgz/ZaTk3X0SQw==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr8873126wmi.36.1621605202105;
        Fri, 21 May 2021 06:53:22 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id c64sm3596361wma.15.2021.05.21.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:53:21 -0700 (PDT)
Date: Fri, 21 May 2021 14:53:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David A. Schleef" <ds@schleef.org>,
	Mori Hess <fmhess@users.sourceforge.net>,
	Truxton Fulton <trux@linode1.truxton.com>,
	linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 5/6] comedi: drivers: ni_mio_common: Move
 'range_ni_E_ao_ext' to where it is used
Message-ID: <20210521135319.GH2549456@dell>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
 <20210520122538.3470259-6-lee.jones@linaro.org>
 <c69d39a0-bf9e-857d-93ba-73e2884fa4ad@mev.co.uk>
 <20210521072635.GY2549456@dell>
 <20210521115431.GK1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210521115431.GK1955@kadam>

On Fri, 21 May 2021, Dan Carpenter wrote:

> On Fri, May 21, 2021 at 08:26:35AM +0100, Lee Jones wrote:
> > On Thu, 20 May 2021, Ian Abbott wrote:
> > 
> > > On 20/05/2021 13:25, Lee Jones wrote:
> > > > ... and mark it as __maybe_unused since not all users of the
> > > > header file reference it.
> > > > 
> > > > Fixes the following W=1 kernel build warning(s):
> > > > 
> > > >   drivers/staging/comedi/drivers/ni_mio_common.c:163:35: warning: ‘range_ni_E_ao_ext’ defined but not used [-Wunused-const-variable=]
> > > > 
> > > > Cc: Ian Abbott <abbotti@mev.co.uk>
> > > > Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> > > > Cc: Lee Jones <lee.jones@linaro.org>
> > > > Cc: "David A. Schleef" <ds@schleef.org>
> > > > Cc: Mori Hess <fmhess@users.sourceforge.net>
> > > > Cc: Truxton Fulton <trux@truxton.com>
> > > > Cc: linux-staging@lists.linux.dev
> > > > Cc: linux-pwm@vger.kernel.org
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >   drivers/comedi/drivers/ni_mio_common.c | 9 ---------
> > > >   drivers/comedi/drivers/ni_stc.h        | 9 ++++++++-
> > > >   2 files changed, 8 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/comedi/drivers/ni_mio_common.c b/drivers/comedi/drivers/ni_mio_common.c
> > > > index 4f80a4991f953..37615b4e2c10d 100644
> > > > --- a/drivers/comedi/drivers/ni_mio_common.c
> > > > +++ b/drivers/comedi/drivers/ni_mio_common.c
> > > > @@ -160,15 +160,6 @@ static const struct comedi_lrange range_ni_M_ai_628x = {
> > > >   	}
> > > >   };
> > > > -static const struct comedi_lrange range_ni_E_ao_ext = {
> > > > -	4, {
> > > > -		BIP_RANGE(10),
> > > > -		UNI_RANGE(10),
> > > > -		RANGE_ext(-1, 1),
> > > > -		RANGE_ext(0, 1)
> > > > -	}
> > > > -};
> > > > -
> > > >   static const struct comedi_lrange *const ni_range_lkup[] = {
> > > >   	[ai_gain_16] = &range_ni_E_ai,
> > > >   	[ai_gain_8] = &range_ni_E_ai_limited,
> > > > diff --git a/drivers/comedi/drivers/ni_stc.h b/drivers/comedi/drivers/ni_stc.h
> > > > index fbc0b753a0f59..0822e65f709dd 100644
> > > > --- a/drivers/comedi/drivers/ni_stc.h
> > > > +++ b/drivers/comedi/drivers/ni_stc.h
> > > > @@ -1137,6 +1137,13 @@ struct ni_private {
> > > >   	u8 rgout0_usage;
> > > >   };
> > > > -static const struct comedi_lrange range_ni_E_ao_ext;
> > > > +static const struct comedi_lrange __maybe_unused range_ni_E_ao_ext = {
> > > > +	4, {
> > > > +		BIP_RANGE(10),
> > > > +		UNI_RANGE(10),
> > > > +		RANGE_ext(-1, 1),
> > > > +		RANGE_ext(0, 1)
> > > > +	}
> > > > +};
> > > >   #endif /* _COMEDI_NI_STC_H */
> > > > 
> > > 
> > > The "ni_stc.h" header is also included by "ni_mio_cs.c" which doesn't need
> > > `range_ni_E_ao_ext` (admittedly, it was already pulling in a "tentative"
> > > definition of the variable).
> > > 
> > > Thinking about it, I think it's probably better to move `range_ni_E_ao_ext`
> > > from "ni_mio_common.c" into *both* "ni_atmio.c" and "ni_pcimio.c" (I think
> > > we can live with the small amount of duplication), and to remove the
> > > tentative definition from "ni_stc.h".
> > 
> > Happy to rework.
> > 
> > Am I taking this or Uwe's suggestion?
> 
> You should probably take Ian's suggestion because he is the maintainer

I think you missed my point.

Now there are 2 options; I'd like Ian to tell me which one to implement.

> and I really doubt Uwe's will build.  :P  But Uwe is right that
> including .c files is ugly.

No one is disputing that. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
