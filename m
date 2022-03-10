Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7F7A
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 03:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646881908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBwam6zmxJotVYnABBh/GlMSxj47srXl2RNNPbZVKXk=;
	b=SFS6cspfUzy0Yydswd+GNNM8Gs8zLqCbQO8xg4BBZ1XXuq0p0am/GxLCwpWxQz2bQAFW/r
	mTSvDk9g8ChN9mR9HVerNdowcZWTGuqQR69/qjHZKRrGcHBAsUGjPyRWtcWEsQxiuMP6oB
	mv48LM56rU5XfYoCmMaIbTe1/F4vz7Q=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-7ZyqGHsGNuKxcXF5JSttvw-1; Wed, 09 Mar 2022 22:11:45 -0500
X-MC-Unique: 7ZyqGHsGNuKxcXF5JSttvw-1
Received: by mail-lf1-f70.google.com with SMTP id z24-20020a056512371800b0043ea4caa07cso1378435lfr.17
        for <linux-staging@lists.linux.dev>; Wed, 09 Mar 2022 19:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBwam6zmxJotVYnABBh/GlMSxj47srXl2RNNPbZVKXk=;
        b=viGgvmZtGULwDvX+bEwYO6lo2qZamkhDhSaOxPm+STswVoskpO0i50+N9QoX/H8mc/
         WDZQQydD2XddY/t/H+CY7nwsBHS7AJ4iRqs/fr3FvFevH8WAaa3PwY81bdwG/B0Xui5J
         eE/joU8B8fuL1rpY/QPDFiNkDQYi+clnGibT3MRVLyIncxLKbPysZGee/oovG5bnbJbw
         gJNpgx9POPjHAGG0Ctxcb9f9DTxU6fS+GraezEA04TM/VrMjuMe8wLHErX0o9YwNcJfb
         DgNVb5LYmBXPuMNh0NfgFZ6YgtOQm6s/q5J5HhQ1BxjQyxuDRRRDwPzAeNRfQeH4AGt+
         FZJA==
X-Gm-Message-State: AOAM5322KCxG4SS5ke/LGZRvW/PS4iANAXuD8T2Xq+SGyMeYRC/MSrKS
	y9kwqmuf6lkTlTLMoei15pAH4xi3XaxtglCo4pggq4z6RzRkAz+0WwUibN7nFiOG//zSoZDTFzU
	MSsHSnOS1y1K050ZXmbFpfRbB5Ib2Eb/ww8jNk3LuFg==
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id h10-20020a2e900a000000b0024617bba771mr1639283ljg.363.1646881903919;
        Wed, 09 Mar 2022 19:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoT3uOxOvlsz3GBLPf25mDRpHrExnsy25c0F/5ulnxfNe8GQoNhvxaPmyZhmFmIHc5npbWPQRkvtXpNIR7AVM=
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id
 h10-20020a2e900a000000b0024617bba771mr1639271ljg.363.1646881903553; Wed, 09
 Mar 2022 19:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220309063456.102895-1-hpa@redhat.com> <Yija3YQ55gvCtKdR@paasikivi.fi.intel.com>
In-Reply-To: <Yija3YQ55gvCtKdR@paasikivi.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 10 Mar 2022 11:11:32 +0800
Message-ID: <CAEth8oHrvw9i4sS=cHUshubbhHSoLYkh5+QNhMPHqS+JkoiAPA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans De Goede <hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Thu, Mar 10, 2022 at 1:03 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the update.
>
> On Wed, Mar 09, 2022 at 02:34:56PM +0800, Kate Hsuan wrote:
> > For the AF configuration, if the rightmost stripe is used, the AF scene
> > will be at the incorrect location of the sensor.
> >
> > The AF coordinate may be set to the right part of the sensor. This
> > configuration would lead to x_start being greater than the
> > down_scaled_stripes offset and the leftmost stripe would be disabled
> > and only the rightmost stripe is used to control the AF coordinate. If
> > the x_start doesn't perform any adjustments, the AF coordinate will be
> > at the wrong place of the sensor since down_scaled_stripes offset
> > would be the new zero of the coordinate system.
> >
> > In this patch, if only the rightmost stripe is used, x_start should
> > minus down_scaled_stripes offset to maintain its correctness of AF
> > scene coordinate.
> >
> > Changes in v2:
> > 1. Remove the setting of the first stripe.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index d9e3c3785075..5a8c07f34756 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -2556,6 +2556,10 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >               /* Enable only for rightmost stripe, disable left */
> >               acc->af.stripes[0].grid_cfg.y_start &=
> >                       ~IPU3_UAPI_GRID_Y_START_EN;
> > +             acc->af.stripes[1].grid_cfg.x_start -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
> > +             acc->af.stripes[1].grid_cfg.x_end -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
>
> Could you calculate these the same way as in the case both stripes are
> enabled? Some bits in x_start is masked and then x_end is calculated from
> width.

Okay, I will do this in my v3 patch.

>
> >       } else if (acc->af.config.grid_cfg.x_end <=
> >                  acc->stripe.bds_out_stripes[0].width - min_overlap) {
> >               /* Enable only for leftmost stripe, disable right */
>
> --
> Regards,
>
> Sakari Ailus
>


-- 
BR,
Kate

