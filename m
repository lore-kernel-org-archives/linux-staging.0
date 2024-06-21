Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D31EB45
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976029; cv=none; b=GWd82UU134N2NBaIyGHP06/VJsruYvJSQDH1RKM/+/7BtLFswrYaUisg66GHoihTH1DxF15O3yz9ZiAQm1LzlB4kopfOU0WQ77EtVYwDw3p91aSMc8zigtf7EREm5vClqx0Jjy7EElCEqdmEDIiO2Nu6/NuaGuirRJEOYt7BLwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976029; c=relaxed/simple;
	bh=yUoE+8Cw+W82bAJXBsHyEA6yDJ/QtuVVbR9IfkbhLYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzlnIL4sgnh6K+GEEAN/wnFWwhfsy5mY7XtLuhag8rwvc1sY3Umld3LTwTtRyX8+LI33V0FaI+GBrOFaJMJXVxlMu1C0tvLNWUOXIFLa64qkAw1GzNtULbbxezSxofKY91sysw1wfWSWFA1cTD5692RAEZ478Ks+/pfKIDhP6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=t72FNY3C; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="t72FNY3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976018; x=1719580818; i=wahrenst@gmx.net;
	bh=clkBG9k6stThD9RBx61+zAMxdNQkLd7Uivc4tSeL2Ak=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=t72FNY3CAXh7zBzUToAWDUW99V2DLjKMycCL9P9m9LLu/jiXgwq0Z7Lq+G28pQjO
	 gkJusI9PG1aNkuW1GTWzp3dYSVV3A89U8XdN8n++1ttOLM5AjlSHA+dDp/FCXm3t6
	 X2Sp2PwpXqseWtqhljREDyPhSG3veHqQKkn6eA8agI0Rfeui57q3EMpjH3Kec35Vr
	 NG9grTkXDs2NtDPjL4B+iOo3dBl5VpoeS3Ns7gVLTa1jb3t7q5EpQIS/dC6C8r5PC
	 jQ3cnLKfbQFbKQGiG9QXbpV2/ChdiOOE72NrECU26nnMh9LXBMQstyWjnameVREdL
	 LlOJ3zEhhvJkFvi31Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XTv-1sOn6h0Npx-015xh7; Fri, 21
 Jun 2024 15:20:18 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 09/10] staging: vchiq_arm: Don't cast scatter-gather elements
Date: Fri, 21 Jun 2024 15:19:57 +0200
Message-Id: <20240621131958.98208-10-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131958.98208-1-wahrenst@gmx.net>
References: <20240621131958.98208-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oUg2nHKfmJ0tOdxWjx6vA3BoVLPBJfzUUsVPltIEaY1yaEiW+KA
 tv3ZBauU9mPeWZNf5E8rDLOndjOA+d6hL062LBtFfMDjH9KuiLBsd+1ChI2sBxF6YBsUY20
 Ve1tkJkTOqgzjk6Wse7rv6SQLiQ33LAi2WV8iR6KIgo/L9m/NICriQllIHOJqQVuVZh56xi
 MRNyijoohR46MijTpf+3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KsbaDeR4UP8=;5QDnxM9sLz+enNdrUt9/JWs3zRh
 go7VJR/gy0Gz/wmzNsInV2LSedasrPBEfbqYwPhMMJamwTZq3RApNm1DzuqUdsWxGkxMjVquH
 rl5+0JDpoyxaovkLZoLrOCE95bUh0Mm/IcPTCx4QHP62NKSoWdb+b1xqAR9ZXyjCBJY80CPCl
 ywf1Ez8MfWZXR9Yl92RQwuqdd7GNMQJQqxSjX0k/ogj9WEaFpeSgaSKunbWx1R1dH7TDxA7aG
 E6l6vcp1aqH1SFicAOpcjc3Cfsbr0IMBo7JZ3pXTAM99Wu4JmqHC4ydsca+ux2qG82GGZm+c/
 ULP8myfK2G7M24oeIGp01TOXwvG0n0rTSGO51Hv2n6NUvMhdibocIc1FbDbsCNVjB2HTgzkmW
 8Mua4KZRg1qjaGcgvVlX0v949TmU+7SkPWI9z7COgWvtfI7JUa+t65ajoJ83BbZjhcuk2wvuI
 24/uZTn8nUW8mdVETkApbYhU/38nYZHPukZ8JdmA8gfZGP5KHZ8Wk0nmGoIW78bfTvy0N3wws
 JE3tVEsjLoeXaSRoHY9KyNSwYFrkTgY7IfuSupxMxYwHGFHl0dq3Hm22k6LgRnD9ET2PUo/z0
 0O3zprTSZF7/R8WZ1gA3wP2iARr4h0Nct/YXKzF/CHqinlmR5Gq7HtQLYSLAdjy29P+01fyW5
 7Oyl/GQF5jZ0395aT2c317O/BY+l5T3Hwl/AN9+gKgNCjGm28wcVg4qKOb/FaqKJDgpqldXqX
 eZVCnY3MO7eAlS3E4wercRi8/SmtLY81M7L+iZBlJPhpcMm8s0YVD4bAW0VUzbPiDqqgOTkI2
 fzckXNDTyowVYRWk9nY+6xuzaxXtWNMiGf7ywsV1lHzTY=

The kernel uses different types for DMA length & address,
so better use them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e3d49d4bdb1d..9e6102c43e00 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -162,7 +162,7 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, =
struct vchiq_pagelist_info
 }

 static inline bool
-is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
+is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
 {
 	u32 tmp;

@@ -377,8 +377,8 @@ create_pagelist(struct vchiq_instance *instance, char =
*buf, char __user *ubuf,
 	/* Combine adjacent blocks for performance */
 	k =3D 0;
 	for_each_sg(scatterlist, sg, dma_buffers, i) {
-		u32 len =3D sg_dma_len(sg);
-		u32 addr =3D sg_dma_address(sg);
+		unsigned int len =3D sg_dma_len(sg);
+		dma_addr_t addr =3D sg_dma_address(sg);

 		/* Note: addrs is the address + page_count - 1
 		 * The firmware expects blocks after the first to be page-
=2D-
2.34.1

