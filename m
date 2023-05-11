Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA01C774
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683803913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh7FfgfYAQZQJkeLx1lJ/e68IQ6SK/qzygHnfuKMTrg=;
	b=VZvXJ6mo0kJyLl7oraVY5iQPjntRsQIvpaZFmOp6VUq5yZ6lNVCTUCFP17882+keMU0455
	mOA+uOqFfmiz5ieyKyM5XtRB4wJZKU0OxWW+CNxqlEuH2Q6nK3guIU3xLE3iEVHhohyWuZ
	Bd9cImK7gkYKJzl9sfWjm5rOLIdRG88=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-VLU7XRWJNTCrtUFcX1E3qA-1; Thu, 11 May 2023 07:18:29 -0400
X-MC-Unique: VLU7XRWJNTCrtUFcX1E3qA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1ab0d11847eso85028595ad.0
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 04:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683803908; x=1686395908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh7FfgfYAQZQJkeLx1lJ/e68IQ6SK/qzygHnfuKMTrg=;
        b=g1HpCzDDnYJP2iOjEbkW4GgWletR2eLzwYmJcGjPnt9iBx0SY+aNFiQP9WkAfAoUQ6
         EuE2LFyrA9c9NMytr1pV4U7lpf4suJzDYV/Wuun1LK62SNloGBlmXpJZNHwOw6TiLu1j
         dpjsenaov4bdvFa9JmpJGsQKapKK+6F0wT2I8u1myUTmiEUjPhGelP5YsUddJ+RZgSmG
         F83rW1jWkJ1uAlHfqB1ZilGF4yAQWTKWZGaNz44I+GvAyv77mGdURI+DFKP2V3Z60wtd
         P8xzXSdmnqLCzHxsMWl+9cyvZdepRaQ7wJvq3F1xAHfSOuNJLe6JNLRZ6E40G0K0rEgO
         grYQ==
X-Gm-Message-State: AC+VfDxJMTNYHdr8QeMs7wde9R/l0gE6l+DAldzaccxpqRy+drV5AARF
	EyURe7lrfxvNHr3Z4MsyYQZbUXX/umi4Oo0bQrOZXO338xDoIcwB4HlmHMHn1wzdvhJBEe8p2jh
	smro3rXxo3rd0CGavGreHG/ejdFXRVHJITTSdUFOhAg==
X-Received: by 2002:a17:902:d48d:b0:1ac:8835:b89b with SMTP id c13-20020a170902d48d00b001ac8835b89bmr14381144plg.5.1683803908554;
        Thu, 11 May 2023 04:18:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ja4ir5O4k+WlQPJShFsjIJrccV/8GOpyGJzuT/1F6Ed6hKLMMCDA7G4j8JX/EryADiUyCHg1rsWFyHnnDxZg=
X-Received: by 2002:a17:902:d48d:b0:1ac:8835:b89b with SMTP id
 c13-20020a170902d48d00b001ac8835b89bmr14381119plg.5.1683803908160; Thu, 11
 May 2023 04:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230508062632.34537-1-hpa@redhat.com> <20230508062632.34537-5-hpa@redhat.com>
 <b718122b-7935-d0e2-4e1d-a09e0943a84b@redhat.com>
In-Reply-To: <b718122b-7935-d0e2-4e1d-a09e0943a84b@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 11 May 2023 19:18:16 +0800
Message-ID: <CAEth8oGtNoC2R6NPzbwyVuB2LCbWPnboqhaOFOoMRgsZw=ampg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] staging: media: atomisp: sh_css_mipi: Remove
 #ifdef 2041
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, May 11, 2023 at 2:34=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Kate,
>
> On 5/8/23 08:26, Kate Hsuan wrote:
> > The actions of ISP2401 and 2400 are determined at the runtime.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 65 ++++++-------------
> >  1 file changed, 20 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/=
staging/media/atomisp/pci/sh_css_mipi.c
> > index bc6e8598a776..52a1ed63e9a5 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -386,30 +381,22 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> >               return -EINVAL;
> >       }
> >
> > -#ifdef ISP2401
> > -     err =3D calculate_mipi_buff_size(&pipe->stream->config,
> > -                                    &my_css.mipi_frame_size[port]);
>
> Before you changes this code always run ISP2401, now it only runs
> when (ref_count_mipi_allocation[port] !=3D 0) is not true.
>
> So this statement should stay here in the code, just prefixed
> with a if (IS_ISP2401) condition.
>
> > -     /*
> > -      * 2401 system allows multiple streams to use same physical port.=
 This is not
> > -      * true for 2400 system. Currently 2401 uses MIPI buffers as a te=
mporary solution.
> > -      * TODO AM: Once that is changed (removed) this code should be re=
moved as well.
> > -      * In that case only 2400 related code should remain.
> > -      */
> > -     if (ref_count_mipi_allocation[port] !=3D 0) {
> > -             ref_count_mipi_allocation[port]++;
> > -             ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> > -                                 "allocate_mipi_frames(%p) leave: noth=
ing to do, already allocated for this port (port=3D%d).\n",
> > -                                 pipe, port);
> > -             return 0;
> > -     }
> > -#else
> >       if (ref_count_mipi_allocation[port] !=3D 0) {
> >               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> >                                   "allocate_mipi_frames(%p) exit: alrea=
dy allocated for this port (port=3D%d).\n",
> >                                   pipe, port);
> >               return 0;
> > +     } else {
> > +             /*
> > +              * 2401 system allows multiple streams to use same physic=
al port. This is not
> > +              * true for 2400 system. Currently 2401 uses MIPI buffers=
 as a temporary solution.
> > +              * TODO AM: Once that is changed (removed) this code shou=
ld be removed as well.
> > +              * In that case only 2400 related code should remain.
> > +              */
>
> This comment block actually belongs to the if (ref_count_mipi_allocation[=
port] !=3D 0)
> check, the code executed if that check passes was actually different betw=
een
> the ISP2400 and ISP2401 (my bad, sorry). The ISP2401 case did an extra:
>
>                 ref_count_mipi_allocation[port]++;
>
> when (ref_count_mipi_allocation[port] !=3D 0), so we need to add:
>
>                 if (IS_ISP2401)
>                         ref_count_mipi_allocation[port]++;
>
> above the return 0 above.
>
> > +             if (IS_ISP2401)
> > +                     err =3D calculate_mipi_buff_size(&pipe->stream->c=
onfig,
> > +                                                    &my_css.mipi_frame=
_size[port]);
>
> I have fixed this all up while merging your series and the new
> diff for this code-block now looks like this:
>
> @@ -386,9 +381,10 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>                 return -EINVAL;
>         }
>
> -#ifdef ISP2401
> -       err =3D calculate_mipi_buff_size(&pipe->stream->config,
> -                                      &my_css.mipi_frame_size[port]);
> +       if (IS_ISP2401)
> +               err =3D calculate_mipi_buff_size(&pipe->stream->config,
> +                                              &my_css.mipi_frame_size[po=
rt]);
> +
>         /*
>          * 2401 system allows multiple streams to use same physical port.=
 This is not
>          * true for 2400 system. Currently 2401 uses MIPI buffers as a te=
mporary solution.
> @@ -396,20 +392,14 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>          * In that case only 2400 related code should remain.
>          */
>         if (ref_count_mipi_allocation[port] !=3D 0) {
> -               ref_count_mipi_allocation[port]++;
> +               if (IS_ISP2401)
> +                       ref_count_mipi_allocation[port]++;
> +
>                 ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>                                     "allocate_mipi_frames(%p) leave: noth=
ing to do, already allocated for this port (port=3D%d).\n",
>                                     pipe, port);
>                 return 0;
>         }
> -#else
> -       if (ref_count_mipi_allocation[port] !=3D 0) {
> -               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> -                                   "allocate_mipi_frames(%p) exit: alrea=
dy allocated for this port (port=3D%d).\n",
> -                                   pipe, port);
> -               return 0;
> -       }
> -#endif
>
>         ref_count_mipi_allocation[port]++;
>
>
>
> Regards,
>
> Hans
>

It's my bad when trying to simplify the if expressions.
Thank you for fixing this. :)

--=20
BR,
Kate

