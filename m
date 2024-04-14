Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585133FD
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713091273; cv=none; b=JO648Dw3O2xFQTT3XoH/YVGJVvsJUAGegNXPENDsFeCdjt91tVRhQp6JVWplZMcu6rWUm8nFtFphuk4pQY5oboW51YxSwH3yelavD4OI6c5ZrobYRKlHz7Gu4X2VB9HE3fkyC6BgpCQorP5O17S0gYIGnngKyLD4GQPRP2mXHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713091273; c=relaxed/simple;
	bh=VaX9zW67X1ateZufT+ATBmIMlc1OojPbTFOrdOs57PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfd8i5fPRYIxE/GPuqdB3pQtkH/nvsc72tGJhWpC+yEWKnyvtuT5xFib5XcCgI5yQHNVb+a6WlyvtCK4NSTe05ENNYhnPrvZgLr8hUmxpGRdusHIUV0CpFEhJPe3VwgVP2AatbpS61cfLXrjPpOviuZwRB3YCvoxqdYDYpXBO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=RimPW0EA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RimPW0EA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713091264; x=1713696064; i=wahrenst@gmx.net;
	bh=Q9nUWbxUgUwofl0dM1emL9U4Gd7/8W8hg8bixFO1cGo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=RimPW0EA1chvFoycp1E+/rnSpDOCNjTmN0nQYZqb7SRzj0Us84CTs+CmOV6ibAwL
	 LlYhfKZQK/JqBluf2ghfONdoRmikVsZFQZgql6Q6hXMlVSUAFut/vE5LM7ocn1RDX
	 lhbsnEzU05RWmKJKlfdhOQj999UCBUP8T+85k4LCNJg3OlcU8yXc2I3j1LEfrjDwW
	 5kypqVmAtZzKQ6RlboShuA6yRl8AHUV7jE95N6Pj+dft7/XgRiBmeSQ0QMjQN05vi
	 +9r+4Igh7JHIxp3QdmXYVSfw0sNVNNPcCAK7Sy8t1A0L27qplAkEMs1xVQphqV02J
	 DGVzN2Vp1SH/8l60ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1sfFSV2axH-00yNPE; Sun, 14
 Apr 2024 12:41:04 +0200
Message-ID: <407ceb37-82f0-4eab-81ee-4df3f185618a@gmx.net>
Date: Sun, 14 Apr 2024 12:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] staging: vc04_services: Move variables for
 tracking connections
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-5-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-5-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:So7oczWLVZSGDD4XUG9Uvmwu7B1aL+/YaLPgMvO9sq/KBh8ir0L
 1nD7BzuF4yF8Z3FmInAlzNeJMNw8i3Wz5DvJuHkVdVBsBLtCo1YzUP8XUkr3mS2mnn4H6Bn
 /8g+Z0cqkBkfbkNh1424P4Fcb5GfLfgU+dFLCQ5yUI6/nplAtFdRe+SJAKFxGw1ngvP3pLx
 TVW8nt+R5srAvTndj1AJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1OzEI2MiapQ=;SWr2s4u9ENyNEA8G/YneFLLOtNJ
 7ZaTN6CquawsgdzDr49jhF8/UNilqnduL0RI7SEuT1Qn32WaddgoGJoiKoGVURNQIDNvvPWbk
 ELE+7NQ05TtlEpLv86o8ewbFa6eJs9Nxrsk1dDXcq8ACyoX97ouytJQi9v2qVKpRXpmfhEeZz
 xEc75TTtnPUp+PuSO/51SDhBSuJZNjSU8S2d5MBJYhuOkGQaHcpmI7hGySpbXeHJzap9qqHhq
 4WVg7rMRUI4B1IH9l7DiX5TBJkp8KnHolCSa7on6lrT8FqipZmmH8n0sEXg9ogSmuPhcanR00
 4lX4khVwH2AIaECGHWBSWz4Vm/thrfKnDdYAGr7GdW5+XaVffzPO1LhuooM8i+wqb43E3kq+P
 hPaaQT6Yvj9An8Zrx9KZq87CGarY4Ccyi8zCJ10U93JrjFr9NzFKFRVSpet7Ok2ue5HkvSijV
 Glorm9Ky2MsDEgZbhVU54ninh9wyaVPv4AOywDg5QeKwIFTPzp8x6pqY0RrHqFUEL1gyiIgi1
 6cidO8MDwoIQJmpcifjru50aNgT98zxMm6jZqk1Iyey0J8PLlArD/CsP8+U0RT+L5MdYR5vyW
 fumiqta+Owvze3nWpYRDVOnh39BD3t/h1fnyZahJm/oz/8PFh3+BoNWh8PaAJCvs7YFkHu+aN
 VKXs2Arj6rqGKx05sXOPcbfHvIgKoNTgf7zM9v30FtUa0U7ZolMrmapAdwwKCMave5zQQM5VN
 P3dmPoD9YphAZl/mIY9TaXqXlSZ3nzaiUVoqxog+9xmZ4qsE8NxW014M6k3l3gjpSqAG/lLKf
 1tOrig1FV7JwBU1GxPF+gOVfVZC6VGm9NbtdrH8678hrE=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> Connections to the vchiq driver are tracked using global variables.
> Drop those and introduce them as members of struct vchiq_drv_mgmt.
> Hence, struct vchiq_drv_mgmt will be used to track the connections.
>
> Also, store a vchiq_drv_mgmt pointer to struct vchiq_device to
> have easy access to struct vchiq_drv_mgmt across vchiq devices.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           |  3 +-
>   .../interface/vchiq_arm/vchiq_arm.h           |  9 +++++
>   .../interface/vchiq_arm/vchiq_bus.c           |  3 ++
>   .../interface/vchiq_arm/vchiq_bus.h           |  3 ++
>   .../interface/vchiq_arm/vchiq_connected.c     | 36 +++++++++----------
>   .../interface/vchiq_arm/vchiq_connected.h     |  4 ++-
>   6 files changed, 37 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index af74d7268717..ac12ed0784a4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -545,7 +545,8 @@ static int vchiq_platform_init(struct platform_devic=
e *pdev, struct vchiq_state
>   	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n"=
,
>   		vchiq_slot_zero, &slot_phys);
>
> -	vchiq_call_connected_callbacks();
> +	mutex_init(&drv_mgmt->connected_mutex);
> +	vchiq_call_connected_callbacks(drv_mgmt);
>
>   	return 0;
>   }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 04683d98cd00..b4ed50e4072d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -20,6 +20,8 @@
>   #define MAX_ELEMENTS 8
>   #define MSG_QUEUE_SIZE 128
>
> +#define VCHIQ_DRV_MAX_CALLBACKS 10
> +
>   struct rpi_firmware;
>
>   enum USE_TYPE_E {
> @@ -34,6 +36,13 @@ struct vchiq_platform_info {
>   struct vchiq_drv_mgmt {
>   	struct rpi_firmware *fw;
>   	const struct vchiq_platform_info *info;
> +
> +	bool connected;
> +	int num_deferred_callbacks;
> +	/* Protects connected and num_deferred_callbacks */
> +	struct mutex connected_mutex;
> +
> +	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
>   };
>
>   struct user_service {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> index 93609716df84..3f87b93c6537 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> @@ -11,6 +11,7 @@
>   #include <linux/slab.h>
>   #include <linux/string.h>
>
> +#include "vchiq_arm.h"
>   #include "vchiq_bus.h"
>
>   static int vchiq_bus_type_match(struct device *dev, struct device_driv=
er *drv)
> @@ -77,6 +78,8 @@ vchiq_device_register(struct device *parent, const cha=
r *name)
>   	device->dev.dma_mask =3D &device->dev.coherent_dma_mask;
>   	device->dev.release =3D vchiq_device_release;
>
> +	device->drv_mgmt =3D dev_get_drvdata(parent);
> +
>   	of_dma_configure(&device->dev, parent->of_node, true);
>
>   	ret =3D device_register(&device->dev);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> index 4db86e76edbd..9de179b39f85 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
> @@ -9,8 +9,11 @@
>   #include <linux/device.h>
>   #include <linux/mod_devicetable.h>
>
> +struct vchiq_drv_mgmt;
> +
>   struct vchiq_device {
>   	struct device dev;
> +	struct vchiq_drv_mgmt *drv_mgmt;
>   };
>
>   struct vchiq_driver {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_con=
nected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connect=
ed.c
> index 4604a2f4d2de..049b3f2d1bd4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.=
c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.=
c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>
> +#include "vchiq_arm.h"
>   #include "vchiq_connected.h"
>   #include "vchiq_core.h"
>   #include <linux/module.h>
> @@ -8,11 +9,6 @@
>
>   #define  MAX_CALLBACKS  10
I think with the introduction of VCHIQ_DRV_MAX_CALLBACKS this define
should be removed in this patch and not in patch 5. So you will avoid
two different things in patch 5.
