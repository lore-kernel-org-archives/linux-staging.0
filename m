Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2433361
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686018888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EqFplNNFBMxsZKxu892+jTxiHF9dPVb6fkmSgk8CehA=;
	b=Yt2yadS+HBrabPPKjvyQqUUWG4V167wsJnhi/YtA001fwIRlOBaQR7Uyi33oeYDkUfCsG0
	HWkyarNUOGL05eclAnzLal7nldgQWs7Pyl5gGisPZknalYhN/yKaCygYkzpXF4IqlM9zNA
	CKdVOlFvrSPSTcRYJwR8QnNtMTd97zQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-0quJ-cr5MIyhjG2fBgSS5Q-1; Mon, 05 Jun 2023 22:34:47 -0400
X-MC-Unique: 0quJ-cr5MIyhjG2fBgSS5Q-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-65fd8267042so175844b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Jun 2023 19:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686018886; x=1688610886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqFplNNFBMxsZKxu892+jTxiHF9dPVb6fkmSgk8CehA=;
        b=ZdDrrSCrZkqCfW6ilLguzI/p0s+KIrqoTc0ul8EvZxAS48NVRRt6JnDyuSYZ+mU+F0
         fC8frRJl1kDszr68znacKNKuosd0+Y++YXBKgPHofJfZLIcrfW61dKD785DQFV3vW5bR
         T2iM4Swa+vUyVrEb85AERQPs4N2sfMXQzix+iGfixjZbizCee8H0uMw+WhMwmr5zFYUm
         Jor6A076O9R/JlCO0gxtNHUUswdA1O5Evqd4zXTIdgQBOLqpLZKlv2eNwzXwiG++OwtD
         nvLFJeaK+gX1TX3vAVdesdrtYVc+OwgNGEauidFZWeR6m+vTLVTy9VJerL7bTqlgUYe5
         pnHw==
X-Gm-Message-State: AC+VfDxmFxPgxPhNSnLaFSYfTtr5Ols2Pbm1K5HOaXc9m8MJgYckXR3b
	NGWjIZfUTfLd2UfJsq1lEHY6osfGat7aQrpnCEfSNkOT7JmA9ukKGACZBQbwO0iTAPkmpxkNA7R
	d7YshHW6tzAsMJqgf1fQb9p9A8zXZ6zkzdOAFCY+U2g==
X-Received: by 2002:a05:6a21:6802:b0:105:63b0:5bf8 with SMTP id wr2-20020a056a21680200b0010563b05bf8mr708004pzb.18.1686018886028;
        Mon, 05 Jun 2023 19:34:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70vj0IekeJpT5Kw/rfea8yu5XYFh2CjLR9mIU0apilTuyfi1QvY30+iwcAtpXRDh4bTV99Ne9SIFw0cnxnNss=
X-Received: by 2002:a05:6a21:6802:b0:105:63b0:5bf8 with SMTP id
 wr2-20020a056a21680200b0010563b05bf8mr707987pzb.18.1686018885581; Mon, 05 Jun
 2023 19:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230605102903.924283-1-hpa@redhat.com> <20230605102903.924283-3-hpa@redhat.com>
 <f9f3f779-36e6-4329-880d-12a6faa707c2@kadam.mountain>
In-Reply-To: <f9f3f779-36e6-4329-880d-12a6faa707c2@kadam.mountain>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 6 Jun 2023 10:34:34 +0800
Message-ID: <CAEth8oFNtW2+CP1m0gxGF3g=SN7UZ_c_7eNGj8W6ppoiVsm+Qg@mail.gmail.com>
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 5, 2023 at 7:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Jun 05, 2023 at 06:29:02PM +0800, Kate Hsuan wrote:
> > Pick up the necessary part of sp_group configuration for both model and
> > then copy those parts into a tempetory buffer. This buffer is finally
> > written to the ISP with correct length.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/driver=
s/staging/media/atomisp/pci/sh_css_params.c
> > index 588f2adab058..2913d9d6d226 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> > @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading=
_table(struct ia_css_stream
> >
> >  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
> >  {
> > +     u8 *write_buf;
> > +     u8 *buf_ptr;
> > +
> >       IA_CSS_ENTER_LEAVE_PRIVATE("void");
> > +
> > +     write_buf =3D kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
>
> Please add a check for allocation failure.
>
> regards,
> dan carpenter

Thank you for reviewing this.
I will fix it in the v2 patch.

>
>
> > +
> > +     buf_ptr =3D write_buf;
> > +     if (IS_ISP2401) {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
> > +             buf_ptr +=3D (sizeof(u8) * 5);
> > +             memset(buf_ptr, 0, 3);
> > +             buf_ptr +=3D 3; /* Padding 3 bytes for struct sh_css_sp_c=
onfig*/
> > +     } else {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp=
_group.config));
> > +             buf_ptr +=3D sizeof(sh_css_sp_group.config);
> > +     }
>


--=20
BR,
Kate

