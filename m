Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93BA55884
	for <linux-staging@lists.linux.dev>; Sun,  9 Jun 2024 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717971871; cv=none; b=rUcpjFXZ/hl4zTGO5g6fSCVBZLCSYFdqTIcaP5CWVrmrMWfggBoVS7ObMsZQRwQjoaKcVdLE0fZpO69gRQ/nNd1PfOuFSc61AaZseM+WsPJG/DeUOvoIJq4pM5EQMVcfp70ECssuXGdRflss8muWOPqyfxwrfak1LpJ5CubauFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717971871; c=relaxed/simple;
	bh=CwlA2XWpylmghwW82kcJuuHVOtVeAgY64AJcXqvAtrU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AStZGvKCltzEIKpW5aEQGWTgljbPl6XZYo71mQ9kHM2mM7m9jgPAOVp6DUDn3nx0H1ybvBdsj1GIV3y2F7XbgAY3IyciFJ7rg1b9G7SRm7gMYjlf59/ZRSh4qjuG69/K6jjysPq4UiMfjYW+nXKcTh8HYU7VkJFqdQzjKcIARX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bHXXUw4C; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bHXXUw4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717971848; x=1718576648; i=wahrenst@gmx.net;
	bh=CwlA2XWpylmghwW82kcJuuHVOtVeAgY64AJcXqvAtrU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bHXXUw4Cc+Hoq9Buys5bRPujwwjJtbVOli7ACK84gl58ltCikF3JCadroD+Sdu0y
	 oey9gXNQsqgJizAPJALN1KscIJOApcpuJDaGveJTtMe07qEQLFbU7Ts+Cd5jOgxEa
	 lnwv91E+Q0A5yxzq3uCyYYlvVZ6ziYQMTCVwqIWcAh59UJc2Uk36VciMInA8wnmII
	 /hbIpsesQW4sHx6CkmebR0W9ggc3tFU/ZNRD3ajs7EIsKFgfwmsNB6F8WvFGE//nG
	 WyLeBOghy6RZTCyd6PUX57tO9g+eZyoyAkXBYkZcd2uauvB8Rw4r8dwcs2Lnl2YjT
	 bLXVOIx2DXzZxdV6xQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe9s-1s1fna0mVK-00TorN; Mon, 10
 Jun 2024 00:24:08 +0200
Message-ID: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
Date: Mon, 10 Jun 2024 00:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
From: Stefan Wahren <wahrenst@gmx.net>
Subject: WARNING:
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qNsRZmqGHH75DWNfgijucHO8ezT35SGbbSRMhjuhmxsPIoJwW8f
 rcKs90R3NfFU3niHoWmjoQIx5TiDWcsBLiPzuEYzCe1IUA84umzHJi2KYTLDP7ZLEFsqcON
 JAXNueIw93HWQDP9sbyiPM6L39waaDb9Hcsh3cVEEGZcfsx3n3v42rN6rUamsh5Y15wEYc8
 CwWLd/ycMRZ3EMGG1HFIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TbTv1iOZxWw=;Bi7nP9MiSrZOnsB5xv+RUT7Sioo
 YFcV/kpQP7sf/QSRpEeDZHKGfQ9ZoU4KV7JqzJrd2WwY0FY3WNbXhLUwunWPWLyf9bjUvzNx3
 bB2FVq5A1HPvPtwRO5aHDgrrrvKTR5OcuZbNrhvSxPHDXwsOh2UNzcFZvHXKnUB9Sv8q1bcml
 SQClmNAaPFNM3MNIokHcfe2FE3GzEm785X01OQdE7drxNyymbkA+hwpoPB7CVZ/UeVASXbBzT
 yTzgADb4TI92snP+byeDWkvYvGGxEQ79gaoxCYFJjBNdSfyTSeVJWvWi7d8SMjvLzVGJDYmrn
 nLMY9/9YtR0We3G76uAdTCalUzPsRawBRwMnkpiJIbxE2dhJGgyw5FkGuPGP8nZxHsrwUkmIV
 RlYw1RocI+fHsTUFn10UXGsFlXdaU3zzAfCRhoZOZmI6ArHVgOaBH+KmSxFuJ619C4j+WXbq0
 cynq1+NIsEdMDYOPEdwOhRD/em2Ww4NM34lQ6zrunuEDdAxYjzxGrHHP07X+Depatr98argKQ
 1LLlHu+7NnJ79fjBSTyTNvh6HTyhC+BYeH98Hwsp6P63rhIZfRlhOK4CK06C4m4hVuiMlCkOs
 IYQJJ17QC04CZ/nnN1LXkv+QKmxl0BEnQGISVt+uiJb1++hxf1xHNX1c5FvT1OEVVdpxVicsS
 AvYz0+siqBjAu1mu0nSa30LNFn7sK31fSocnJLHPG5OTkRKDk9DfgGNo2rJbj404dBpp95JlJ
 RJ9DVphkvRxkBldIfoDlP9X9hluEUqAJpFNFADx+nBKEWkOthlgQJmyDSzPKlDTVSjrg6YMrA
 xSf17OCrgoxVe2hpKXCVIuaeD7ftFTg0yFNqIxaZ8ZLJY=

Hi,
i was able to trigger a flood of WARNINGs with Raspberry Pi 3 B Plus (
arm64/defconfig + CONFIG_BCM2835_VCHIQ=3Dm + CONFIG_VCHIQ_CDEV=3Dy ) runni=
ng
the following userspace tool (triggers DMA transfer)

vchiq_test -f 1

The command seems to succeed as usual except of the warnings. But these
warnings are not reproducible with 32 bit configuration like
multi_v7_defconfig on the same Raspberry Pi 3 B Plus:

[=C2=A0=C2=A0 64.531826] WARNING: CPU: 3 PID: 867 at
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
vchiq_prepare_bulk_data+0x2cc/0x4e8 [vchiq]
[=C2=A0=C2=A0 64.531880] Modules linked in: aes_neon_blk af_alg 8021q garp=
 mrp stp
llc microchip raspberrypi_cpufreq brcmfmac_wcc snd_bcm2835(C) lan78xx
brcmfmac brcmutil vc4 cfg80211 hci_uart snd_soc_hdmi_codec btqca cec
btbcm onboard_usb_hub drm_display_helper bluetooth crct10dif_ce
drm_dma_helper raspberrypi_hwmon clk_raspberrypi drm_kms_helper
ecdh_generic bcm2835_thermal i2c_bcm2835 ecc pwm_bcm2835 rfkill vchiq(C)
drm fuse ip_tables x_tables ipv6
[=C2=A0=C2=A0 64.532010] CPU: 3 PID: 867 Comm: vchiq_test Tainted: G WC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
6.4.0-rc4-00297-gf999f38b4e6f #24
[=C2=A0=C2=A0 64.532022] Hardware name: Raspberry Pi 3 Model B Plus Rev 1.=
3 (DT)
[=C2=A0=C2=A0 64.532029] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -=
SSBS
BTYPE=3D--)
[=C2=A0=C2=A0 64.532038] pc : vchiq_prepare_bulk_data+0x2cc/0x4e8 [vchiq]
[=C2=A0=C2=A0 64.532060] lr : vchiq_prepare_bulk_data+0x320/0x4e8 [vchiq]
[=C2=A0=C2=A0 64.532080] sp : ffff8000093dbb10
[=C2=A0=C2=A0 64.532086] x29: ffff8000093dbb10 x28: 00000000000000a4 x27:
ffff80000b065000
[=C2=A0=C2=A0 64.532101] x26: ffff80000b065010 x25: ffff80000b065060 x24:
0000000000000000
[=C2=A0=C2=A0 64.532114] x23: 0000000000000001 x22: 0000000000000001 x21:
0000000000000001
[=C2=A0=C2=A0 64.532127] x20: ffff80000b065040 x19: 0000000000000002 x18:
0000000000000800
[=C2=A0=C2=A0 64.532139] x17: 001fffffffffffff x16: ffffdefad16fc6d0 x15:
ffff1449b720713c
[=C2=A0=C2=A0 64.532151] x14: 0000000000000000 x13: ffff1449b7207130 x12:
ffff1449b7207100
[=C2=A0=C2=A0 64.532163] x11: 0000000000000030 x10: 00000000000000ff x9 :
000000003f000000
[=C2=A0=C2=A0 64.532175] x8 : 00000000351ae800 x7 : 00000000351ae800 x6 :
00000000000000ff
[=C2=A0=C2=A0 64.532187] x5 : ffff1449b51ae801 x4 : ffff1449b9efc001 x3 :
0000000000000000
[=C2=A0=C2=A0 64.532201] x2 : 00000000f51ae800 x1 : fffffc5126e7bf02 x0 :
0000000000000001
[=C2=A0=C2=A0 64.532218] Call trace:
[=C2=A0=C2=A0 64.532222]=C2=A0 vchiq_prepare_bulk_data+0x2cc/0x4e8 [vchiq]
[=C2=A0=C2=A0 64.532247]=C2=A0 vchiq_bulk_transfer+0x25c/0x3bc [vchiq]
[=C2=A0=C2=A0 64.532272]=C2=A0 vchiq_irq_queue_bulk_tx_rx+0x6c/0x348 [vchi=
q]
[=C2=A0=C2=A0 64.532293]=C2=A0 vchiq_ioctl+0x684/0xbe8 [vchiq]
[=C2=A0=C2=A0 64.532313]=C2=A0 __arm64_sys_ioctl+0xa8/0xec
[=C2=A0=C2=A0 64.532327]=C2=A0 invoke_syscall+0x48/0x114
[=C2=A0=C2=A0 64.532341]=C2=A0 el0_svc_common.constprop.0+0x44/0xf4
[=C2=A0=C2=A0 64.532353]=C2=A0 do_el0_svc+0x3c/0xa8
[=C2=A0=C2=A0 64.532362]=C2=A0 el0_svc+0x2c/0x84
[=C2=A0=C2=A0 64.532379]=C2=A0 el0t_64_sync_handler+0xbc/0x138
[=C2=A0=C2=A0 64.532389]=C2=A0 el0t_64_sync+0x190/0x194
[=C2=A0=C2=A0 64.532400] ---[ end trace 0000000000000000 ]---

Since there are a lot of WARN_ON in the function, i applied the
following patch:

diff --git
a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb8f657cc78..2beeb94f629e 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -192,7 +192,7 @@ cleanup_pagelistinfo(struct vchiq_instance
*instance, struct vchiq_pagelist_info
 =C2=A0}

 =C2=A0static inline bool
-is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
+is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
 =C2=A0{
 =C2=A0=C2=A0=C2=A0=C2=A0 u32 tmp;

@@ -357,15 +357,19 @@ create_pagelist(struct vchiq_instance *instance,
char *buf, char __user *ubuf,
 =C2=A0=C2=A0=C2=A0=C2=A0 k =3D 0;
 =C2=A0=C2=A0=C2=A0=C2=A0 for_each_sg(scatterlist, sg, dma_buffers, i) {
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 u32 len =3D sg_dma_len(sg);
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 u32 addr =3D sg_dma_address(sg);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dma_addr_t addr =3D sg_dma_address(=
sg);

 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* Note: addrs is the address=
 + page_count - 1
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* The firmware expects =
blocks after the first to be page-
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* aligned and a multipl=
e of the page size
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0*/
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 WARN_ON(len =3D=3D 0);
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 WARN_ON(i && (i !=3D (dma_buffers -=
 1)) && (len & ~PAGE_MASK));
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 WARN_ON(i && (addr & ~PAGE_MASK));
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (len =3D=3D 0)
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: sg_dma_len() =3D=3D 0\n", __func__);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else if (i && (i !=3D (dma_buffers =
- 1)) && (len & ~PAGE_MASK))
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: following block not page aligned\n",
__func__);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else if (i && (addr & ~PAGE_MASK))
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: block %u, DMA address %pad doesn't align
with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
+
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (is_adjacent_block(addrs, =
addr, k))
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 addrs[k - =
1] +=3D ((len + PAGE_SIZE - 1) >> PAGE_SHIFT);
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
@@ -385,11 +389,15 @@ create_pagelist(struct vchiq_instance *instance,
char *buf, char __user *ubuf,
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return NUL=
L;
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }

-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 WARN_ON(!g_free_fragments);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!g_free_fragments)
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: !g_free_fragments\n", __func__);

 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 down(&g_free_fragments_mutex)=
;
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fragments =3D g_free_fragment=
s;
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 WARN_ON(!fragments);
+
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!fragments)
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn_once("%s=
: !fragments\n", __func__);
+
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 g_free_fragments =3D *(char *=
*)g_free_fragments;
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 up(&g_free_fragments_mutex);
 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pagelist->type =3D PAGELIST_R=
EAD_WITH_FRAGMENTS +

After that i'm getting the following warning:

 =C2=A0 create_pagelist: block 1, DMA address 0x00000000f5f62800 doesn't
align with PAGE_MASK 0xfffffffffffff000

Then i bisected the issue to this commit:

commit 1c1a429efd4ee8ca244cc2401365c983cda4ed76
Author: Catalin Marinas <catalin.marinas@arm.com>
Date:=C2=A0=C2=A0 Mon Jun 12 16:32:01 2023 +0100

 =C2=A0=C2=A0=C2=A0 arm64: enable ARCH_WANT_KMALLOC_DMA_BOUNCE for arm64

 =C2=A0=C2=A0=C2=A0 With the DMA bouncing of unaligned kmalloc() buffers n=
ow in place,
enable
 =C2=A0=C2=A0=C2=A0 it for arm64 to allow the kmalloc-{8,16,32,48,96} cach=
es.=C2=A0 In addition,
 =C2=A0=C2=A0=C2=A0 always create the swiotlb buffer even when the end of =
RAM is within the
 =C2=A0=C2=A0=C2=A0 32-bit physical address range (the swiotlb buffer can =
still be
disabled on
 =C2=A0=C2=A0=C2=A0 the kernel command line).

So how can the root cause of these warnings be fixed?
Or is the specific WARN_ON() now obsolete?

