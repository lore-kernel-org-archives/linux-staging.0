Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CCD6E5E1
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710422172; cv=none; b=SYU3mgCkA8T0tUonm5DRDOuykqQuclzpcWL8mBEAKrHRHnLAoYHbIqQchCN0PYbphVjWuHX75K1kSE3MomQNFYuyhEb3L9y2nmsaaHWtI4dTxkA/uCvBbkkO0acAMM/jQQcqPPmUaZp2UXqQ6rQsH7SaKw0yv3AB+Hw8mVgy5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710422172; c=relaxed/simple;
	bh=wslxpvF6s6KqXH4RZn6BUhq5xoWXGTVySxE4ixU1VNQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=tgISxDj9ugBKGSQamFOEc4tP4xZnLvEvU0QyHq3jREAGCJYxS1RyEJMPWcEC8x4+nGwK0+xsjowGdQYOdmZCnwgVffw2xI2oQ0q1wMlzCwxyOWABXZ3uVAxRsmA3jZKk6AYti9+N533HMEMRRSPtdhIDBnjB7iddtqeakSL7fAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q+4/JDLl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q+4/JDLl"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 994BB55;
	Thu, 14 Mar 2024 14:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710422145;
	bh=wslxpvF6s6KqXH4RZn6BUhq5xoWXGTVySxE4ixU1VNQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q+4/JDLlnNoM6tRB9ijQdxZem4fIhLumSlfIznfBVQ4OB//6u4sFLJR1Xn1eNw2sn
	 zOrKjT7jRrxfi2RU3pi2irtLOCBLhpdH+4599ElUwljnPSLyxs2px866m/CoNxGXU+
	 adYwhte03TBdh2IkX5Azjq05BXzcdDTl/ra1ICJI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240314100607.336009-4-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-4-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 3/6] staging: vc04_services: Drop global members for tracking connections
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 14 Mar 2024 13:16:06 +0000
Message-ID: <171042216625.252503.4862753149878092236@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-14 10:06:04)
> Introduce a new struct vchiq_connected, responsible to track
> the connections to the vchiq platform driver. The struct is added
> as part of vchiq platform driver data (struct vchiq_drvdata).
>=20
> Drop global members for tracking vchiq driver connections in
> vchiq_connected.[ch] and use the struct vchiq_connected present
> in struct vchiq_drvdata.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
>  .../interface/vchiq_arm/vchiq_arm.h           |  3 ++
>  .../interface/vchiq_arm/vchiq_connected.c     | 33 +++++++++----------
>  .../interface/vchiq_arm/vchiq_connected.h     | 15 +++++++--
>  4 files changed, 33 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 52569517ba4e..8c7520dee5f4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -550,7 +550,7 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
>         dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad=
)\n",
>                 vchiq_slot_zero, &slot_phys);
> =20
> -       vchiq_call_connected_callbacks();
> +       vchiq_call_connected_callbacks(&drvdata->drv_connected);
> =20
>         return 0;
>  }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 7fef05e7389c..f2fd572df2b3 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -16,6 +16,7 @@
> =20
>  #include "vchiq_core.h"
>  #include "vchiq_debugfs.h"
> +#include "vchiq_connected.h"
> =20
>  /* Some per-instance constants */
>  #define MAX_COMPLETIONS 128
> @@ -31,6 +32,8 @@ enum USE_TYPE_E {
>  struct vchiq_drvdata {
>         const unsigned int cache_line_size;
>         struct rpi_firmware *fw;
> +
> +       struct vchiq_connected drv_connected;
>  };
> =20
>  struct user_service {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conn=
ected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected=
.c
> index 4604a2f4d2de..bc21910fe823 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -6,11 +6,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> =20
> -#define  MAX_CALLBACKS  10
> -
> -static   int                        g_connected;
> -static   int                        g_num_deferred_callbacks;
> -static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
>  static   DEFINE_MUTEX(g_connected_mutex);
> =20
>  /*
> @@ -19,23 +14,27 @@ static   DEFINE_MUTEX(g_connected_mutex);
>   * be made immediately, otherwise it will be deferred until
>   * vchiq_call_connected_callbacks is called.
>   */
> -void vchiq_add_connected_callback(struct vchiq_device *device, void (*ca=
llback)(void))
> +void vchiq_add_connected_callback(struct vchiq_device *device,
> +                                 void (*callback)(void),
> +                                 struct vchiq_connected *drv_connected)

I think I would have called this 'struct vchiq_connection *connection'
but it doesn't really matter, so don't rework unless there's a 'need'
for another iteration.



Aha though I see vchiq_connected matches the name of this c module, so
maybe that's just as/more suitable.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  {
> +       unsigned int index;
> +
>         if (mutex_lock_killable(&g_connected_mutex))
>                 return;
> =20
> -       if (g_connected) {
> +       if (drv_connected->connected) {
>                 /* We're already connected. Call the callback immediately=
. */
>                 callback();
>         } else {
> -               if (g_num_deferred_callbacks >=3D MAX_CALLBACKS) {
> +               if (drv_connected->num_deferred_callbacks >=3D VCHIQ_DRV_=
MAX_CALLBACKS) {
>                         dev_err(&device->dev,
>                                 "core: There already %d callback register=
ed - please increase MAX_CALLBACKS\n",
> -                               g_num_deferred_callbacks);
> +                               drv_connected->num_deferred_callbacks);
>                 } else {
> -                       g_deferred_callback[g_num_deferred_callbacks] =3D
> -                               callback;
> -                       g_num_deferred_callbacks++;
> +                       index =3D drv_connected->num_deferred_callbacks;
> +                       drv_connected->deferred_callback[index] =3D callb=
ack;
> +                       drv_connected->num_deferred_callbacks++;
>                 }
>         }
>         mutex_unlock(&g_connected_mutex);
> @@ -46,17 +45,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
>   * This function is called by the vchiq stack once it has been connected=
 to
>   * the videocore and clients can start to use the stack.
>   */
> -void vchiq_call_connected_callbacks(void)
> +void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connecte=
d)
>  {
>         int i;
> =20
>         if (mutex_lock_killable(&g_connected_mutex))
>                 return;
> =20
> -       for (i =3D 0; i <  g_num_deferred_callbacks; i++)
> -               g_deferred_callback[i]();
> +       for (i =3D 0; i < drv_connected->num_deferred_callbacks; i++)
> +               drv_connected->deferred_callback[i]();
> =20
> -       g_num_deferred_callbacks =3D 0;
> -       g_connected =3D 1;
> +       drv_connected->num_deferred_callbacks =3D 0;
> +       drv_connected->connected =3D true;
>         mutex_unlock(&g_connected_mutex);
>  }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conn=
ected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected=
.h
> index e4ed56446f8a..66e56b5af46e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> @@ -6,7 +6,18 @@
>  #ifndef VCHIQ_CONNECTED_H
>  #define VCHIQ_CONNECTED_H
> =20
> -void vchiq_add_connected_callback(struct vchiq_device *device, void (*ca=
llback)(void));
> -void vchiq_call_connected_callbacks(void);
> +#define  VCHIQ_DRV_MAX_CALLBACKS  10
> +
> +struct vchiq_connected {
> +       bool connected;
> +       int num_deferred_callbacks;
> +
> +       void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
> +};
> +
> +void vchiq_add_connected_callback(struct vchiq_device *device, void (*ca=
llback)(void),
> +                                 struct vchiq_connected *drv_connected);
> +void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connecte=
d);
> +
> =20
>  #endif /* VCHIQ_CONNECTED_H */
> --=20
> 2.43.0
>
