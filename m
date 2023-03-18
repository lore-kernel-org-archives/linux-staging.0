Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCA33D9;
	Sat, 18 Mar 2023 17:55:41 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id bc12so7832398plb.0;
        Sat, 18 Mar 2023 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679162141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81qaQdBcBEP2jHfYRJB7eE244mJTlBVviRI7USBuECw=;
        b=AK7708FUtr5f/inCfiB0yMc0/h3V8fqEYmQnW0dtGVhFsTxuLGkAXuxMFjDK3z3PSh
         SFbLz2DmNOczUkpncbTl8uftF4cQ7yThClmt3P/70TNVlcG2XF+SW+/gv49pnuDbecE8
         sGgk6zihg2H2Oh4BdHDi436izZltHaRKiOrN1ta9V2h5aYoa1pcmCfG6XPE28VhuIg0P
         7AeG2IkR24bqU+uG3Qk4tBO2nIUlO3VYmdovXyKpbZae5w2ur7BA3pjNG+mb9yv6PhBT
         3dxAULCVXyXEM6lTAQI+e2YvTIX1RtF5gQH4K22JQE2dNClQkdXE9Oy9kLok/olDMb9d
         6ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679162141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81qaQdBcBEP2jHfYRJB7eE244mJTlBVviRI7USBuECw=;
        b=ta20253Gy7Fdh7aBrNnO6F5fzi92R0d/5HUwEF0ZHU0XTzW+xaOMvtZ5LFlw6Kuouy
         g8HqQB7TO+YXpIv47DtcxIZtFF8UW4w8PI3+6TL1E7hG2yY+0HK6ckEXtjfCXgiZrbpJ
         9uQVvvDufMIzvSK4H/ysv9BOxm7VvADwyXH8SlW1TqSOn2RVZYwAvZ03+kOf/NmLf6Xv
         JYij2Mm2Kblu4APuS4tzTare1utHACs4Y8NS5EMhnMoY1WTafNtV2z3XXNNvr2t6MiZQ
         EsrV6OigSINkf35Adr2RJGtrfdqDOslRcrhp8fEr5a71VaiM9jjMkySV8m0tL3M3Bthy
         iJIw==
X-Gm-Message-State: AO0yUKVUk9MIjzF2fS/P0oFaPaZGPrpI/gWvwSy1BxQF1jHNZKyMo//Y
	i1QWevS5wMSyoksD27d7ByagiSbhfB6Fgg==
X-Google-Smtp-Source: AK7set/hbzhTcYbmFLhKb0SHtB97paH+z56ao+FfTyjpzr2In6PrTz9qj8HLnFeT69UAeY0frWIJkw==
X-Received: by 2002:a17:90a:1903:b0:23b:2963:ec94 with SMTP id 3-20020a17090a190300b0023b2963ec94mr12832199pjg.29.1679162141142;
        Sat, 18 Mar 2023 10:55:41 -0700 (PDT)
Received: from sumitra.com ([117.199.163.158])
        by smtp.gmail.com with ESMTPSA id b17-20020a631b51000000b004e28be19d1csm3439677pgm.32.2023.03.18.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 10:55:40 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:55:32 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: nvec: Change container_of macro to an inline
 function.
Message-ID: <20230318175532.GA49651@sumitra.com>
References: <20230318170514.GA49181@sumitra.com>
 <alpine.DEB.2.22.394.2303181811260.2914@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303181811260.2914@hadrien>

On Sat, Mar 18, 2023 at 06:14:50PM +0100, Julia Lawall wrote:
> 
> 
> On Sat, 18 Mar 2023, Sumitra Sharma wrote:
> 
> > The macro has the drawback that one cannot determine
> > what type it applies to by looking at the definition.
> > Hence this macro definition is not type-safe.
> >
> > The inline function gives the same benefits as the
> > macro and only accepts the specific type of arguments.
> > Use static because the definition only requires it to be
> > visible in the current file.
> 
> Sumitra,
> 
> The subject line and log message could be a little less generic.  For the
> subject line, one has the impression that you are changing the definition
> of container_of itself.
> 
> The log message is also a bit wordy.  Something like the following would
> be more concise and still present the issue:
>

Okay. I will focus more on writing better patch subject and description.

Thanks.

Regards,

Sumitra

> Convert to_nvec_led from a macro to an inline function, to make the
> relevant types apparent in the definition and to benefit from the type
> checking performed by the compiler at call sites.
> 
> julia
> 
> 
> >
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> >  drivers/staging/nvec/nvec_paz00.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
> > index 8b4da95081c8..9573ba762cdd 100644
> > --- a/drivers/staging/nvec/nvec_paz00.c
> > +++ b/drivers/staging/nvec/nvec_paz00.c
> > @@ -14,8 +14,10 @@
> >  #include <linux/platform_device.h>
> >  #include "nvec.h"
> >
> > -#define to_nvec_led(led_cdev) \
> > -	container_of(led_cdev, struct nvec_led, cdev)
> > +static inline struct nvec_led *to_nvec_led(struct led_classdev *led_cdev)
> > +{
> > +	return container_of(led_cdev, struct nvec_led, cdev);
> > +}
> >
> >  #define NVEC_LED_REQ {'\x0d', '\x10', '\x45', '\x10', '\x00'}
> >
> > --
> > 2.25.1
> >
> >
> >
