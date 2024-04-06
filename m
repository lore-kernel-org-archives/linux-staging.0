Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B220314
	for <linux-staging@lists.linux.dev>; Sat,  6 Apr 2024 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712394553; cv=none; b=Im7faGFgKsO8GdoXRyjK1f4cXqsuSUaEPoV+vhEv7CFumLF+2vNiTbwTv0XIPTxPbO4RETRvQfSWr/iRC9ZAcPluwYClSNBA5lyL1bRwJe+WCxIyJMujkWxqjrzJ+y6xO5dVJpct1L8B25GWZKNGRg3jyjEIMBUZ8Op9TN/afRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712394553; c=relaxed/simple;
	bh=MGHIGmfwFNSNcn0c/t4VWCQduJ8fZ/WlM/mf+rzhQII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFQSVrg6VNSVGC+j5OerYeSOiSUiW3Q8bzD7Vq3BflbeOS4NWbmK2c6CllDjjH5r9jYPUZwdIwQKmiRPzRJdMlM4behjyvK5MDqlvwZwpFvzd2PunHH9r02dcOd07cTtvg1AEEWJq3nOJp0ryugYYCCerrqKPntmpPidA8aVofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNh6TbYK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNh6TbYK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a51b008b3aeso97047966b.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Apr 2024 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712394550; x=1712999350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jsux2xNdM5INUuabTGtcNgAbopGLxo1c/2XpNOGaEWM=;
        b=KNh6TbYKwfK0BGHrE+u/sOrpS86rsBzvNvq0X7LIaE24ALPQ3HWYO+cdEuL+vOF6hq
         HBwnSlp9qc42RFgMVofHFonkaes9TfPLvBA/hakGMAqWVxGmsZJ8ujqWY2mBck4wCQ27
         h+l5/+P5HkODpHvBqso7lBVVkIqehJuh0LX+jP7Rkurk3gObz09Os4wVnp6LMPwu3nPg
         IicqUUDC/kJ4hgFffrGeqlWMMIFt7gZsfHWhf/zpBJFWpui0e6URB3C/5tB6BtXyU3tb
         1HbOMSZxT7KWgLDwl/mnJKLKkIxiHWjnIQ/0QQz0iQxplvg9dlNvXS09JziRGWB/lDcG
         Tipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712394550; x=1712999350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jsux2xNdM5INUuabTGtcNgAbopGLxo1c/2XpNOGaEWM=;
        b=bA8Bq5pz0ah580NXbC4A/ohcNIxoepmknHYXIAG0AsTpuNOkdChj5F6ze0WGhGmXbf
         o2+pQ5ze3Ks9iJWGmDpTjEnwhpQcsD5cmft1mHQ+IK8YE5Jr8RQuM4CP8e1qvZCSTF4t
         64KnH+sSFbCTms/k0+NjTmpAr+SJ/E5nhG3ml0xYDxj6D+PYDy7zGLaWG7E4pok+EfU6
         zF2IG+/lxIeb3LI9rMh6DxAlcVacJe4fr5X1fOsBGfEel1img2jsH+Yc8jza8ZONALLD
         IGCvfFQ5ybYH/0GKgmnR8anNza1PhdGeSqCL+P7/362+b9u4sVKUWuN0Dq+Dldx8Chl0
         8NKA==
X-Forwarded-Encrypted: i=1; AJvYcCU3jH2SDHzIlGUMx3OrrPO50LeDLwmTkMNjouu3NHOe6kBV1AEjzrAIKBrx7eXcz/L1rAGewObKO21wWz0kbyDA2tKFCtRRPTQczzmY5w==
X-Gm-Message-State: AOJu0YzkrluIWqzxI78/C3pECj08EAGF8foS4+wHnFNs2yFFk7r19moe
	KeAy3lCawrzib6p1ZQC/oYJhdrjtAJrduORPTrMUMgJX58qUJPeb78h0T+2tnPM=
X-Google-Smtp-Source: AGHT+IEePUKy6Exi4dt9+UbvFkTbfuWJlF40HE36cWG7zX6sCHC690fGxSptBYpyD+e0u3AVoM6UgA==
X-Received: by 2002:a17:906:2e98:b0:a4e:390f:c6ce with SMTP id o24-20020a1709062e9800b00a4e390fc6cemr2533620eji.65.1712394549323;
        Sat, 06 Apr 2024 02:09:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id he8-20020a1709073d8800b00a4e57805d79sm1785409ejc.181.2024.04.06.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 02:09:08 -0700 (PDT)
Date: Sat, 6 Apr 2024 12:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Cc: Alex Elder <elder@ieee.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
Message-ID: <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>

On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
> On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> > On 4/3/24 7:16 PM, Jackson Chui wrote:
> > > Reported by checkpatch:
> > > 
> > > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > > precedence issues
> > 
> > I agree with your argument about the way the macro should be
> > defined.  But perhaps these gcam_*() functions could just
> > be eliminated?
> > 
> > I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> > to gcam_info().  It would be a different patch, but maybe
> > you could do that instead?
> > 
> > 					-Alex
> > 
> > 
> > > 
> > > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > > model diagnostic macros. Issue found by checkpatch.
> > > 
> > > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > > ---
> > >   drivers/staging/greybus/camera.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > index a8173aa3a995..d82a2d2abdca 100644
> > > --- a/drivers/staging/greybus/camera.c
> > > +++ b/drivers/staging/greybus/camera.c
> > > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> > >   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> > >   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > >   					  int type, unsigned int flags,
> >
> 
> Thanks for the feedback, Alex!
> 
> I thought about refactoring it, but I feel it is worth keeping
> the macro around. It acts as an apdater between callers, who 
> have 'gcam' and want to log and what the dynamic debug macros 
> expect. Without it, the code gets pretty ugly.

Another idea would be to create a function:

struct device *gcam_dev(struct gb_camera *gcam)
{
	return &gcam->bundle->dev;
}

	dev_dbg(gcam_dev(gcam), "received metadata ...

(I don't know how to actually compile this code so I haven't tried it).

regards,
dan carpenter
