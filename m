Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837D12AAED
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535128; cv=none; b=PqNSVSehXeMvn05dEJZqHJH5yMHWoViV5lRsqmmv0Rg3hDy9qnOF4mHA9I4sZzYHGGqJNVxiQMnC+v343tgKIXTPSR3gq13v0bPlQBxa1PAkjxngYYe8iNNonXjHKsH2/uNYzi/Z8tIkeuXW8K2zExRXG6ft5EKQScY5E8deNlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535128; c=relaxed/simple;
	bh=qO7d9bXSn3BpRZWmVkeQZf9EOhjNgjZIrcW5X5wvaEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFYiFiKIxMl6cGzMces6EZ1q/wk8IlM/8gv94SEM0Ew1U7Zzm9ez5WqdX3q76H5yUBvNI8UNm8O+TyxZu7plmHWoWToi8PKImqwU4Do6cREHctHH+Ep2qH/8az6z/1nxEPuD+Kir2GiF6xIrNKef2X6RdU4koT3yaquTvuG+WMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=H2YlduMd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="H2YlduMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713535120; x=1714139920; i=wahrenst@gmx.net;
	bh=uCpX7YiaUWC4f2VOMst96ZL0iGAqoCw8X1b8kxOldrE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H2YlduMdWBPL1r1XJnktkcpG6XJh4XIsiPhGUWQku87w3xjOKn766mu6qw70r7hU
	 rpSaLoTN3vNFuLeBclgXTzZ4izPEBdR4dPHtYhaKOvwFSU7ZtVlGXkGEMdRfgUlvp
	 DQmh0ZtOBdzO6Txhym05nVS+8ka5fjJhh7qWQ3MZs6QUb95lX0OrmSyijJjdHqrwe
	 x0YyrQRhoJ2TtSkDiLfk7Asma35G4zDEyIftubfRL+rKwXdvHF5n8/OvDVmhVKHTF
	 HATaOP9FlJay6TMZ3eLx6kfShdVAGZ13DTwJqqSWAiAFop0D6vFSECp0T7Y+D+bt5
	 RfP+RDpi0T2dbW5ANQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXBj-1rtduQ3T7Z-00DUqD; Fri, 19
 Apr 2024 15:58:39 +0200
Message-ID: <0decf8f9-ce59-47e5-9807-f36d7b65c469@gmx.net>
Date: Fri, 19 Apr 2024 15:58:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] staging: vc04_services: vchiq_arm: Split driver
 static and runtime data
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-3-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ClPe+F7dgQJM3JRz70EbO3Gkey8mtOZjh0d+Dcv1XHhd1xEPdF9
 nTaLegewZCGGncx87lnrsqvmsTNhGj5kJoJhj7NIGg0FPPX8gBqHqK6dqAdtp9uMBDfFjzO
 uq/SgsZPmzP78lY401/PLD9OAxo2+WQ2ldD9NSFLUfjXYNHK1Db5j6zc3sqq+IFxibFI3Sp
 Rhk5U2KmM8EyCOHtEivEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RrOkDx9T6Ew=;d6B7Jsy4BqfSp70zoh3cUyHByRx
 iH4Aq/DmqUwRG/dYA/DZE4g5FTgswBVqkYJ9QACPWgx/zMzSs5c1oWDdTl7mqBKGALMaKcAXy
 YN0w40xpIbuvTs+q+tI0GXK8VD+uuK8qhm6c/h3c66s7cRL9ycm9707GJkguG7O/9TpVRPAUh
 bY/83/vAw0uTIOsWWe/ZRHhl/Rt6tLKntlCeoVjNkmzGOVqmhA6gHpzstCjC+D7ntv6gqf4WP
 7KG0BqI7J0EItY9CZYzNxVKdndpl15Gv62IQsMcwwhf+lfPQ7AibrdPiGKZ8jyekyyElNtzr0
 Hkodyi3anQg8z1qDXvTZ15EDA/JycOCUewL23/qe/dvcOyYLS8dvxBYlHVHvnGvprpAHBdM47
 BJJUnnTMLmbsm7O1rO+Vrj3+ni1GaRLswMPRaO2WpHasfCebf8rK4pOVAJyl/Nwr5MLRcfRhu
 U9tT8dpE+qudH/ddUn6rJ1VzlotMJCA+q92N1jpq8jSxVpMrZhBU8KqQfiLXv2HqhV9Qm6fRo
 tBMyWUf4gJkOtyqhIm8kO5h8IEd+sIfb7uNDjaNU4MYgmZYu86h0oGdecdMJbtusa+OuFxpgF
 dilibY7VlVUhXh2lUUIlU/7y6e0lELSMQY/V3sitQSGbwui/DprGlOa8FqxdpuhKl3rZh3UQP
 lr06LeHdpC7NLgtr492l/GbI/KVkYY4ZBDc99zASbIY3SubHBBKBGCkmex2wXzGxjG0+33iyW
 hp8akIs70eDIKOSJVTxFA/KXEXO0AMHEqxQ3uAQAVti2+8CRTyuVOe54zDyL9ZmJuWVbw6rr2
 TWO2TZQ5ohl3auIjZPFRYdZuGQ+YUUTpsDUwGNic+0XZA=

Hi Umang,

Am 12.04.24 um 09:57 schrieb Umang Jain:
> vchiq_drvdata combines two types of book-keeping data. There is
> platform-specific static data (for e.g. cache lines size) and then
> data needed for book-keeping at runtime.
>
> Split the data into two structures: struct vchiq_platform_info and
> struct vchiq_drv_mgmt. The vchiq_drv_mgmt is allocated at runtime
> during probe and will be extended in subsequent patches to remove
> all global variables allocated.
>
> No functional changes intended in this patch.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 43 ++++++++++---------
>   1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index ad506016fc93..7cf38f8581fa 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -71,16 +71,11 @@ struct vchiq_state g_state;
>   static struct vchiq_device *bcm2835_audio;
>   static struct vchiq_device *bcm2835_camera;
>
> -struct vchiq_drvdata {
> -	const unsigned int cache_line_size;
> -	struct rpi_firmware *fw;
> -};
> -
> -static struct vchiq_drvdata bcm2835_drvdata =3D {
> +static const struct vchiq_platform_info bcm2835_info =3D {
>   	.cache_line_size =3D 32,
>   };
>
> -static struct vchiq_drvdata bcm2836_drvdata =3D {
> +static const struct vchiq_platform_info bcm2836_info =3D {
>   	.cache_line_size =3D 64,
>   };
>
> @@ -466,8 +461,8 @@ free_pagelist(struct vchiq_instance *instance, struc=
t vchiq_pagelist_info *pagel
>   static int vchiq_platform_init(struct platform_device *pdev, struct vc=
hiq_state *state)
>   {
>   	struct device *dev =3D &pdev->dev;
> -	struct vchiq_drvdata *drvdata =3D platform_get_drvdata(pdev);
> -	struct rpi_firmware *fw =3D drvdata->fw;
> +	struct vchiq_drv_mgmt *drv_mgmt =3D platform_get_drvdata(pdev);
> +	struct rpi_firmware *fw =3D drv_mgmt->fw;
i know this patch has been applied, but this patch doesn't compile
because the necessary structs are defined in the following patch. This
is bad because it's not bisectable :-(

Please always make sure that every single patch is able to compile.
