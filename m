Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E665A0F3
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421542; cv=none; b=FrGclqrUX4O209Ps6JcrbzRk3LKfCSEUx8XHXHnb3qGVB5hHmJq1NzHkrjJ7b1bDqyl6TgcUGuJUM4sKKz3zgv5Ug3r2bb6fwTc3d4QmUDfr7tVH3J39WixXuvmc6gB8S4L7JEveeqk9SajQo8tgDTRZEnAd49PXUw/n19w8PVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421542; c=relaxed/simple;
	bh=qMd34hzly7n/2xjSd/fQoAY6RqekctjlUI0wg4CK54s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DXfnNEZuZzGNKfayoNgU9kguttUowwuF5fqC7QN7eb7LcMLcoH2cu8s6CwaLT0ahYGQLo4MxOwUbveCVtrhSVYHqB+pi6uc5gvTUiIJEW6szrUkALfxa8cCAaCgy/J7CbPFby+P2+LIwdYlZCFMW/RMiNnljczrXSeQ9sb9HUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EgdWkP4f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EgdWkP4f"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D51F55;
	Thu, 14 Mar 2024 14:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710421515;
	bh=qMd34hzly7n/2xjSd/fQoAY6RqekctjlUI0wg4CK54s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EgdWkP4fXMXU22m9xlN5mbIjoMvVhoKG3PYRC48IHmYUMvDGbjcv0rVWLja9NXfU2
	 qgKXJ6CiF8C8ij+qDHmCUY2GvQo0bCZEW6tJ/ZctKbw0/UKXB9785Pe06pXK/HNxJ5
	 rTTitr3594fr8ulslZ6xvXWJ1j3ohpJe5BCIdwSA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240314100607.336009-3-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-3-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 2/6] staging: vc04_services: vchiq_arm: Move struct vchiq_drvdata to header
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 14 Mar 2024 13:05:35 +0000
Message-ID: <171042153535.252503.8952055283636870827@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-14 10:06:03)
> The vchiq_drvdata structure will be extended in subsequent patches,
> to track the vchiq connections (currently tracked by global members).
> to the vchiq platform driver. Hence, prepare the struct vchiq_drvdata
> by moving it to vchiq_arm.h, so it can be shared across.
>=20
> No functional changes intended in this patch.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 ------
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 8 ++++++++
>  2 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 1579bd4e5263..52569517ba4e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -29,7 +29,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/uaccess.h>
> -#include <soc/bcm2835/raspberrypi-firmware.h>
> =20
>  #include "vchiq_core.h"
>  #include "vchiq_ioctl.h"
> @@ -71,11 +70,6 @@ struct vchiq_state g_state;
>  static struct vchiq_device *bcm2835_audio;
>  static struct vchiq_device *bcm2835_camera;
> =20
> -struct vchiq_drvdata {
> -       const unsigned int cache_line_size;
> -       struct rpi_firmware *fw;
> -};
> -
>  static struct vchiq_drvdata bcm2835_drvdata =3D {
>         .cache_line_size =3D 32,
>  };
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 7844ef765a00..7fef05e7389c 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -11,6 +11,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/atomic.h>
> +
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
>  #include "vchiq_core.h"
>  #include "vchiq_debugfs.h"
> =20
> @@ -25,6 +28,11 @@ enum USE_TYPE_E {
>         USE_TYPE_VCHIQ
>  };
> =20
> +struct vchiq_drvdata {
> +       const unsigned int cache_line_size;
> +       struct rpi_firmware *fw;
> +};
> +
>  struct user_service {
>         struct vchiq_service *service;
>         void __user *userdata;
> --=20
> 2.43.0
>
