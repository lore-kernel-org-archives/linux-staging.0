Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664A2F5C
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647423233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0QoVJurl6KK3rlbhKndKVTVS4HCyEO8q4IyxNqkWMk=;
	b=WCfPnEYEHp4CElv2lzZVYHVUtBhOV3J7ogphB49NRTA55BWxmOwI8/3wj4xJMhdYOOfw5P
	vF5ZVgTR/SqhsChK8h84+Jb0qlcIQNMWAUm5GZge9CLMrpq/+7YvFnTbm++kVPShjM4wkF
	AZHj7Wr39gSxOuq4GJwvk7IUiF3/hDg=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-IFs52dB3NQCYOv9jhW8ZPg-1; Wed, 16 Mar 2022 05:33:51 -0400
X-MC-Unique: IFs52dB3NQCYOv9jhW8ZPg-1
Received: by mail-oi1-f197.google.com with SMTP id ay31-20020a056808301f00b002d06e828c00so1149530oib.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 02:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0QoVJurl6KK3rlbhKndKVTVS4HCyEO8q4IyxNqkWMk=;
        b=eOh1xtfmU0SjQBgrfXAPMr7OI0O58cEf5ya+3MVRjkn2H5dSrEstyPTrLLAHL/i0N1
         9sl5c9huC353bhQk3hoK2WxboOx1y7RyDuTRwE2Qj5pV29+TvHoVDsZjI5ZI9WmjycbU
         zL6BrleESj1o/+iyI1Ek3uhFHj6X9WY6JqQVBiHfjUYFQm/cu71l+FolfuL0ZJ7Nhb8C
         5YAY8P3AlbwflbOlzDe2DYW1t+LoY6oqL7beZKrF8ypt/30VMvPETfINMN9881KCT647
         bG5xY5vqWEhlRrX2wthF5e8jpBwTkYbehKnwh2nU/HKQQaKFzvsgNN25haBdluitpp7s
         vhig==
X-Gm-Message-State: AOAM531dExhHzprulgGe4kAXJApCac5YBCYzQxyjVdiIqGPsbFflUbSE
	OnXudPFG4qU8PgZe2M9XWkdKPW+XAcQrTAlQCdf0BTL1xe+UuFLTF6n8NUIbuHORfg1SbAzI/on
	9l9srcSzXYD3k2pxQlKZhEeLRRybbhZLImAjhODzXYg==
X-Received: by 2002:a05:6870:14c5:b0:da:ab41:3a78 with SMTP id l5-20020a05687014c500b000daab413a78mr3273467oab.23.1647423230816;
        Wed, 16 Mar 2022 02:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSH0VjypowhPYfTXaUbcR6ddqy3et+gJ4RZnTZUs3ieCNnMAY9fFRbvaHeehLpfn97TUxEhlwCZ7C2THapvzg=
X-Received: by 2002:a05:6870:14c5:b0:da:ab41:3a78 with SMTP id
 l5-20020a05687014c500b000daab413a78mr3273454oab.23.1647423230510; Wed, 16 Mar
 2022 02:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220314101523.129672-1-hpa@redhat.com> <YjGncJFYky69Fjmz@paasikivi.fi.intel.com>
In-Reply-To: <YjGncJFYky69Fjmz@paasikivi.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 16 Mar 2022 17:33:39 +0800
Message-ID: <CAEth8oGMyO6BJ6kPuXYYZ_bGmwq+AfGMrrcK38UxtnJs1NfjRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] staging: media: ipu3: Fix AF x_start position when
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

On Wed, Mar 16, 2022 at 5:02 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Mon, Mar 14, 2022 at 06:15:22PM +0800, Kate Hsuan wrote:
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
> Could you calculate the values the same way as for the two stripes case, as
> I've been asking since v1?

Sorry for my misunderstanding of the comments.
You mean x_end could be estimated by the width here and could use the
same way as for two stripes case to estimate this.
I'll correct this in my v4 patch. :)

Thank you.

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

