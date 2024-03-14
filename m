Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA046FE11
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428081; cv=none; b=nC2tg5GHAcht8hePq3ezZmMpZE2+d4mibHtCepmEZiT4nexaqPsch9MXTeGBvgoEvy1poYie5r81GLxWNwtD+Mva08sELPus/IQWIZW09qXxG8T6LFRCNfiIKg5xImHnjj6+M+lxBa8AZ/Kvc4i+0uB/Z9klH7WeDFvDgGGib+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428081; c=relaxed/simple;
	bh=lSAUtpAbjSp7S3Vf7W4v7poH5q99Kgs5hoQ37DjITf4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qRQbeqlEw2HbxSyUzV2k/CPFoRHXNcFSj9ql9+0C6cBybFAesi752NKsZpyqgfLwiIFDEfnAiQPTwoka8DHKuGBqR4jKXGC5vOhzgQzwJHjRL5/TFqRbHbG6/AnqU7F9om471Ph4P0bZTDuV8rBclDvPYK2JDcxgs2aF6sFijuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DKjajoHu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DKjajoHu"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C149B6BE;
	Thu, 14 Mar 2024 15:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710428053;
	bh=lSAUtpAbjSp7S3Vf7W4v7poH5q99Kgs5hoQ37DjITf4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DKjajoHuPkivToiUKDQefeyEv8FxgpXl2dFG7AL9Ans0sy7IQ+h4Idp+dfQZY+rij
	 OMI38LcMu23On4f01xUR5ZCDMb/sgwM45B1bq/41WP9sHnmkVdZOF74i90ORcRbHLd
	 1Eh7lTB09LkZ+Ai+G7vBXslwT7NeoLrIB+QWXrJc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240314100607.336009-6-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-6-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 5/6] staging: vc04_services: Drop global variables tracking allocated pages
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 14 Mar 2024 14:54:34 +0000
Message-ID: <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-14 10:06:06)
> The variables tracking allocated pages fragments in vchiq_arm.c
> can be easily moved to struct vchiq_drvdata instead of being global.
> This helps us to drop the non-essential global variables in the vchiq
> interface.
>=20
> Drop the TODO item as well, as it is now totally addressed:
> > Get rid of all non essential global structures and create a proper per
>   device structure
>=20
> No functional changes intended in this patch.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/TODO  |  8 ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
>  .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
>  3 files changed, 30 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stagi=
ng/vc04_services/interface/TODO
> index 05eb5140d096..15f12b8f213e 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet tend=
s to go 3 or 4 levels of
>  indentation deep making it very unpleasant to read. This is specially re=
levant
>  in the character driver ioctl code and in the core thread functions.
> =20
> -* Get rid of all non essential global structures and create a proper per
> -device structure
> -
> -The first thing one generally sees in a probe function is a memory alloc=
ation
> -for all the device specific data. This structure is then passed all over=
 the
> -driver. This is good practice since it makes the driver work regardless =
of the
> -number of devices probed.
> -
>  * Clean up Sparse warnings from __user annotations. See
>  vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_=
waiter"
>  is never disclosed to userspace.
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 282f83b335d4..666ab73ce0d1 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
>  };
> =20
>  static void __iomem *g_regs;

What happens with this one ? Is it essential to be global? Can it be
part of the device? Who's mapping it? or unmapping?

If we're keeping it global, I'd add a comment...

> -static unsigned int g_fragments_size;
> -static char *g_fragments_base;
> -static char *g_free_fragments;
> -static struct semaphore g_free_fragments_sema;
> -
> -static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
> =20
>  static int
>  vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned i=
nt handle, void *data,
> @@ -376,20 +370,20 @@ create_pagelist(struct vchiq_instance *instance, ch=
ar *buf, char __user *ubuf,
>             (drvdata->cache_line_size - 1)))) {
>                 char *fragments;
> =20
> -               if (down_interruptible(&g_free_fragments_sema)) {
> +               if (down_interruptible(&drvdata->free_fragments_sema)) {
>                         cleanup_pagelistinfo(instance, pagelistinfo);
>                         return NULL;
>                 }
> =20
> -               WARN_ON(!g_free_fragments);
> +               WARN_ON(!drvdata->free_fragments);
> =20
> -               down(&g_free_fragments_mutex);
> -               fragments =3D g_free_fragments;
> +               down(&drvdata->free_fragments_mutex);
> +               fragments =3D drvdata->free_fragments;
>                 WARN_ON(!fragments);
> -               g_free_fragments =3D *(char **)g_free_fragments;
> -               up(&g_free_fragments_mutex);
> +               drvdata->free_fragments =3D *(char **)drvdata->free_fragm=
ents;
> +               up(&drvdata->free_fragments_mutex);
>                 pagelist->type =3D PAGELIST_READ_WITH_FRAGMENTS +
> -                       (fragments - g_fragments_base) / g_fragments_size;
> +                       (fragments - drvdata->fragments_base) / drvdata->=
fragments_size;
>         }
> =20
>         return pagelistinfo;
> @@ -421,10 +415,10 @@ free_pagelist(struct vchiq_instance *instance, stru=
ct vchiq_pagelist_info *pagel
>         pagelistinfo->scatterlist_mapped =3D 0;
> =20
>         /* Deal with any partial cache lines (fragments) */
> -       if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS && g_fragmen=
ts_base) {
> -               char *fragments =3D g_fragments_base +
> +       if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS && drvdata->=
fragments_base) {
> +               char *fragments =3D drvdata->fragments_base +
>                         (pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
> -                       g_fragments_size;
> +                       drvdata->fragments_size;
>                 int head_bytes, tail_bytes;
> =20
>                 head_bytes =3D (cache_line_size - pagelist->offset) &
> @@ -449,11 +443,11 @@ free_pagelist(struct vchiq_instance *instance, stru=
ct vchiq_pagelist_info *pagel
>                                 fragments + cache_line_size,
>                                 tail_bytes);
> =20
> -               down(&g_free_fragments_mutex);
> -               *(char **)fragments =3D g_free_fragments;
> -               g_free_fragments =3D fragments;
> -               up(&g_free_fragments_mutex);
> -               up(&g_free_fragments_sema);
> +               down(&drvdata->free_fragments_mutex);
> +               *(char **)fragments =3D drvdata->free_fragments;
> +               drvdata->free_fragments =3D fragments;
> +               up(&drvdata->free_fragments_mutex);
> +               up(&drvdata->free_fragments_sema);
>         }
> =20
>         /* Need to mark all the pages dirty. */
> @@ -489,11 +483,11 @@ static int vchiq_platform_init(struct platform_devi=
ce *pdev, struct vchiq_state
>         if (err < 0)
>                 return err;
> =20
> -       g_fragments_size =3D 2 * drvdata->cache_line_size;
> +       drvdata->fragments_size =3D 2 * drvdata->cache_line_size;
> =20
>         /* Allocate space for the channels in coherent memory */
>         slot_mem_size =3D PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
> -       frag_mem_size =3D PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
> +       frag_mem_size =3D PAGE_ALIGN(drvdata->fragments_size * MAX_FRAGME=
NTS);
> =20
>         slot_mem =3D dmam_alloc_coherent(dev, slot_mem_size + frag_mem_si=
ze,
>                                        &slot_phys, GFP_KERNEL);
> @@ -513,15 +507,16 @@ static int vchiq_platform_init(struct platform_devi=
ce *pdev, struct vchiq_state
>         vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX=
] =3D
>                 MAX_FRAGMENTS;
> =20
> -       g_fragments_base =3D (char *)slot_mem + slot_mem_size;
> +       drvdata->fragments_base =3D (char *)slot_mem + slot_mem_size;
> =20
> -       g_free_fragments =3D g_fragments_base;
> +       drvdata->free_fragments =3D drvdata->fragments_base;
>         for (i =3D 0; i < (MAX_FRAGMENTS - 1); i++) {
> -               *(char **)&g_fragments_base[i * g_fragments_size] =3D
> -                       &g_fragments_base[(i + 1) * g_fragments_size];
> +               *(char **)&drvdata->fragments_base[i * drvdata->fragments=
_size] =3D
> +                       &drvdata->fragments_base[(i + 1) * drvdata->fragm=
ents_size];
>         }
> -       *(char **)&g_fragments_base[i * g_fragments_size] =3D NULL;
> -       sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
> +       *(char **)&drvdata->fragments_base[i * drvdata->fragments_size] =
=3D NULL;
> +       sema_init(&drvdata->free_fragments_sema, MAX_FRAGMENTS);
> +       sema_init(&drvdata->free_fragments_mutex, 1);
> =20
>         err =3D vchiq_init_state(state, vchiq_slot_zero, dev);
>         if (err)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index f2fd572df2b3..d5c0a8e9fa2b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -34,6 +34,12 @@ struct vchiq_drvdata {
>         struct rpi_firmware *fw;
> =20
>         struct vchiq_connected drv_connected;
> +
> +       struct semaphore free_fragments_sema;
> +       struct semaphore free_fragments_mutex;
> +       char *fragments_base;
> +       char *free_fragments;
> +       unsigned int fragments_size;
>  };
> =20
>  struct user_service {
> --=20
> 2.43.0
>
