Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26D33291F
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883150; cv=none; b=PZ6LjeNgJkWuV0Fm4Mq99bCyayV0Z+w5dElEBiVI0G1M4jd8BgTnrpLoZMkEWRNRPmXwQASkRQb6ZbXe+9t8j8cdDi+SrUZN0Fdw1PqsJ6/mw79BsIZQC8Z9ebItkOi5SKtt3m9wTV5NtKFIt1DWttiMZzp0DlqKk9D9yF8SyCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883150; c=relaxed/simple;
	bh=G0HlUpP+L59SM/PgS9XrkbbqRt4wRveUjJziSIIppL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtbAEeEMk5dsN0HvCrJZ9mM2vPSI+aSPoNh86XDxOXCMDyMepjjsMS/etdp6sphZKsQ1MJfsZhimxomwqJIKFy2r9fQ4HoxKO43jvRn+yCl1YGl0Tw907SWqu/XasPfwJThl+IToL34B4eZIFegqZoXXfeTdOq0yk3I0L+8sk2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqvC9ScK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqvC9ScK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bc2a455fd55so61755866b.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777883143; x=1778487943; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9R8zXqHCtcGHTYvHcfHWaBjDK5mDDl8ovVVHVrbBYhw=;
        b=kqvC9ScK9snenRFs4Gd0AYETachazd8qAxhJqx1UkqYv8QCuovW+A8kICNEVlrdfBM
         bHjYb486doXm8ZFYxqlfgxeFuqJ4SwkVyDhMmFm1V2ItJmKQYr51XdZ+dLym3+YUXV8d
         zrZ1SntkyC55Fbdr2KdV6adWlGTv5LllcINTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777883143; x=1778487943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R8zXqHCtcGHTYvHcfHWaBjDK5mDDl8ovVVHVrbBYhw=;
        b=VEC1BFRGO8vYEn5JCgwPTyTe3M1k/RjS5Xm70dezA7cpMIzqag1tuV3P1IK3RpIgsa
         GBa3IJ7fA6efpEVesP2cdZ0Br6toNde2ZLaRCdvpxizvJmh7IcT704qDoq3Bt3scnfFz
         qz5AzqJgVmx0WTEQfGPNGYvl+z3R/pFyE/Bmur2RpftR9U2i+hphqLVblY+fgGycYGnp
         +73LdC8AY8f3cjYyg/kchGQ5hCYCjyMmmsl2lKv7s1mio4rImnOyYCcMfZ93ToDPVs0G
         qpD50eEnaxm4wLBPFeEY5l7hwmoTEHx+V8g84oO4HWzYSJosr/HuCBfiLaIj48X45UKu
         ShOg==
X-Forwarded-Encrypted: i=1; AFNElJ8U620Kvtrm/+E9ZODxFHvlFFXEx0keZTfZiAFP1P9pJNmgwFIiqaH/AA/5/yGguoOeGuTaiBZE+dCQg0/N@lists.linux.dev
X-Gm-Message-State: AOJu0YwSbdaYM3GuGzdeEK/sHWrhRdNnZSFTcSMk4TmoV1EhKsWsFbUT
	CsC2s2IskJNSHiQ7sfq6W6odiYkSEyHRLpMaU5SQsV2pP1eG4NHuWYezkHauCN0lZDv5xIH2csU
	JAZ2Ofkvn
X-Gm-Gg: AeBDieuwdFxgRO9zM6qou/VhqYfo8qbOJZvUILUspqpzKN39S4qiaxFKnv6x6JjcEc0
	8E7wJaOX+oIQk199BeCXa6LlThjSgaAABJntUs41muC5lAyr2I5RssSKRA0PZ6QB+/ZHCwYxQgG
	/hIzoFVhwo+E1pNmlRAaoCU7O53faH/HcBrgt9xWvmiHPfFvkESguVPtV796kJS852hAYh7UoYu
	nPb5qBpCFV6IwAIsnUPJkmXp74rjfRdXkY6RWzpqXJHknn3Uscu/P7EaQGpEZuzdbK7p19GAXmF
	K5c2HP4iPTwIFsaS8CxPI+orxwfhmXDZF9J6W0Ab24CKUiVma1se1ItHich/f+TX+lyPUteta8J
	t36uwkJY9hLgaKHc+OKbkmpbLrOOz0DsrEK6gui1HiqSIq7by8ioj0cIgYVJYanEc9EfEbFFee6
	9pUAioSv+C4XgBCyP2v76uYeoBk40kRLYa31iQYamMv8GpR5niQG3mIfeu6ET3Yn02yzvdqwU=
X-Received: by 2002:a17:907:c312:b0:bb8:fd89:4a30 with SMTP id a640c23a62f3a-bbffb95a912mr451393466b.31.1777883143212;
        Mon, 04 May 2026 01:25:43 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88470dacsm2880034a12.26.2026.05.04.01.25.42
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:25:42 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bc2a455fd55so61751366b.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 01:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/cGLgYRN5NnIOO+oJuVxC2RecVwKVObF/LHILWeh0AEH+g0mPAEiLSS5XOzFyFFXrTlROVTDhd1POlhG1N@lists.linux.dev
X-Received: by 2002:a17:907:d87:b0:bc1:a5cd:9a67 with SMTP id
 a640c23a62f3a-bc1a5cdb3efmr195866666b.34.1777883140796; Mon, 04 May 2026
 01:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org> <afhXQOcJn11-UGCq@kekkonen.localdomain>
In-Reply-To: <afhXQOcJn11-UGCq@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 4 May 2026 10:25:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCtmjKu2rcDCyCtZrnv4obvY5T49NUwDS7OTRRpn6NUEdQ@mail.gmail.com>
X-Gm-Features: AVHnY4ILmFd1TWdg3HI0oqY9t2ArMATGJOzQAzGapqrP0BhJPZ6QfuhOAXwot78
Message-ID: <CANiDSCtmjKu2rcDCyCtZrnv4obvY5T49NUwDS7OTRRpn6NUEdQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, 
	Yong Zhi <yong.zhi@intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for the review

On Mon, 4 May 2026 at 10:22, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 01, 2026 at 11:32:50AM +0000, Ricardo Ribalda wrote:
> > If the driver's stripe information is invalid it can result in an integer
> > overflow. Add a range check with a WARN_ON to expose this kind of
> > error.
>
> This would be an underflow, not overflow. There's also no longer a
> WARN_ON() here.
>
> I presume this might not be the only such issue in the driver.

I have updated the commit message in my local tree. Will repost in a
couple of days to allow more comments.

Regards!

>
> >
> > This patch fixes the following smatch error:
> > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index 2c48d57a3180..92cce31e35c5 100644
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
> > +             if (offset > 65535)
> > +                     return -EINVAL;
> > +             acc->stripe.bds_out_stripes[1].offset = offset;
> >       }
> >
> >       acc->stripe.effective_stripes[0].height =
> >
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
