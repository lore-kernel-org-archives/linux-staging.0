Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32E70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 07:26:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r12so19998342wrp.1
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wHJsiC5bAPMJ/JK2F8/kAPqQTZHzq5ny0YRHjZNAtPg=;
        b=D9Q+TP0/xYt4iQ45TGcwC580vJ0ZoowBEIqSbX9KoF301h+z+xAJAjXYNPkmhcmO3e
         zgy8E4COS7RDsbiucJ8FlmM7gnHuo/tVxwxKnSuTnfWx7uRMZFWkONcGL/Z4kp67mBFd
         +BnwEy2t7VMOC5CB1PKqSyOdh022za9V8pMv7R+5xMLKhsHhnU+5ObBAXKY4z8y/z96D
         j8VsK3FcOyNuElRe11Uw4MSYYWTFG/lDwZJudfhwDtpsZ7558q8GbrerDk67+Nwb0u3F
         8ztbk2Uyee+zWrCrQoirq+/r9tPtihNRW9BEl1cAAPqcqBxrsYTnsNaI3S9qaJGvh07Y
         N4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wHJsiC5bAPMJ/JK2F8/kAPqQTZHzq5ny0YRHjZNAtPg=;
        b=aV5D1XLJxOpKlh6TbnbF/u0aQL9JgI+ra/GzQy9p0A/z0YsWsANlLUyWauSvwaTBQN
         3Z4eEGtm6xR4nBfbaYu0Jefyt+rNxh9Fk0O6EZx9evZap7gLXgpzdMdrUdrpRMQlfQ6m
         OgHYwL7cZTF8FDi/e3J1VokzTkJZGW0kraA1WcHSCYYkIJ7uFhTwk4V6SWlKtXXqEq5p
         2g3oRT8ZNmmbzvKy7yRIOls0Csgl/N4tzmWNwGesR7C4kgEaUZJEUm6d1IpgQoexkYzD
         jk4vOJ0nrTEO87bIk/YN9Kk/q7L/Xw6Mm48fs6iad6EdR5EsKYSedzY9HFxSZCzq2q+n
         Fikg==
X-Gm-Message-State: AOAM530fULt5ONjNL2WTqPyQLi9RjXFZxPFBI0caliKlD0eF1Nz4ikoq
	nQ1ecsBhh6vSmooe8t2hhF40TQ==
X-Google-Smtp-Source: ABdhPJzESohZioxALYLgYLF5Uhkx1nAY0R/4gNgHpibC0XIoL2X2pIn9HQvSnSr0YfBD+4gAM9qgjg==
X-Received: by 2002:a5d:688d:: with SMTP id h13mr7927610wru.362.1621581997336;
        Fri, 21 May 2021 00:26:37 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id c6sm1032177wru.50.2021.05.21.00.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 00:26:36 -0700 (PDT)
Date: Fri, 21 May 2021 08:26:35 +0100
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
Subject: Re: [PATCH 5/6] comedi: drivers: ni_mio_common: Move
 'range_ni_E_ao_ext' to where it is used
Message-ID: <20210521072635.GY2549456@dell>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
 <20210520122538.3470259-6-lee.jones@linaro.org>
 <c69d39a0-bf9e-857d-93ba-73e2884fa4ad@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c69d39a0-bf9e-857d-93ba-73e2884fa4ad@mev.co.uk>

On Thu, 20 May 2021, Ian Abbott wrote:

> On 20/05/2021 13:25, Lee Jones wrote:
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
> >   drivers/comedi/drivers/ni_mio_common.c | 9 ---------
> >   drivers/comedi/drivers/ni_stc.h        | 9 ++++++++-
> >   2 files changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/comedi/drivers/ni_mio_common.c b/drivers/comedi/drivers/ni_mio_common.c
> > index 4f80a4991f953..37615b4e2c10d 100644
> > --- a/drivers/comedi/drivers/ni_mio_common.c
> > +++ b/drivers/comedi/drivers/ni_mio_common.c
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
> > diff --git a/drivers/comedi/drivers/ni_stc.h b/drivers/comedi/drivers/ni_stc.h
> > index fbc0b753a0f59..0822e65f709dd 100644
> > --- a/drivers/comedi/drivers/ni_stc.h
> > +++ b/drivers/comedi/drivers/ni_stc.h
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
> The "ni_stc.h" header is also included by "ni_mio_cs.c" which doesn't need
> `range_ni_E_ao_ext` (admittedly, it was already pulling in a "tentative"
> definition of the variable).
> 
> Thinking about it, I think it's probably better to move `range_ni_E_ao_ext`
> from "ni_mio_common.c" into *both* "ni_atmio.c" and "ni_pcimio.c" (I think
> we can live with the small amount of duplication), and to remove the
> tentative definition from "ni_stc.h".

Happy to rework.

Am I taking this or Uwe's suggestion?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
