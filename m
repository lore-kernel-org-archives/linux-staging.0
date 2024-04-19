Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003B112EBD4
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535478; cv=none; b=rceeS19eHNl7bs6mbY+wQ9zGd+z4i2/kwmgR5KhYc5vCZYyZYdmKi00/p8730CeO/5Yrj2h2L/ptHgNUyU3D+eYSPldK629JUW8q+bHm9k7DMqJr1QunUYspEbqmjzHfvBzXtQ+oJQ9RZtqFl6GD/KDfdhPN74zBEI/ZvvM3ebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535478; c=relaxed/simple;
	bh=vm7XPu21DHLm8z5hXG+rLruBE/77UHtrypM1DlRvJRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1lcwN/l8c/Xq20fWrmRC1mfb/qmVghWp3yq2YaxxMJ9kY+DsOyZUSaTP4Jb4k0KYEgJlguXIlIEvPq5E3HSC2Nmp4x1v6JUImTk9i8JPD1HurTWQl7xyAQuteuHDPoHEzhpsB4cvv8jz71ajr3MbFOneMohp2kIGXu6gwdRI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oXtm3Dav; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oXtm3Dav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713535468; x=1714140268; i=wahrenst@gmx.net;
	bh=8bgOXl9U+1Icxyw85HxXv5+W+i8k/gCXXz4lBpXWUqk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oXtm3Davp3ov22DecRPq9iuQeAjSXsItCMyE88iwUSNjogbiCWy3+HyqHQ8FekC7
	 +IvOEPqPybJgQnPDa5mbg9M+Btc9BhhmVTf1FRwyB/wspE+EvplU541q8HsJQJQOo
	 c/Z433a7BaINc8LN4JAOm3TVMYc76Sjz5JKRMKLS4LPI5zz53MnxF1lvnfe2kIy0B
	 xbJtzMT1RpRQJr1I6kvUHVYc8fgk2fxTY1uZSieYk2aDKa5pYpn24oQ8050RC9HgF
	 jG/+7OpT1hOl7PiMtzoDyWEJrOqASLUieICbto9F/yjVGoaErpgOfGD2X87Di82XM
	 wLF810Yl68TNCMhrUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1rsou62Tmk-00Dobd; Fri, 19
 Apr 2024 16:04:28 +0200
Message-ID: <837906bb-0e40-444a-803f-f5ed5d693c2f@gmx.net>
Date: Fri, 19 Apr 2024 16:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] staging: vc04_services: vchiq_arm: Drop
 g_cache_line_size
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-4-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-4-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bRmdyCYIVzy/CppacZ4vqsz5aIOhLHU7YpXHQt6Cc3iRQoXZ9MD
 QLMdNylqEGOkFiJtyipET/T7xpiBoPtyNmRUcaFUPlJuoQ+awBQCITzKPqh27FmovTI5rAN
 03Ay6sOqEPZFXRJpTqyUnzIsL6U7aS3cpHBSj66wGj8QJcB7aX2/e/aGHGZAUFBhIkZfdzY
 qT/frsAddUubGaTfHoiaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O8XwVKGYMZY=;w+VDcQYz0RarqxOrHtAwehUtdq6
 66jQNJQZl53LmCtF0+97HDEflIWmPp/OuRs4O3eBXD+gmYvbWsheL5Sf4sd9nWc477s1To8Pl
 G86V9qZOuWQn3GUslx+GwE/zblX/hTgCnyGLkw6EnxZJS3ITKpUfoik3emt/K0Av0V+sGT8bW
 IUo4R1pa7aU2Rx2IVFBOgATGnDD6jgOysWUdJqmG0vVeQx7rasAKS4L+NDrRvDwOcwYv3j7Ej
 qpj2LAGvofm9w5ej4BzPBsuruQWLE1mXEad5GQAsUGzQ+j1HIPM7JuWVE2v/7oIXgPlJ/N563
 TCQN1XgdaVuKq5gPMVkX9o9B7nRLiNp/SylAda8s5oWhwz9EgGyfXfTBBo3AnFL2Z/7TrC8ky
 6UrSRgt4YeHYPBTd0m2BRmMPTNG6Z5BoDKtk7KYsE4hEj07EzV+1BDl1BAHTW9SAC5bOjP56g
 OgL/e1S9Hj3bgNtqpW2YNVvLM9KqQoNoLAk2/94uRP8S5dxR7Y009CN4dng9Scw71wcGHufux
 cxPAWHSAk/DXGY/X9OKB1TXxMLGkE/TNm5K2i9U0yWCNH4/dXeqBs0Am1iWmGnIxBYMAISiF1
 5ZiKY3Np553V0abwAHIZNXfpFIBu0BZ1/Q+CqafhF/oWP5vOa5/1lnJ5G4vNsUgWynmR4CrPk
 d+EDopS9m26ypc7oY4DhBw3qa+CnLDxDa265n7bLBRHhzP8eoTW5yjJAx8D9rtUVmGxKdcxGI
 sL39+2pbCcZBbxBICeapAXlRCGoasu66xI4jl0aIetRNyRujmbNP6Fk3hnb/A0C4i3VngipH/
 u0gL2cJOc4apHytysXyhm14vJFCeGp5ua4MyGzE56iiwg=

Hi Umang,

Am 12.04.24 um 09:57 schrieb Umang Jain:
> The cache-line-size is cached in struct vchiq_platform_info.
> There is no need to cache this again via g_cache_line_size
> and use it. Instead use the value from vchiq_platform_info directly.
>
> While at it, move the comment about L2 cache line size in the kerneldoc
> block of struct vchiq_platform_info.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 34 ++++++++-----------
>   .../interface/vchiq_arm/vchiq_arm.h           | 11 ++++++
>   2 files changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 7cf38f8581fa..af74d7268717 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -131,17 +131,6 @@ struct vchiq_pagelist_info {
>   };
>
>   static void __iomem *g_regs;
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
>   static unsigned int g_fragments_size;
>   static char *g_fragments_base;
>   static char *g_free_fragments;
> @@ -212,6 +201,7 @@ static struct vchiq_pagelist_info *
>   create_pagelist(struct vchiq_instance *instance, char *buf, char __use=
r *ubuf,
>   		size_t count, unsigned short type)
>   {
> +	struct vchiq_drv_mgmt *drv_mgmt;
>   	struct pagelist *pagelist;
>   	struct vchiq_pagelist_info *pagelistinfo;
>   	struct page **pages;
> @@ -226,6 +216,8 @@ create_pagelist(struct vchiq_instance *instance, cha=
r *buf, char __user *ubuf,
>   	if (count >=3D INT_MAX - PAGE_SIZE)
>   		return NULL;
>
> +	drv_mgmt =3D dev_get_drvdata(instance->state->dev->parent);
this patch is wrong and cause a null pointer dereference:

[=C2=A0 232.297800] Unable to handle kernel NULL pointer dereference at
virtual address 00000004 when read
[=C2=A0 232.317576] [00000004] *pgd=3D02963831, *pte=3D00000000, *ppte=3D0=
0000000
[=C2=A0 232.334240] Internal error: Oops: 17 [#1] ARM
[=C2=A0 232.348423] Modules linked in: bcm2835_v4l2(C) videobuf2_vmalloc
videobuf2_memops bcm2835_mmal_vchiq(C) videobuf2_v4l2 videobuf2_common
snd_bcm2835(C) raspberrypi_hwmon bcm2835_rng rng_core vchiq(C) configfs
[=C2=A0 232.377176] CPU: 0 PID: 504 Comm: VCHIQ completio Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.9.0-rc2+ #1
[=C2=A0 232.395690] Hardware name: BCM2835
[=C2=A0 232.409044] PC is at vchiq_prepare_bulk_data+0x26c/0x528 [vchiq]
[=C2=A0 232.425441] LR is at vchiq_prepare_bulk_data+0x4ec/0x528 [vchiq]
[=C2=A0 232.441815] pc : [<bf0154f8>]=C2=A0=C2=A0=C2=A0 lr : [<bf015778>] =
psr: 60000013
[=C2=A0 232.458395] sp : ccc29d80=C2=A0 ip : 00000000=C2=A0 fp : c7c43000
[=C2=A0 232.473982] r10: bf022fc8=C2=A0 r9 : 43cd7000=C2=A0 r8 : c64a4000
[=C2=A0 232.489690] r7 : 00000001=C2=A0 r6 : 00000000=C2=A0 r5 : c7c43020=
=C2=A0 r4 : 43cd7000
[=C2=A0 232.506316] r3 : 00000000=C2=A0 r2 : 0000028c=C2=A0 r1 : c3cd7a80=
=C2=A0 r0 : 00000000
[=C2=A0 232.522865] Flags: nZCv=C2=A0 IRQs on=C2=A0 FIQs on=C2=A0 Mode SVC=
_32=C2=A0 ISA ARM
Segment none
[=C2=A0 232.540123] Control: 00c5387d=C2=A0 Table: 02828008=C2=A0 DAC: 000=
00051
[=C2=A0 232.556061] Register r0 information: NULL pointer
[=C2=A0 232.570951] Register r1 information: non-slab/vmalloc memory
[=C2=A0 232.586845] Register r2 information: non-paged memory
[=C2=A0 232.602036] Register r3 information: NULL pointer
[=C2=A0 232.616689] Register r4 information: non-paged memory
[=C2=A0 232.631750] Register r5 information: 0-page vmalloc region startin=
g
at 0xc7c00000 allocated at iotable_init+0x0/0xf8
[=C2=A0 232.652526] Register r6 information: NULL pointer
[=C2=A0 232.667439] Register r7 information: non-paged memory
[=C2=A0 232.682558] Register r8 information: slab kmalloc-4k start c64a400=
0
pointer offset 0 size 4096
[=C2=A0 232.701421] Register r9 information: non-paged memory
[=C2=A0 232.716545] Register r10 information: 4-page vmalloc region starti=
ng
at 0xbf021000 allocated at load_module+0x73c/0x16e0
[=C2=A0 232.737816] Register r11 information: 0-page vmalloc region starti=
ng
at 0xc7c00000 allocated at iotable_init+0x0/0xf8
[=C2=A0 232.758991] Register r12 information: NULL pointer
[=C2=A0 232.774079] Process VCHIQ completio (pid: 504, stack limit =3D 0xe=
510e83c)
[=C2=A0 232.791136] Stack: (0xccc29d80 to 0xccc2a000)
[=C2=A0 232.805806] 9d80: 00000000 00000000 00000036 00000000 00000001
00000001 c7c43008 00000001
[=C2=A0 232.824634] 9da0: c1d610e8 0002b28c 00000001 00000010 47c43000
10a55ba2 c2291744 c1d61000
[=C2=A0 232.843077] 9dc0: c1d610d4 00000000 00000000 00001002 00000000
c1d610e8 c1d61170 bf012bd8
[=C2=A0 232.861553] 9de0: 00000800 00000001 6c6b6a69 706f6e6d c8209748
ccc29e28 74737271 c236006c
[=C2=A0 232.880103] 9e00: 00000000 00000000 00000072 0002b28c 00000006
c64a4000 00000051 c2c9e580
[=C2=A0 232.898623] 9e20: ccc29e90 10a55ba2 00000000 c22b2dc0 c64a4000
c014c406 b6ceaca8 00000000
[=C2=A0 232.917119] 9e40: c2c9e580 00000036 c1d61000 bf0173a0 00000800
00001002 00000000 00000001
[=C2=A0 232.935668] 9e60: 00000002 c8200194 00000007 00000003 c1d61000
c64a4020 00000002 c2c9e580
[=C2=A0 232.954296] 9e80: 00000003 00000000 b6eaf22c 00001001 0000d001
0002b28c 00000800 00001002
[=C2=A0 232.973059] 9ea0: 00000000 c2643420 cbfc8160 c0112bec 00000000
c644fc18 cbfc8160 00000255
[=C2=A0 232.991818] 9ec0: 0b98b34f c0227c9c 00000001 c1c6d200 00000255
00001020 b6308000 ccc29fb0
[=C2=A0 233.010716] 9ee0: c1c6d204 c644fc18 00000cc0 10a55ba2 b6308000
c22b2dc0 c22dd600 b6ceaca8
[=C2=A0 233.029603] 9f00: c014c406 c2c9e580 00000003 00000036 b6eaf0d8
c026d4d0 c22b2dc0 c026de50
[=C2=A0 233.048517] 9f20: b6321000 ccc29fb0 00000817 b6308734 c2c9e580
c22dd601 00000255 c096a730
[=C2=A0 233.067479] 9f40: ccc29fb0 c096a730 00000000 ccc29f50 00000000
c010271c 40000000 ee08aa10
[=C2=A0 233.086503] 9f60: ccc29fb0 c010271c ccc29fb0 b6e9af40 c0102648
c2c9e580 00c5387d 10a55ba2
[=C2=A0 233.105615] 9f80: b6cead48 b6eaf130 b6ceaca8 c014c406 00000036
c01002c0 c2c9e580 00000036
[=C2=A0 233.124926] 9fa0: b6eaf0d8 c0100060 b6eaf130 b6ceaca8 00000003
c014c406 b6ceaca8 00000000
[=C2=A0 233.144213] 9fc0: b6eaf130 b6ceaca8 c014c406 00000036 00000800
00001002 0002b28c b6eaf0d8
[=C2=A0 233.163431] 9fe0: b6eaf060 b6ceac9c b6e9c0c8 b6dd353c 80000010
00000003 00000000 00000000
[=C2=A0 233.182630] Call trace:
[=C2=A0 233.182680]=C2=A0 vchiq_prepare_bulk_data [vchiq] from
vchiq_bulk_transfer+0x1e4/0x3d4 [vchiq]
[=C2=A0 233.215907]=C2=A0 vchiq_bulk_transfer [vchiq] from
vchiq_ioctl+0x1d4/0x1114 [vchiq]
[=C2=A0 233.234685]=C2=A0 vchiq_ioctl [vchiq] from vfs_ioctl+0x28/0x3c
[=C2=A0 233.251519]=C2=A0 vfs_ioctl from sys_ioctl+0xc4/0x928
[=C2=A0 233.267303]=C2=A0 sys_ioctl from ret_fast_syscall+0x0/0x54
[=C2=A0 233.283472] Exception stack(0xccc29fa8 to 0xccc29ff0)
[=C2=A0 233.299605] 9fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b6eaf130 b6ce=
aca8 00000003
c014c406 b6ceaca8 00000000
[=C2=A0 233.318897] 9fc0: b6eaf130 b6ceaca8 c014c406 00000036 00000800
00001002 0002b28c b6eaf0d8
[=C2=A0 233.338126] 9fe0: b6eaf060 b6ceac9c b6e9c0c8 b6dd353c
[=C2=A0 233.354204] Code: e3530001 1a000032 e59d300c e1db20b6 (e5933004)

Please always test your changes as documented in interface/TESTING

I will send a follow-up fix soon
