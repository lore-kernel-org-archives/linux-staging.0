Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086526D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:54:26 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id mh2so14380572ejb.8
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=B2Fqr5NrGo6XWgDU6JjQz47MwlJ8Kw/VR7rCvP0gwec=;
        b=hCRENN2JAum41BR5TkYhp6L24NUIe3pxdfzcxPO0KVaXXIqIf2TQKDO+GB2IDzqIGK
         XciSjNUeIld40SMwUdhukgeNrIxsUC/6R/PWz+cmpEd7RxjLCrmRy5XesTi0tFpErWgI
         F/PluSqlFZ2a/16bTLMmgAOs4NWxUVJGNK5dxQJziCvq1LNmjxwDQJpE82uAvL35Xomt
         aGqtY1efUEdxPOVFTj4LENYcv3u0ctHcsn4GROxEonIpUtuJKucqzHYjXd/zUepXKX+N
         bs82HbDF0MooZNm5n3hdPwXaeZ28apP5sNjs+9OH22oyf8R0pINTbL72DYvYJ03nPvhy
         cy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B2Fqr5NrGo6XWgDU6JjQz47MwlJ8Kw/VR7rCvP0gwec=;
        b=KECQF+qUy7DdqIv6NqvAFrqlhIJKETxCPMILWwjs6bZo6eEptfYn0JTP0+PWEnCj+b
         yd2Du6mNG6li7PzUyMkJfyEGG1KdUrzmiCP28rVm2LHV9RTQplMcDACDJv6KFz2LhZTR
         Bb2tnWvgvLTrBF70nQPHMrPx3gZ0YQaoyz4m2ZSDE2bmSWXJNRr/4wcEITmsD6ruxkjt
         WBuQCMO4rxPWv9X0KY9n7PJyzRokc5wF9fql2PC0Q7c8aYAf8c9VzJWSpi02b0+Ks3IA
         9q0lDkwGAEWHyi/Bx3I8NU3hFOoTXiTpBCXoNoKNkYUFNzbYJII23j6nXxWmDYXT+Ydg
         y6fA==
X-Gm-Message-State: AOAM532qMgTlsxGn7r1ICe1IBpOz8svSU9kWzNJ1F91OCDu8nxYa1d73
	PmSO+Sb/prM/eERBvvGNLkJPeg==
X-Google-Smtp-Source: ABdhPJzVBz5Vc8f1H+FidST1MZgZUzJyMRWOEUDV3rKTyI8dZ7dAdCNzVfzORk/vWOA9oZhCIOzXCg==
X-Received: by 2002:a17:906:4fcd:: with SMTP id i13mr2516246ejw.341.1618480465538;
        Thu, 15 Apr 2021 02:54:25 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id e16sm1990440edu.94.2021.04.15.02.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:54:25 -0700 (PDT)
Date: Thu, 15 Apr 2021 10:54:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David A. Schleef" <ds@schleef.org>,
	Mori Hess <fmhess@users.sourceforge.net>,
	Truxton Fulton <trux@truxton.com>, linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 55/57] staging: comedi: drivers: ni_mio_common: Move
 'range_ni_E_ao_ext' to where it is used
Message-ID: <20210415095423.GY4869@dell>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-56-lee.jones@linaro.org>
 <fd880e8e-a5fc-67ef-6ba4-f59592dee71d@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd880e8e-a5fc-67ef-6ba4-f59592dee71d@mev.co.uk>

On Thu, 15 Apr 2021, Ian Abbott wrote:

> On 14/04/2021 19:11, Lee Jones wrote:
> > ... and mark it as __maybe_unused since not all users of the
> > header file reference it.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/staging/comedi/drivers/ni_mio_common.c:163:35: warning: ‘range_ni_E_ao_ext’ defined but not used [-Wunused-const-variable=]
> > 
> > Cc: Ian Abbott <abbotti@mev.co.uk>
> > Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: "David A. Schleef" <ds@schleef.org>
> > Cc: Mori Hess <fmhess@users.sourceforge.net>
> > Cc: Truxton Fulton <trux@truxton.com>
> > Cc: linux-staging@lists.linux.dev
> > Cc: linux-pwm@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/staging/comedi/drivers/ni_mio_common.c | 9 ---------
> >   drivers/staging/comedi/drivers/ni_stc.h        | 9 ++++++++-
> >   2 files changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/comedi/drivers/ni_mio_common.c b/drivers/staging/comedi/drivers/ni_mio_common.c
> > index 4f80a4991f953..37615b4e2c10d 100644
> > --- a/drivers/staging/comedi/drivers/ni_mio_common.c
> > +++ b/drivers/staging/comedi/drivers/ni_mio_common.c
> > @@ -160,15 +160,6 @@ static const struct comedi_lrange range_ni_M_ai_628x = {
> >   	}
> >   };
> > -static const struct comedi_lrange range_ni_E_ao_ext = {
> > -	4, {
> > -		BIP_RANGE(10),
> > -		UNI_RANGE(10),
> > -		RANGE_ext(-1, 1),
> > -		RANGE_ext(0, 1)
> > -	}
> > -};
> > -
> >   static const struct comedi_lrange *const ni_range_lkup[] = {
> >   	[ai_gain_16] = &range_ni_E_ai,
> >   	[ai_gain_8] = &range_ni_E_ai_limited,
> > diff --git a/drivers/staging/comedi/drivers/ni_stc.h b/drivers/staging/comedi/drivers/ni_stc.h
> > index fbc0b753a0f59..0822e65f709dd 100644
> > --- a/drivers/staging/comedi/drivers/ni_stc.h
> > +++ b/drivers/staging/comedi/drivers/ni_stc.h
> > @@ -1137,6 +1137,13 @@ struct ni_private {
> >   	u8 rgout0_usage;
> >   };
> > -static const struct comedi_lrange range_ni_E_ao_ext;
> > +static const struct comedi_lrange __maybe_unused range_ni_E_ao_ext = {
> > +	4, {
> > +		BIP_RANGE(10),
> > +		UNI_RANGE(10),
> > +		RANGE_ext(-1, 1),
> > +		RANGE_ext(0, 1)
> > +	}
> > +};
> >   #endif /* _COMEDI_NI_STC_H */
> > 
> 
> I think it is better where it is for now with its fellow struct
> comedi_lrange variables, but feel free to mark it as __maybe_unused.

Can do.  Will fix.

> (Really, the #include "ni_mio_common.c" mess needs sorting out sometime.)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
