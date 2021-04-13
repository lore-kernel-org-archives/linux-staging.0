Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99B70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:24:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id sd23so17931193ejb.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jK/ZPtHk9uvMxSIko7jw6vjwCxriFJfcRMyFensq8Io=;
        b=fGi7Ivm90QF1t75+F6/XInNNdXGH9wmVEO0FnSJcasknjGm8zDgQEUzztsOCKsuudx
         LHNF63FJ6rzEAUhGXYii7WG5gd+sFNAau3MkUnAnTk+hFUEAmpq/DnOm+lOcaX4fDc0k
         2wzFneQBIRp6tm41d4kZGIIaqTNo4UhBY0JYjXO96Lpz8NqFlxSi+7FFhJKrNhHXLOxj
         +asImYLAQHxPd98OoaFbNYr4aiTeU2h5MuqN5/sZSf+nRq0GUhirGC86EJqVH8peA/Np
         0bBHLQzJxVauhKCQX6j6S5yiNUUjUY7pVjPhsfUZ78gj5jwx7MYZpczt4J6Ur419a/uT
         88WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jK/ZPtHk9uvMxSIko7jw6vjwCxriFJfcRMyFensq8Io=;
        b=dKwDjgsGraDO7032oe9fdSxFCdcZcEqp7Avb9oQzpHjyHa/x6L/t98uXVxljHnGfXo
         0aUOvUOss2D4Ii9qJJb6hAkOLIDSrFSY+Cb72ABgSS6aOJOaDdiZQtYmsGago/1VPL/4
         PmGfFtV1AjcWdzfo1a1PIKfCe5jw//xlke7V24SYU2cK3mIMjxrYiSiQs9Bvnw1AHH5W
         W2HEpfx3b4plmOMlykUgzW86kSfhXpqDwvRE8wT9PKQXgL7l+0r15g3skXpZD3g8YIyo
         ToutGwUl/p6Dl7XE+Hz1h0gVO5rGyS4gWyUqNTq/vzvjAKF9XoeUSygLs/CngLe1Q5Vq
         7Y6g==
X-Gm-Message-State: AOAM531ICKqABNtphkeyK70EUbhFCSRDiNSANhr1Llzg6JD7WEiSD7bn
	apCVqswE+o5Gmtbr7H8qo9E=
X-Google-Smtp-Source: ABdhPJyRImYDQhFq9ZhQjfTIEoZuZb9TiJ/PaIjI2YVqhJaMg1BXbPlIIXK/Jcf2O8xhdD+5C2/Lsg==
X-Received: by 2002:a17:906:2a46:: with SMTP id k6mr32490136eje.206.1618327449581;
        Tue, 13 Apr 2021 08:24:09 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id c16sm8308410ejx.81.2021.04.13.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:24:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: core: Remove unused but set variable
Date: Tue, 13 Apr 2021 17:24:08 +0200
Message-ID: <1627371.15on97xvor@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104131715560.8430@hadrien>
References: <20210413150517.12533-1-fmdefrancesco@gmail.com> <alpine.DEB.2.22.394.2104131715560.8430@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Tuesday, April 13, 2021 5:16:17 PM CEST Julia Lawall wrote:
> On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > Removed "ledBlink_param" because it was set to the value of "pbuf" but
> > was never reused. This set was made by direct assignment (no helper
> > had been called), therefore it had no side effect to the location
> > pointed by "pbuf".
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c index
> > f19a15a3924b..440e22922106 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -6191,12 +6191,10 @@ u8 set_chplan_hdl(struct adapter *padapter,
> > unsigned char *pbuf)> 
> >  u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
> >  {
> > 
> > -	struct LedBlink_param *ledBlink_param;
> > 
> >  	if (!pbuf)
> >  	
> >  		return H2C_PARAMETERS_ERROR;
> > 
> > -	ledBlink_param = (struct LedBlink_param *)pbuf;
> > 
> >  	return	H2C_SUCCESS;
> >  
> >  }
> 
> Is this function actually useful?
> 
> julia
>
Actually, it is completely useless.
We should ask the original authors for explanations :)

I'm about to grep the whole driver for the purpose to check if there are 
callers elsewhere and then delete any call and the function itself.

Thanks,

Fabio



