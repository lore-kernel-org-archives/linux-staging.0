Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772046FE1D
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710427886; cv=none; b=Ucd9mKEeR9Nw74sOhcjVkHA9f7PesszrLc5B8NIgrk3+thKL4T2pNx/qbyyL9rz72TDAxxwAHCqxjPRfEcl3emCeBghpzNyv6UKXmv17Ml+JCJMRTxrvOEh9g6iNJM3NyPm65PvLfl2uNVQULKr574NPcOOp4QY6DNZOdJ5AZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710427886; c=relaxed/simple;
	bh=1QsjR6TssCo7JVH2hHpfCzzd6L9KFw2K2Q4gruixDes=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sYjbaBt8AjxObFnxrXzZFpVvsvAdn9RBfBefUd4J34twzRRkSMh1ddGsowfcCCUnicGcJUCePUC+8Lpru4hu36Fx+5ttmOcxu0Y2YOt2CX87PJhNLDMy9uy0Vg7SpIz1gig16qb8NaJ8qB3RSpRzKgT8h3gEXWIq657IzS9LJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e1KOvj2w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e1KOvj2w"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D1AE6BE;
	Thu, 14 Mar 2024 15:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710427859;
	bh=1QsjR6TssCo7JVH2hHpfCzzd6L9KFw2K2Q4gruixDes=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=e1KOvj2wvo47vYdKKvEZkulTQTUMPe+XN6C1WTh8x/L9FOWBGGnLxoWv93TN/XL2o
	 hBK+svX6YctoNL/rBE1cO4Gxsaz0b6uYb1uF14KLEyB0Z/0+z52o5VOttQqh5+rFUU
	 AcSN2XJTPibZXvfNxLreoyI9kP+8kuVPFsgpXXCc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240314100607.336009-5-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 4/6] staging: vc04_services: vchiq_arm: Drop g_cache_line_size
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 14 Mar 2024 14:51:19 +0000
Message-ID: <171042787993.252503.4484493303920768949@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-14 10:06:05)
> The cache-line-size is cached in struct vchiq_drvdata.
> There is no need to cache this again via g_cache_line_size
> and use it. Instead use the value from vchiq_drvdata directly.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 50 +++++++++++--------
>  1 file changed, 30 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 8c7520dee5f4..282f83b335d4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -71,6 +71,16 @@ static struct vchiq_device *bcm2835_audio;
>  static struct vchiq_device *bcm2835_camera;
> =20
>  static struct vchiq_drvdata bcm2835_drvdata =3D {
> +       /* This value is the size of the L2 cache lines as understood by =
the

This file has a mix of A)
 /* bulk multiline
  * comments like this
  */


and B)
 /*
  * Bulk multiline
  * comments like this
  */

I'd probably use B) when moving this, but again, no point for a respin
just for that. Only if there's another revision. Or a patch on top to
normalise throughout if you felt like it, as this is only a move anyway.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +        * VPU firmware, which determines the required alignment of the
> +        * offsets/sizes in pagelists.
> +        *
> +        * Modern VPU firmware looks for a DT "cache-line-size" property =
in
> +        * the VCHIQ node and will overwrite it with the actual L2 cache =
size,
> +        * which the kernel must then respect.  That property was rejected
> +        * upstream, so we have to use the VPU firmware's compatibility v=
alue
> +        * of 32.
> +        */
>         .cache_line_size =3D 32,
>  };
> =20
> @@ -130,17 +140,6 @@ struct vchiq_pagelist_info {
>  };
> =20
>  static void __iomem *g_regs;
> -/* This value is the size of the L2 cache lines as understood by the
> - * VPU firmware, which determines the required alignment of the
> - * offsets/sizes in pagelists.
> - *
> - * Modern VPU firmware looks for a DT "cache-line-size" property in
> - * the VCHIQ node and will overwrite it with the actual L2 cache size,
> - * which the kernel must then respect.  That property was rejected
> - * upstream, so we have to use the VPU firmware's compatibility value
> - * of 32.
> - */
> -static unsigned int g_cache_line_size =3D 32;
>  static unsigned int g_fragments_size;
>  static char *g_fragments_base;
>  static char *g_free_fragments;
> @@ -211,6 +210,8 @@ static struct vchiq_pagelist_info *
>  create_pagelist(struct vchiq_instance *instance, char *buf, char __user =
*ubuf,
>                 size_t count, unsigned short type)
>  {
> +       struct platform_device *pdev;
> +       struct vchiq_drvdata *drvdata;
>         struct pagelist *pagelist;
>         struct vchiq_pagelist_info *pagelistinfo;
>         struct page **pages;
> @@ -225,6 +226,9 @@ create_pagelist(struct vchiq_instance *instance, char=
 *buf, char __user *ubuf,
>         if (count >=3D INT_MAX - PAGE_SIZE)
>                 return NULL;
> =20
> +       pdev =3D to_platform_device(instance->state->dev->parent);
> +       drvdata =3D platform_get_drvdata(pdev);
> +
>         if (buf)
>                 offset =3D (uintptr_t)buf & (PAGE_SIZE - 1);
>         else
> @@ -367,9 +371,9 @@ create_pagelist(struct vchiq_instance *instance, char=
 *buf, char __user *ubuf,
> =20
>         /* Partial cache lines (fragments) require special measures */
>         if ((type =3D=3D PAGELIST_READ) &&
> -           ((pagelist->offset & (g_cache_line_size - 1)) ||
> +           ((pagelist->offset & (drvdata->cache_line_size - 1)) ||
>             ((pagelist->offset + pagelist->length) &
> -           (g_cache_line_size - 1)))) {
> +           (drvdata->cache_line_size - 1)))) {
>                 char *fragments;
> =20
>                 if (down_interruptible(&g_free_fragments_sema)) {
> @@ -395,12 +399,19 @@ static void
>  free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_inf=
o *pagelistinfo,
>               int actual)
>  {
> +       struct platform_device *pdev;
> +       struct vchiq_drvdata *drvdata;
>         struct pagelist *pagelist =3D pagelistinfo->pagelist;
>         struct page **pages =3D pagelistinfo->pages;
>         unsigned int num_pages =3D pagelistinfo->num_pages;
> +       unsigned int cache_line_size;
> =20
>         dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pag=
elist, actual);
> =20
> +       pdev =3D to_platform_device(instance->state->dev->parent);
> +       drvdata =3D platform_get_drvdata(pdev);
> +       cache_line_size =3D drvdata->cache_line_size;
> +
>         /*
>          * NOTE: dma_unmap_sg must be called before the
>          * cpu can touch any of the data/pages.
> @@ -416,10 +427,10 @@ free_pagelist(struct vchiq_instance *instance, stru=
ct vchiq_pagelist_info *pagel
>                         g_fragments_size;
>                 int head_bytes, tail_bytes;
> =20
> -               head_bytes =3D (g_cache_line_size - pagelist->offset) &
> -                       (g_cache_line_size - 1);
> +               head_bytes =3D (cache_line_size - pagelist->offset) &
> +                       (cache_line_size - 1);
>                 tail_bytes =3D (pagelist->offset + actual) &
> -                       (g_cache_line_size - 1);
> +                       (cache_line_size - 1);
> =20
>                 if ((actual >=3D 0) && (head_bytes !=3D 0)) {
>                         if (head_bytes > actual)
> @@ -434,8 +445,8 @@ free_pagelist(struct vchiq_instance *instance, struct=
 vchiq_pagelist_info *pagel
>                     (tail_bytes !=3D 0))
>                         memcpy_to_page(pages[num_pages - 1],
>                                 (pagelist->offset + actual) &
> -                               (PAGE_SIZE - 1) & ~(g_cache_line_size - 1=
),
> -                               fragments + g_cache_line_size,
> +                               (PAGE_SIZE - 1) & ~(cache_line_size - 1),
> +                               fragments + cache_line_size,
>                                 tail_bytes);
> =20
>                 down(&g_free_fragments_mutex);
> @@ -478,8 +489,7 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
>         if (err < 0)
>                 return err;
> =20
> -       g_cache_line_size =3D drvdata->cache_line_size;
> -       g_fragments_size =3D 2 * g_cache_line_size;
> +       g_fragments_size =3D 2 * drvdata->cache_line_size;
> =20
>         /* Allocate space for the channels in coherent memory */
>         slot_mem_size =3D PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
> --=20
> 2.43.0
>
