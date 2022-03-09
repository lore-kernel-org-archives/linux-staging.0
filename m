Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91EA7A
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646803899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y27yK8mxYkUsBc+4/wjGD0QD87yh3tgDYSNNIdSemVA=;
	b=YNU5SXNMTOxpLa5hSYJJZvmrQs7Jc7WhCvZML0yvm0QgZZSc1qQzgAPDczELOboiloL52p
	75H76WFU4wGudMzVs31OkS9GKtIHTf1APix7bt/i79ZwoW18DJnPW8TpmVg0YXC+EUbYfn
	0LrP02YFbKGo8xneRhXEpqF/zK9Rtqo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-wp0xNwgRMf2vtyXS1B38bw-1; Wed, 09 Mar 2022 00:31:38 -0500
X-MC-Unique: wp0xNwgRMf2vtyXS1B38bw-1
Received: by mail-lf1-f72.google.com with SMTP id x12-20020a0565123f8c00b004482e097a3bso464883lfa.10
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 21:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y27yK8mxYkUsBc+4/wjGD0QD87yh3tgDYSNNIdSemVA=;
        b=SB1WguJqeVjycs+SErGs+XUlUQow5zqsqr5wLO+Cs2D9Fwa4XVCIPRPiQIkV10tsRS
         Obx7vIP0QUk2FTpkb15/g7Jjfv8EGWXj2FArIKpfpRIIxah5r540m55rkliNK5eArgMp
         uiA49OEA8WZk0GU8FA09caXvV1/BvJXl6s3f13jEU+6Dh8Ds+Q8qv2R5lq+DJfYh8FH3
         runwygcASkMfxtxtkk3jcCr2jNxPdhsAyZPW2ejPbzj0/H48JHy5Exz4Q8ZQiVQmTpbY
         P/A31UsMAxR8C/FzLi/xHu3+4rbufCbWL4deJm1QWWd+bUKauoJmXjkKsySd+PHTIuuP
         WhbQ==
X-Gm-Message-State: AOAM530XHk0lCAsYxQ8uKnCpjupez697aZEDn6BvIHsYpzrRBZ+4wM9h
	532k4xverHdqYqsM1PZsY7IVHKqr4vOYZ9ljyBlriKJU6lZs9DaD1ziuiHDQECNJs4YRLUMwo3g
	iW9xvHBZpppxYkpguT06lHQkBx1i103r6rPqCBlwkwg==
X-Received: by 2002:a05:651c:556:b0:247:eb02:8ab7 with SMTP id q22-20020a05651c055600b00247eb028ab7mr7047973ljp.104.1646803896696;
        Tue, 08 Mar 2022 21:31:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQKO23ep/IMvNlaSY3vPsiMpj83PyarnhIuUYSHQKCrTp0ItQmaJP9fhP/baoBeMzfcwWe7WHl/14CGWd+5Vs=
X-Received: by 2002:a05:651c:556:b0:247:eb02:8ab7 with SMTP id
 q22-20020a05651c055600b00247eb028ab7mr7047951ljp.104.1646803896248; Tue, 08
 Mar 2022 21:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220223090648.41989-1-hpa@redhat.com> <20220223090648.41989-2-hpa@redhat.com>
 <YiCF0Ze+mPxYQ2NP@paasikivi.fi.intel.com>
In-Reply-To: <YiCF0Ze+mPxYQ2NP@paasikivi.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 9 Mar 2022 13:31:25 +0800
Message-ID: <CAEth8oFk8qq2yogwKGN62qfF_53Z7PKX8JxTa6qjz53ZbXCLdw@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Thu, Mar 3, 2022 at 5:09 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thank you for the patch.
>
> On Wed, Feb 23, 2022 at 05:06:48PM +0800, Kate Hsuan wrote:
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
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index d9e3c3785075..efe4de8ef205 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -2556,6 +2556,14 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >               /* Enable only for rightmost stripe, disable left */
> >               acc->af.stripes[0].grid_cfg.y_start &=
> >                       ~IPU3_UAPI_GRID_Y_START_EN;
> > +             acc->af.stripes[0].grid_cfg.x_start -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
> > +             acc->af.stripes[0].grid_cfg.x_end -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
> > +             acc->af.stripes[1].grid_cfg.x_start -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
> > +             acc->af.stripes[1].grid_cfg.x_end -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
>
> The grid x/y ends are calculated from the width when both grids are enabled
> and I think it should work the same way here. There's also masking of the
> bits that aren't in use.

Thanks for clarifying this :)

>
> The first stripe isn't enabled so changing values there has no effect as
> far as I can tell.
>

Okay. I would remove the setting of the first stripe in the v2 patch.

Thank you

> Looking at the code a little, it seems all awb_fr, ae and af seem to suffer
> from the same issue. Let's still iron out the fix for af first before
> considering those.
>
> >       } else if (acc->af.config.grid_cfg.x_end <=
> >                  acc->stripe.bds_out_stripes[0].width - min_overlap) {
> >               /* Enable only for leftmost stripe, disable right */
> > @@ -2563,7 +2571,6 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >                       ~IPU3_UAPI_GRID_Y_START_EN;
> >       } else {
> >               /* Enable for both stripes */
> > -
> >               acc->af.stripes[0].grid_cfg.width =
> >                       (acc->stripe.bds_out_stripes[0].width - min_overlap -
> >                        acc->af.config.grid_cfg.x_start + 1) >>
>
> --
> Kind regards,
>
> Sakari Ailus
>


-- 
BR,
Kate

