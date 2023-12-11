Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A851CF91;
	Mon, 11 Dec 2023 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PELCO2Rw"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db548cd1c45so4214054276.2;
        Mon, 11 Dec 2023 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702312649; x=1702917449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O48C/CJEj4wZSfp3763oo3jCjp+8dc3hHNx68ntAz6g=;
        b=PELCO2RwITM8A22XKUpvJ+jRTAQjbhUVYNEm64QcIJy/SL/5IHKd/SbnGhwCocM6sJ
         dPoi4EkOCPKLJmicD+Hp4DuuGzjRTyzt6XJ8uSno1MIlq+OI2bSsIjzrEN5eI0Hx7rd0
         zna9qiUp3A1jtxuNPqE0rcGCnFwQ82y6B9T7Ek9l06fvSu0hLxH7e+F6bDvrueiGDsKy
         dhlmVxIe8RF1EGrSDCuGOS1USXm7P7pIFPebtXS8HOKT8oTIiRxQDQeOOMAovO84Zaum
         Wp3mIFOEQJEY0Rk8aAzjeHWBouftGhUirZw5+GikWmLHu7iodMwQc+rHHC8NwkwDV1gG
         EhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312649; x=1702917449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O48C/CJEj4wZSfp3763oo3jCjp+8dc3hHNx68ntAz6g=;
        b=nRO9suUDVf3/oE8v5n+KgE4BD6iETS8FsER6/JZPJFPc6+tz28+gQW6hjhu1pbmu1l
         isa0gkA1b4nwHcm+RTeChJIdJ5ZTmbc6oIlHckODdb81Gn8A8IxoyzkdVliDEmqhqyV/
         IwCTlbribG8ieTbSB2MxAqnU6rGmRmDXtLtifDUIe0jJ384ziyPHTxPzWd1et5vxKZuz
         iZC5j90tJsJdk8aUWg5NArvc6i3Mq0Llll8U2fZQaLLQOPZhK5JlOkvOJU3RxbKTIH3r
         QYglRheL23OxX23g3ZFwJR/W3jIQXNPhsC7XLm8VFpQUPNv8/AK+JzHUEZ+UDzKnpEDC
         lpQw==
X-Gm-Message-State: AOJu0Yx/PJy4DnLpjCIf6YRTioY2yFJNTzrYMbab15RInV+Kch6SAcgS
	iRxSSMVFoz/FlW7qZ62gMg4FFliYT/2XUWA/YEU=
X-Google-Smtp-Source: AGHT+IHsWOfhNhkuofOaAYc2UYyIkxsHju3N7BW8qPIaRgg3fnWoQDF/kzVyr8SDxt0NmDZv8bmumLbnqk6nJmdnXyA=
X-Received: by 2002:a05:6902:1ac2:b0:db7:dacf:2eff with SMTP id
 db2-20020a0569021ac200b00db7dacf2effmr3523938ybb.70.1702312649072; Mon, 11
 Dec 2023 08:37:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211155453.105409-1-piroyangg@gmail.com> <2023121133-mandatory-idealness-d454@gregkh>
 <CALaNatNpBJ6a-hv3MiV7NzuJ7wYLwHRCs3ppKM5O-UCvTSeiGg@mail.gmail.com>
In-Reply-To: <CALaNatNpBJ6a-hv3MiV7NzuJ7wYLwHRCs3ppKM5O-UCvTSeiGg@mail.gmail.com>
From: piro yang <piroyangg@gmail.com>
Date: Tue, 12 Dec 2023 00:37:16 +0800
Message-ID: <CALaNatM_2UKo5jS=9FWjCCrj0dA-01JDndc+Q2RF=1LTCbHfZQ@mail.gmail.com>
Subject: Re: [PATCH] staging:vme_user:fix the issue of using the wrong error code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Linux Outreachy <outreachy@lists.linux.dev>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

piro yang <piroyangg@gmail.com> =E4=BA=8E2023=E5=B9=B412=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=8C 00:13=E5=86=99=E9=81=93=EF=BC=9A
>
> Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2023=E5=B9=B412=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=BA=8C 00:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, Dec 11, 2023 at 11:54:53PM +0800, Piro Yang wrote:
> > > 1. the error code of ENOSYS indicates Invalid system call number,
> > >    but there is not system call
> > >
> > > 2. unified the logging error message, when slave_set func is NULL
> >
> > That is two different things, and as such, should be two different
> > changes, right?
> >
> > Yes, it's picky, but that's what the staging driver code is for, to get
> > comfortable doing kernel development changes properly.
> >
> > Also, are you sure this second change is correct:
>
>    yes, I'm sure .
>    the vme_slave_set function is diffierent
> /*****************************vme_slave_set***********************/
> int vme_slave_set(struct vme_resource *resource, int enabled,
>                   unsigned long long vme_base, unsigned long long size,
>                   dma_addr_t buf_base, u32 aspace, u32 cycle)
> {
>         ...
>         if (!bridge->slave_set) {
>                  dev_err(bridge->parent, "Function not supported\n");
>                 return -ENOSYS;
>         }
>
> /******************other functions like below: *******************/
> int vme_slave_get(struct vme_resource *resource, int *enabled,
>                   unsigned long long *vme_base, unsigned long long *size,
>                   dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
> {
>         ....
>         if (!bridge->slave_get) {
>                 dev_err(bridge->parent, "%s not supported\n", __func__);
>                 return -EINVAL;
>         }
>
> int vme_master_set(struct vme_resource *resource, int enabled,
>                    unsigned long long vme_base, unsigned long long size,
>                    u32 aspace, u32 cycle, u32 dwidth)
> {
>        ....
>         if (!bridge->master_set) {
>                 dev_warn(bridge->parent, "%s not supported\n", __func__);
>                 return -EINVAL;
>         }
>
> int vme_master_get(struct vme_resource *resource, int *enabled,
>                    unsigned long long *vme_base, unsigned long long *size=
,
>                    u32 *aspace, u32 *cycle, u32 *dwidth)
> {
>       ....
>         if (!bridge->master_get) {
>                 dev_warn(bridge->parent, "%s not supported\n", __func__);
>                 return -EINVAL;
>         }
>
> >
> > >
> > > Signed-off-by: Piro Yang <piroyangg@gmail.com>
> > > ---
> > >  drivers/staging/vme_user/vme.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_use=
r/vme.c
> > > index 5c416c31ec57..e9461a7a7ab8 100644
> > > --- a/drivers/staging/vme_user/vme.c
> > > +++ b/drivers/staging/vme_user/vme.c
> > > @@ -340,8 +340,8 @@ int vme_slave_set(struct vme_resource *resource, =
int enabled,
> > >       image =3D list_entry(resource->entry, struct vme_slave_resource=
, list);
> > >
> > >       if (!bridge->slave_set) {
> > > -             dev_err(bridge->parent, "Function not supported\n");
> > > -             return -ENOSYS;
> > > +             dev_err(bridge->parent, "%s not supported\n", __func__)=
;
> >
> > __func__ is not the same here as "Function", right?  "Function" is the
> > functionality of the thing that is attempted here, so replacing that
> > word with the function name seems odd to me, don't you think?
> >
    yes, __func__ is not the same here as "Function".
    but I think the logging error message format  shoud be unified
with other functions.
    like:  vme_slave_get(){
             .....
             if (!bridge->slave_get) {
                dev_err(bridge->parent, "%s not supported\n", __func__);


> > thanks,
> >
> > greg k-h
