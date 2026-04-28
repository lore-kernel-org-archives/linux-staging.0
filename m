Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C443636A
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382291; cv=none; b=iLfEHAGJ1C3X1JJ3h1pjPJSH84gjNQpSReQQFBHfBw3MwxPAu9jOgFGVV06QA/eJycvwDF/GftEoB8cQyPRLh2WtqY+6s3mRGGbVampcwfAX7WpV+hp68PZKjwto2h6yT2oY9lso6gV0Yz2UrxJSBcUO6UWNrXz8kcCJKoETaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382291; c=relaxed/simple;
	bh=GoFtavOANxd5Dpn+DgtwGPY+eFF0TLHfLd0V79Lgprc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX29An9rGNaoXsYJZgmuvRfNqEjJe+Pkze5QLA9En8jJ3w8GQhp404xd15cEmSoirVbEuTFkaFZbld9rzrkSuea2bZG4LjxGzw5TtrH9QuXvvo8nMjQPH3AuRY/av0LdUcrPQ+jAZQNPFzfrpQu3x3azjTq6KcugOKLcznOT9po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bWnRkpnj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bWnRkpnj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so1498491866b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777382288; x=1777987088; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4nL+mhiBMlL1ot0sxxOKhc8UmtxQn3hHA96Y9Zj2WY=;
        b=bWnRkpnjNsTNbB6aaJUDj8wUAriWae9sRPkES7btdJSQrqtEtS6hOdoCK1Xf0VkkK1
         qW52PK8HilstwZR9fTuXnfxmEg0r6sAnCJb4Wg6bUJdHm6iArz4KcLzmCOKzI5zGzU9M
         x7eX8iam6xxsm5riD8eXOiiPoSdLPetWc1VJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382288; x=1777987088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4nL+mhiBMlL1ot0sxxOKhc8UmtxQn3hHA96Y9Zj2WY=;
        b=cw1zevH7VAFExmIXoGFXaYHR1hX51Xzq+yWaPiHXJ4VghbjBbVBaShGie9ESxrAiX6
         i/Cslrb6jPQh36CiG6MvALMyI8oWF0hEMW0sArGWBBqFQf4DF2bwk0uvmIgkmqYiILL5
         iDcC5yBYrkaHobNLbMhDzNV1ieVE3W9MMwwWd20HgfK7t8rpo8wAizXeuqEEEyU5KSfI
         fO2aXpa8s5Fjpy4C8xVrz5gP9syR5bUsigX7Iw7pUTrN8mC6X/adZDJxlEfv1mVIqP/x
         z8YQosMjs22PmhI2EE5KrQpkEwA665jcoOlsVFsphKhvox1n5D+pfGHq0qb0HCmYNo8H
         YnRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9JvXvSsw0r2dp/4EJyuMhNlN/J9ykc2wdiop7+nA2/hq8PMi5XXCIpmmuwF2De6INftE/KWOxtCsH410o@lists.linux.dev
X-Gm-Message-State: AOJu0YzBP7CxqnPGUegCxxnSGVZ/3QgsxQFfbKPQFag9axVueEIk49GG
	l5Lxf+6mSQz5TTO93A0dumD+8WkD9CYj88ahtDlk/ASxqxRdyzJrQ4bHSKYH7KBucj9/NswApTh
	1Qp5U/+aH
X-Gm-Gg: AeBDietHU4FIlwbnn5X0GjcLXwIovQUNBMAr1Qk5Y/ntiUxhNF0uBOBvzx6oX95qOn9
	ZNwuVq/qG1NjSQ5xGB3QiKdyp+II3jZgB+rQkRjfDePIjrZVxdEJ39/dd1O/4rKNUtbPpEuFM/d
	kd/Q+vpDZF/CmatH4/Zxll+/BR65slasaqF71rRfSAatasrSiAhbT0NDitAcKXhxl9CcBaKVKo2
	fkk2Tgtm0nda9321b6ktVX7h+XCIhlJ9PrFvM79yfdo7O1V4M18I7vuCJWee+gsH8v7Qdnjzwzc
	SR+/ptYGId8Rk2tWtOYJysvgCHW/qGI8IhVjXyy4W4MP/fyir/SZzm2BRBkZecf3v6E7upyl6tW
	IC+J4CrYc2V+0MnSkbWvd/kwZgcVjVmj9fn8xbOyRPtuxxv3YgWNKOgadduiy6YhP7/McdXgjlw
	1OYCOFqeKjSWh63Zqk/E2I+MCsx/F8hLO84XleVJEyB8b59opgnTFQBdl7w5osKHs4a+EUxAJXR
	1I4+n5ang==
X-Received: by 2002:a17:907:1c24:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-bb80404d59fmr173188466b.32.1777382286292;
        Tue, 28 Apr 2026 06:18:06 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808633631sm106553766b.13.2026.04.28.06.18.04
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:18:05 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so1498478566b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TAiHmjTDMVZN3lbrdH5WnS6PSXNMhhOelZctxkGt0DfOh6/rxdPPYxIiqzTaxQLZe/BZXTWdXnOXjYrsk@lists.linux.dev
X-Received: by 2002:a17:906:6a1e:b0:ba6:5855:1cc0 with SMTP id
 a640c23a62f3a-bb801dd37a4mr198922366b.2.1777382283839; Tue, 28 Apr 2026
 06:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-5-46890dffb611@chromium.org> <20260428131347.GB120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428131347.GB120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:17:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsEF9Q0RiPgqLEhJPK1JFQfxu7WrUCQ--7aFs6eyhT7=w@mail.gmail.com>
X-Gm-Features: AVHnY4IGFuF0TEsmvQhosYg2GkeMR-wYMqcIqC6FiaaAaRTptZOaCUuyEseN7nc
Message-ID: <CANiDSCsEF9Q0RiPgqLEhJPK1JFQfxu7WrUCQ--7aFs6eyhT7=w@mail.gmail.com>
Subject: Re: [PATCH 5/6] media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

HI Laurent

On Tue, 28 Apr 2026 at 15:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:11PM +0000, Ricardo Ribalda wrote:
> > If the driver's stripe information is invalid it can result in an integer
> > overflow. Add a range check with a WARN_ON to expose this kind of
> > error.
> >
> > This patch fixes the following smatch error:
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index 2c48d57a3180..6ed23c7a0c3f 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >               acc->stripe.bds_out_stripes[0].width =
> >                       ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
> >       } else {
> > +             u32 offset;
> > +
> >               /* Image processing is divided into two stripes */
> >               acc->stripe.bds_out_stripes[0].width =
> >                       acc->stripe.bds_out_stripes[1].width =
> > @@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
> >                       acc->stripe.bds_out_stripes[1].width += f;
> >               }
> >               /* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
> > -             acc->stripe.bds_out_stripes[1].offset =
> > -                     acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
> > +             if (WARN_ON(offset > 65535))
>
> If this can be triggered by userspace it shouldn't WARN_ON().

v2 will not have the WARN_ON.

Thanks!

>
> > +                     return -EINVAL;
> > +             acc->stripe.bds_out_stripes[1].offset = offset;
> >       }
> >
> >       acc->stripe.effective_stripes[0].height =
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
