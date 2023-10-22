Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FE17C1
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVpU9l/V"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-581d4f9a2c5so1524192eaf.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697970894; x=1698575694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjUl3gjm9wun4bMsuXatFcM3GHed43NJOgGcnPw7fW4=;
        b=kVpU9l/VZJF4yfP6EcTTtgi75/B6YXnk1xg7ZEAtbhvDB2JM5cYRkrRzWbjuShGlug
         UJsuGYqsWUw05yQWf7db2lIqXewSJnqi5wJqlQgVCKZby6eHjBQ8ozALYRmmKA/gubRt
         2eqGBuCM9MSqJ515s+SUMhFrCZY0vyWbeCje37ou7ZKpV50GLrGnWo8nLZ2rbb/CDK7P
         tD1Id4ibKVqg1rJGraWCwIWypWv1ji+z+vCMAuMTsVALmfoeg+77MHKVMrSy04UnV/NO
         H9uI8C3sBPMxKh7ymCLJTMV1PTaMc7eMkuZ8eBgFVx9lx2Ws3hJzXOgns4b8tHGIdFuu
         Nb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697970894; x=1698575694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjUl3gjm9wun4bMsuXatFcM3GHed43NJOgGcnPw7fW4=;
        b=J0uzVbJ3EIXBAA0I89940EINQOsuTU3gqsKt9REQzNa79SKErHiSt89DCmAJDQ5P6s
         Ic630ikw+byqI9eD0iXwgLy1t/6E9wWEG5i68u/yeLs9wNdYu4qFQg3qC4H6CiQE/Sel
         Sa0RmdRY/L/1cgIL2IhcrLXnnVmIgRiVVr1MpraBNCaMX5xsQiIb+3WEhnpheDSYYPNR
         sUQQRkUxsmm2ZX35MEDHpaPNRS+jCB+ruku4S4TZa3DZKTLPPUInEioFdqB+A8X0Qfg6
         rKdj3JXxGh7tKTZHF9OAJ3xzr/QaXk/NuOsSz/YlZ9FCtqeGf6IluOS940/zud0qXR1M
         whOw==
X-Gm-Message-State: AOJu0YzPDVXA8OQavGkMgwA6IgAYspiptne2bd8DHxCqipCIs86a7Ll2
	lJt6LH716+tnSsjLnbTfzDs=
X-Google-Smtp-Source: AGHT+IHk2qRN03r/BAretK6kllYjBM69zB6LIN+acRJbHX9/tzqKUC5325pIl9VT6kCwuwiztIPckw==
X-Received: by 2002:a05:6871:3308:b0:1e9:b6aa:a629 with SMTP id nf8-20020a056871330800b001e9b6aaa629mr8700094oac.6.1697970894377;
        Sun, 22 Oct 2023 03:34:54 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709028c9700b001b5656b0bf9sm4228265plo.286.2023.10.22.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:34:54 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:34:49 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH] staging: greybus: avoid macro argument precedence issues
Message-ID: <20231022103449.GA6475@ubuntu>
References: <20231021214840.GA6557@ubuntu>
 <2023102210-undead-pucker-a1f2@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102210-undead-pucker-a1f2@gregkh>

On Sun, Oct 22, 2023 at 12:24:48PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 21, 2023 at 02:48:40PM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style, added parentheses around
> > macro argument 'gcam'.
> > CHECK: Macro argument 'gcam' may be better as '(gcam)' to
> > avoid precedence issues
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/camera.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..ae49e37a87e9 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> >  
> >  #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> >  
> > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > +#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
> > +#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
> > +#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
> 
> Sorry, but checkpatch is wrong here, this is not a problem at all.  Look
> at what you changed and think about if the macro argument could actually
> be anything other than a pointer.
> 
> thanks,
> 
> greg k-h

Thanks, I will check it out.

Regards,
Nandha Kumar
