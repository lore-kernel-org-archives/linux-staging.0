Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161FF64E;
	Sun, 26 Mar 2023 05:24:27 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so8884675pjb.4;
        Sat, 25 Mar 2023 22:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679808267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8eM3auEURf5Yz74B4xS+px+Zq3swgYLBvUD75GaNMk=;
        b=TjpZI22arNu77KtHiNIoBJMxYSrvrLnM4V1z+nkoSbUOf/MobLcMMgdIWv2KOi0IDE
         hiVzQbyC38iOh6EMT8wKVBBYIjcjXtWskrmokuAc6a3eAzlrxz1YfNGGx7xRZ8YDsXR6
         MpJqfhrDwsYk/VBEEpOSVoQjwgwIbx6i4Oy6RVtmVZDqD/bEMHAqPSEbJGk1Bib93ALQ
         MfcsfetV7TCRLfhxsXq5rWvAdF1uHGF8haCGG5Rb0buhFpCZJ+bJQndZdXG6sFkKfvsl
         m/KKoKBZ8WG9YxuTYJRoK7R108iV5Dlh3E/FhSYTg1SBBXBKSN7m2soVJDAdi+sMOw6V
         Atbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679808267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8eM3auEURf5Yz74B4xS+px+Zq3swgYLBvUD75GaNMk=;
        b=6JFwlGgpnUck3IMudGZ4mZ8wNWsQ0qfy7dJ7MULKAOtdx3+bONmFumNFDQ0mYD6obz
         be02sOnHzz8deJVSCpRr67wgZobWb++Ewcd0cEJpkuPvnfQCdT2jjtStwRA85TSw/F0G
         8bQYV0Jj9/9RQzAfiYZRQF3S+lsgq7UFv6exdy1QpkQADZXCrHNLsOZHVU7Cwbrs57KY
         oCzfb3zsrCw3XfN161f8soKh7wFhdYovxzebvBYLCM3156wsuBHtPhnr9Q6FlhtzSEeI
         rpRUMQ7jFe2QuyoS1pIWTvwuSbdkSrYMNojw/n8EgCtBWm3+9Xv0EnvqW9acL4m+/Wbc
         cQkQ==
X-Gm-Message-State: AAQBX9ePdzR2nNGeEr2pyENktPU3oReOkv6035Sl9nK5ANX/VYj/jwnP
	SdTZGTEVsx/fjBFbIIlpASw=
X-Google-Smtp-Source: AKy350afbQeZdtfvWlHEvJm+uzLq1lMd+sTHnS43/LWxSyyeRaiQgF8Oz/euRtOQDIkIXC1I4lZb5A==
X-Received: by 2002:a17:902:d482:b0:19f:27fe:95c3 with SMTP id c2-20020a170902d48200b0019f27fe95c3mr8903964plg.41.1679808267235;
        Sat, 25 Mar 2023 22:24:27 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902704200b001a21cde3458sm3675111plt.90.2023.03.25.22.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 22:24:26 -0700 (PDT)
Date: Sat, 25 Mar 2023 22:24:20 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
Message-ID: <20230326052420.GA179105@sumitra.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
 <ZB63EVLK6/29UUi0@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB63EVLK6/29UUi0@kroah.com>

On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > inline function, to make the relevant types apparent in the
> > definition and to benefit from the type checking performed by
> > the compiler at call sites.
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> >  drivers/staging/greybus/pwm.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > index 3fda172239d2..88da1d796f13 100644
> > --- a/drivers/staging/greybus/pwm.c
> > +++ b/drivers/staging/greybus/pwm.c
> > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> >  	struct pwm_chip		chip;
> >  	struct pwm_chip		*pwm;
> >  };
> > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > -	container_of(chip, struct gb_pwm_chip, chip)
> >  
> > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > +{
> > +	return container_of(chip, struct gb_pwm_chip, chip);
> > +}
> >  
> >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> >  {
> > -- 
> > 2.25.1
> > 
> > 
> 
> This patch didn't apply due to changes made in my tree by a patch from
> someone else before yours.  Can you rebase it and resend?
>

Hi greg,

I am confused, will that be a totally new patch or a new version(v4 in
this case)?

Regards,

Sumitra

> thanks,
> 
> greg k-h
