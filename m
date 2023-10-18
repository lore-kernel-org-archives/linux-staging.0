Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10B8C1A;
	Wed, 18 Oct 2023 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccmHGYMa"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c6368a1a97so3739401a34.1;
        Wed, 18 Oct 2023 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697614155; x=1698218955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksPNYVytcS80tEZ2uamoelD7E5EV0yc39jKeE1i/iYQ=;
        b=ccmHGYMaYbR2IYKsUr9tVn7397NRqcjSbnaDmcoKlpn2hp7a0bEr3N3ly9f/Ycwg2G
         TrGGFQIZ5qA5XHpVU4oHXVBMn7NUOkP3netHdOeyCMNGVxrWlxCivV72x9Xe9O6zFiLk
         74v32o9IDaM0zKVWFwmUIHTpCDXZDZQxDp2CMGYGrFM65UQObedG348X3KmcAGOvHNBT
         k4NT28YRzEwFMQlQFNMYGn16trzGPztUe/UysO1V1HITX78YgnGFgCj53OaCUwEoYimi
         7EKYChk0hAPM0dP4KmEjk+7E/sdVwsDgNRgQd8YOEDZO/S7xxRBJ4FNVqpCOV+GltvjR
         WK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697614155; x=1698218955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksPNYVytcS80tEZ2uamoelD7E5EV0yc39jKeE1i/iYQ=;
        b=vpJxzue3CxAOS9QbFVLJADy7KJC/hJTDNA5s9rHej7fb2fcfQAyWnxexXvewP1Oce8
         ZDiOxYaoLbpxxfPpKHA2/6GsFUrAQ3DV4jFNtP9f0jFhwPUnrE/0bqwfkSuEyd6/5mTM
         qh87rrGfWWEVaB1dB4txTaL8EjAfJzVOlQysgiopVIwKtZyE1ZOgRpkCsjL4itJuMZyU
         gGd1Q45YLY+lBfRpv80hGWkSu8Id0cieY64BSih3zVdSjxIyTrS4/Fo+9gLNca8VwDaR
         flpHpx9AMHjbJy6QdeuGSeXOtD9ft3xNpi90dzjDwP9R6wOZQfAeP9MlxJftr8MGbKzN
         kE/Q==
X-Gm-Message-State: AOJu0Yyo0AVsMNVYl8nVoevREm8D6qL6oiV9ZG6KVmh1++zkOjL+z3gq
	6kquBGwkgS20hqe58ihhinrb/OakGv5A5R3BDs4=
X-Google-Smtp-Source: AGHT+IFHVHxV+JbWsAhJU+wbVTfLomv4nT6t+G4xMiGS/1evlgOOuzZbmuOwoJMoXPYMP+K+3zSwCkT9FEZvWTLFuFo=
X-Received: by 2002:a05:6830:1d58:b0:6b9:5735:d9dc with SMTP id
 p24-20020a0568301d5800b006b95735d9dcmr2121947oth.14.1697614155322; Wed, 18
 Oct 2023 00:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZS+HyqwvyVyfzGXs@lab-ubuntu> <cb55a015-4c2b-b72-dcd-af7f8c7380@inria.fr>
In-Reply-To: <cb55a015-4c2b-b72-dcd-af7f8c7380@inria.fr>
From: Calvince Otieno <calvncce@gmail.com>
Date: Wed, 18 Oct 2023 10:29:04 +0300
Message-ID: <CADFX3OQbXXaa1z+4-tOhidb2w_XH9sYB0x1_yLZ69yDy_1Nwpw@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: fix coding style - remove CamelCasing
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, 
	Manohar Vanga <manohar.vanga@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 10:27=E2=80=AFAM Julia Lawall <julia.lawall@inria.f=
r> wrote:
>
>
>
> On Wed, 18 Oct 2023, Calvince Otieno wrote:
>
> > This patch addresses coding style errors identified by checkpatch. The
> > changes include converting camel case names in constant variables to
> > UPPERCASE. These changes align with the coding style guidelines.
>
> Did someone suggest this?  It looks like the lowercase e might be related
> to something in the device documentation?
>
> julia
>
> >
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.h        | 12 ++--
> >  drivers/staging/vme_user/vme_fake.c   |  8 +--
> >  drivers/staging/vme_user/vme_tsi148.c | 88 +++++++++++++--------------
> >  3 files changed, 54 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/=
vme.h
> > index fbcbd0204453..0b40859fee23 100644
> > --- a/drivers/staging/vme_user/vme.h
> > +++ b/drivers/staging/vme_user/vme.h
> > @@ -33,13 +33,13 @@ enum vme_resource_type {
> >  #define VME_SCT              0x1
> >  #define VME_BLT              0x2
> >  #define VME_MBLT     0x4
> > -#define VME_2eVME    0x8
> > -#define VME_2eSST    0x10
> > -#define VME_2eSSTB   0x20
> > +#define VME_2EVME    0x8
> > +#define VME_2ESST    0x10
> > +#define VME_2ESSTB   0x20
> >
> > -#define VME_2eSST160 0x100
> > -#define VME_2eSST267 0x200
> > -#define VME_2eSST320 0x400
> > +#define VME_2ESST160 0x100
> > +#define VME_2ESST267 0x200
> > +#define VME_2ESST320 0x400
> >
> >  #define      VME_SUPER       0x1000
> >  #define      VME_USER        0x2000
> > diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_=
user/vme_fake.c
> > index ae802d6dda7e..0e02c194298d 100644
> > --- a/drivers/staging/vme_user/vme_fake.c
> > +++ b/drivers/staging/vme_user/vme_fake.c
> > @@ -1108,8 +1108,8 @@ static int __init fake_init(void)
> >               master_image->address_attr =3D VME_A16 | VME_A24 | VME_A3=
2 |
> >                       VME_A64;
> >               master_image->cycle_attr =3D VME_SCT | VME_BLT | VME_MBLT=
 |
> > -                     VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160=
 |
> > -                     VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USE=
R |
> > +                     VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160=
 |
> > +                     VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USE=
R |
> >                       VME_PROG | VME_DATA;
> >               master_image->width_attr =3D VME_D16 | VME_D32;
> >               memset(&master_image->bus_resource, 0,
> > @@ -1135,8 +1135,8 @@ static int __init fake_init(void)
> >                       VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
> >                       VME_USER3 | VME_USER4;
> >               slave_image->cycle_attr =3D VME_SCT | VME_BLT | VME_MBLT =
|
> > -                     VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160=
 |
> > -                     VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USE=
R |
> > +                     VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160=
 |
> > +                     VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USE=
R |
> >                       VME_PROG | VME_DATA;
> >               list_add_tail(&slave_image->list,
> >                             &fake_bridge->slave_resources);
> > diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vm=
e_user/vme_tsi148.c
> > index d549c22da534..859298aa1313 100644
> > --- a/drivers/staging/vme_user/vme_tsi148.c
> > +++ b/drivers/staging/vme_user/vme_tsi148.c
> > @@ -551,14 +551,14 @@ static int tsi148_slave_set(struct vme_slave_reso=
urce *image, int enabled,
> >
> >       /* Setup 2eSST speeds */
> >       temp_ctl &=3D ~TSI148_LCSR_ITAT_2eSSTM_M;
> > -     switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> > -     case VME_2eSST160:
> > +     switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> > +     case VME_2ESST160:
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eSSTM_160;
> >               break;
> > -     case VME_2eSST267:
> > +     case VME_2ESST267:
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eSSTM_267;
> >               break;
> > -     case VME_2eSST320:
> > +     case VME_2ESST320:
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eSSTM_320;
> >               break;
> >       }
> > @@ -569,11 +569,11 @@ static int tsi148_slave_set(struct vme_slave_reso=
urce *image, int enabled,
> >               temp_ctl |=3D TSI148_LCSR_ITAT_BLT;
> >       if (cycle & VME_MBLT)
> >               temp_ctl |=3D TSI148_LCSR_ITAT_MBLT;
> > -     if (cycle & VME_2eVME)
> > +     if (cycle & VME_2EVME)
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eVME;
> > -     if (cycle & VME_2eSST)
> > +     if (cycle & VME_2ESST)
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eSST;
> > -     if (cycle & VME_2eSSTB)
> > +     if (cycle & VME_2ESSTB)
> >               temp_ctl |=3D TSI148_LCSR_ITAT_2eSSTB;
> >
> >       /* Setup address space */
> > @@ -673,22 +673,22 @@ static int tsi148_slave_get(struct vme_slave_reso=
urce *image, int *enabled,
> >       *size =3D (unsigned long long)((vme_bound - *vme_base) + granular=
ity);
> >
> >       if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) =3D=3D TSI148_LCSR_ITAT_2eS=
STM_160)
> > -             *cycle |=3D VME_2eSST160;
> > +             *cycle |=3D VME_2ESST160;
> >       if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) =3D=3D TSI148_LCSR_ITAT_2eS=
STM_267)
> > -             *cycle |=3D VME_2eSST267;
> > +             *cycle |=3D VME_2ESST267;
> >       if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) =3D=3D TSI148_LCSR_ITAT_2eS=
STM_320)
> > -             *cycle |=3D VME_2eSST320;
> > +             *cycle |=3D VME_2ESST320;
> >
> >       if (ctl & TSI148_LCSR_ITAT_BLT)
> >               *cycle |=3D VME_BLT;
> >       if (ctl & TSI148_LCSR_ITAT_MBLT)
> >               *cycle |=3D VME_MBLT;
> >       if (ctl & TSI148_LCSR_ITAT_2eVME)
> > -             *cycle |=3D VME_2eVME;
> > +             *cycle |=3D VME_2EVME;
> >       if (ctl & TSI148_LCSR_ITAT_2eSST)
> > -             *cycle |=3D VME_2eSST;
> > +             *cycle |=3D VME_2ESST;
> >       if (ctl & TSI148_LCSR_ITAT_2eSSTB)
> > -             *cycle |=3D VME_2eSSTB;
> > +             *cycle |=3D VME_2ESSTB;
> >
> >       if (ctl & TSI148_LCSR_ITAT_SUPR)
> >               *cycle |=3D VME_SUPER;
> > @@ -895,14 +895,14 @@ static int tsi148_master_set(struct vme_master_re=
source *image, int enabled,
> >
> >       /* Setup 2eSST speeds */
> >       temp_ctl &=3D ~TSI148_LCSR_OTAT_2eSSTM_M;
> > -     switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> > -     case VME_2eSST160:
> > +     switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> > +     case VME_2ESST160:
> >               temp_ctl |=3D TSI148_LCSR_OTAT_2eSSTM_160;
> >               break;
> > -     case VME_2eSST267:
> > +     case VME_2ESST267:
> >               temp_ctl |=3D TSI148_LCSR_OTAT_2eSSTM_267;
> >               break;
> > -     case VME_2eSST320:
> > +     case VME_2ESST320:
> >               temp_ctl |=3D TSI148_LCSR_OTAT_2eSSTM_320;
> >               break;
> >       }
> > @@ -916,15 +916,15 @@ static int tsi148_master_set(struct vme_master_re=
source *image, int enabled,
> >               temp_ctl &=3D ~TSI148_LCSR_OTAT_TM_M;
> >               temp_ctl |=3D TSI148_LCSR_OTAT_TM_MBLT;
> >       }
> > -     if (cycle & VME_2eVME) {
> > +     if (cycle & VME_2EVME) {
> >               temp_ctl &=3D ~TSI148_LCSR_OTAT_TM_M;
> >               temp_ctl |=3D TSI148_LCSR_OTAT_TM_2eVME;
> >       }
> > -     if (cycle & VME_2eSST) {
> > +     if (cycle & VME_2ESST) {
> >               temp_ctl &=3D ~TSI148_LCSR_OTAT_TM_M;
> >               temp_ctl |=3D TSI148_LCSR_OTAT_TM_2eSST;
> >       }
> > -     if (cycle & VME_2eSSTB) {
> > +     if (cycle & VME_2ESSTB) {
> >               dev_warn(tsi148_bridge->parent, "Currently not setting Br=
oadcast Select Registers\n");
> >               temp_ctl &=3D ~TSI148_LCSR_OTAT_TM_M;
> >               temp_ctl |=3D TSI148_LCSR_OTAT_TM_2eSSTB;
> > @@ -1100,11 +1100,11 @@ static int __tsi148_master_get(struct vme_maste=
r_resource *image, int *enabled,
> >
> >       /* Setup 2eSST speeds */
> >       if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) =3D=3D TSI148_LCSR_OTAT_2eS=
STM_160)
> > -             *cycle |=3D VME_2eSST160;
> > +             *cycle |=3D VME_2ESST160;
> >       if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) =3D=3D TSI148_LCSR_OTAT_2eS=
STM_267)
> > -             *cycle |=3D VME_2eSST267;
> > +             *cycle |=3D VME_2ESST267;
> >       if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) =3D=3D TSI148_LCSR_OTAT_2eS=
STM_320)
> > -             *cycle |=3D VME_2eSST320;
> > +             *cycle |=3D VME_2ESST320;
> >
> >       /* Setup cycle types */
> >       if ((ctl & TSI148_LCSR_OTAT_TM_M) =3D=3D TSI148_LCSR_OTAT_TM_SCT)
> > @@ -1114,11 +1114,11 @@ static int __tsi148_master_get(struct vme_maste=
r_resource *image, int *enabled,
> >       if ((ctl & TSI148_LCSR_OTAT_TM_M) =3D=3D TSI148_LCSR_OTAT_TM_MBLT=
)
> >               *cycle |=3D VME_MBLT;
> >       if ((ctl & TSI148_LCSR_OTAT_TM_M) =3D=3D TSI148_LCSR_OTAT_TM_2eVM=
E)
> > -             *cycle |=3D VME_2eVME;
> > +             *cycle |=3D VME_2EVME;
> >       if ((ctl & TSI148_LCSR_OTAT_TM_M) =3D=3D TSI148_LCSR_OTAT_TM_2eSS=
T)
> > -             *cycle |=3D VME_2eSST;
> > +             *cycle |=3D VME_2ESST;
> >       if ((ctl & TSI148_LCSR_OTAT_TM_M) =3D=3D TSI148_LCSR_OTAT_TM_2eSS=
TB)
> > -             *cycle |=3D VME_2eSSTB;
> > +             *cycle |=3D VME_2ESSTB;
> >
> >       if (ctl & TSI148_LCSR_OTAT_SUP)
> >               *cycle |=3D VME_SUPER;
> > @@ -1406,14 +1406,14 @@ static int tsi148_dma_set_vme_src_attributes(st=
ruct device *dev, __be32 *attr,
> >       val =3D be32_to_cpu(*attr);
> >
> >       /* Setup 2eSST speeds */
> > -     switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> > -     case VME_2eSST160:
> > +     switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> > +     case VME_2ESST160:
> >               val |=3D TSI148_LCSR_DSAT_2eSSTM_160;
> >               break;
> > -     case VME_2eSST267:
> > +     case VME_2ESST267:
> >               val |=3D TSI148_LCSR_DSAT_2eSSTM_267;
> >               break;
> > -     case VME_2eSST320:
> > +     case VME_2ESST320:
> >               val |=3D TSI148_LCSR_DSAT_2eSSTM_320;
> >               break;
> >       }
> > @@ -1428,13 +1428,13 @@ static int tsi148_dma_set_vme_src_attributes(st=
ruct device *dev, __be32 *attr,
> >       if (cycle & VME_MBLT)
> >               val |=3D TSI148_LCSR_DSAT_TM_MBLT;
> >
> > -     if (cycle & VME_2eVME)
> > +     if (cycle & VME_2EVME)
> >               val |=3D TSI148_LCSR_DSAT_TM_2eVME;
> >
> > -     if (cycle & VME_2eSST)
> > +     if (cycle & VME_2ESST)
> >               val |=3D TSI148_LCSR_DSAT_TM_2eSST;
> >
> > -     if (cycle & VME_2eSSTB) {
> > +     if (cycle & VME_2ESSTB) {
> >               dev_err(dev, "Currently not setting Broadcast Select Regi=
sters\n");
> >               val |=3D TSI148_LCSR_DSAT_TM_2eSSTB;
> >       }
> > @@ -1504,14 +1504,14 @@ static int tsi148_dma_set_vme_dest_attributes(s=
truct device *dev, __be32 *attr,
> >       val =3D be32_to_cpu(*attr);
> >
> >       /* Setup 2eSST speeds */
> > -     switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> > -     case VME_2eSST160:
> > +     switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> > +     case VME_2ESST160:
> >               val |=3D TSI148_LCSR_DDAT_2eSSTM_160;
> >               break;
> > -     case VME_2eSST267:
> > +     case VME_2ESST267:
> >               val |=3D TSI148_LCSR_DDAT_2eSSTM_267;
> >               break;
> > -     case VME_2eSST320:
> > +     case VME_2ESST320:
> >               val |=3D TSI148_LCSR_DDAT_2eSSTM_320;
> >               break;
> >       }
> > @@ -1526,13 +1526,13 @@ static int tsi148_dma_set_vme_dest_attributes(s=
truct device *dev, __be32 *attr,
> >       if (cycle & VME_MBLT)
> >               val |=3D TSI148_LCSR_DDAT_TM_MBLT;
> >
> > -     if (cycle & VME_2eVME)
> > +     if (cycle & VME_2EVME)
> >               val |=3D TSI148_LCSR_DDAT_TM_2eVME;
> >
> > -     if (cycle & VME_2eSST)
> > +     if (cycle & VME_2ESST)
> >               val |=3D TSI148_LCSR_DDAT_TM_2eSST;
> >
> > -     if (cycle & VME_2eSSTB) {
> > +     if (cycle & VME_2ESSTB) {
> >               dev_err(dev, "Currently not setting Broadcast Select Regi=
sters\n");
> >               val |=3D TSI148_LCSR_DDAT_TM_2eSSTB;
> >       }
> > @@ -2359,8 +2359,8 @@ static int tsi148_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
> >                       VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
> >                       VME_USER3 | VME_USER4;
> >               master_image->cycle_attr =3D VME_SCT | VME_BLT | VME_MBLT=
 |
> > -                     VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160=
 |
> > -                     VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USE=
R |
> > +                     VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160=
 |
> > +                     VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USE=
R |
> >                       VME_PROG | VME_DATA;
> >               master_image->width_attr =3D VME_D16 | VME_D32;
> >               memset(&master_image->bus_resource, 0,
> > @@ -2384,8 +2384,8 @@ static int tsi148_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
> >               slave_image->address_attr =3D VME_A16 | VME_A24 | VME_A32=
 |
> >                       VME_A64;
> >               slave_image->cycle_attr =3D VME_SCT | VME_BLT | VME_MBLT =
|
> > -                     VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160=
 |
> > -                     VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USE=
R |
> > +                     VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160=
 |
> > +                     VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USE=
R |
> >                       VME_PROG | VME_DATA;
> >               list_add_tail(&slave_image->list,
> >                       &tsi148_bridge->slave_resources);
> > --
> > 2.34.1
> >
> >


As description states, checkpatch recommendation
--=20
Kind regards,
Calvince Otieno
