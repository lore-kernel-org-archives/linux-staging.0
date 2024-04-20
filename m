Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55EC17589
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713604440; cv=none; b=anlmu9Z+12qQMaZo6g4NQ68BWk9W/4lPPYVy4a5oeWfVX9bOktOvZc0N5PJRk9uMfDIblmQ+Ta7LN0U1KX0tKDK15nZlpgV9iYHHKNyVnlLbMXeIwMajo4SHj7hJsNz5YrUnDHTKKotp7hfOoUsw4ziQeKjVQXRhGA47J8V6EH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713604440; c=relaxed/simple;
	bh=+FwMdjwyZuTWuo5EIynZ5liQvJEzJhjEHUHXxieY5NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHiIJEV+ic/TRWW0qDslKIlfsl0fBWW+0aDw+RsXaYyJX0E6I/qD+4uHh1EopYjF6HHWtBSmzVumhMhpkGd45uqdhwVp2rKR6uTvtsS0km8hu9bBIKhzUdoEQYD7sBSHPJv9OgieAi1xDLzey4l1Jl/fOmYGB5gE05+MIBpvtiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=aqbJKnQQ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="aqbJKnQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713604427; x=1714209227; i=wahrenst@gmx.net;
	bh=NYfpO0Y8BzAMcuNrjb6008bBmLBEvtULE00mErAUMow=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aqbJKnQQxM1AAHQ3urb0ivxBvDDZ5Kz5GC2oZHK9ahTSdFlZ7RR0L9l9bS75OZKY
	 zS4TkeHY7P61ygMSVPkJ5iKzmE9yFYGe8JRMLOiSgzBPHCJqZfYHhJw82ek6Mf0xt
	 YCpCjDgzJncA0T3JRvZROommL5YNmxOaBEsFExPpKVnEAvEfe8ZK/gTFGzPDOJzOz
	 ARuSOAd+8xyDblrt0OsRbNVZuKujgOVyqu9KWxp34upY7bxWM3dztB+b09+oqIABd
	 vlPsUguULxbRhgBdAWhcPWxgqjcro7PW6UvbCD4Kzr0gD2a8f2DWyoAPCsr33jrp+
	 q+l8r/rB5X07TCy1gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1rzUMi328h-0032iq; Sat, 20
 Apr 2024 11:13:47 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2] staging: vc04_services: vchiq_arm: Fix NULL ptr dereferences
Date: Sat, 20 Apr 2024 11:12:40 +0200
Message-Id: <20240420091240.9552-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6FlioDCPMJdPnkc0CPyKL+KMOAXnHuX3V1DI/vFloDMYd/lQiHe
 Zyn6xp3O7oSHPZxfl+BfdJVxF3ITLK6lLqOt/pl2R2VXVqhSufrRs/ZybdX2jPpZtPpmqTw
 jUCOGpNJbmrfxvUn1fPWIFRmsX0v+7qaWlsNkAvEPVVKAKw6V3dSVdPM4Dv35NyA08CJTOH
 jtQTv3M9YnnAgzLR1rYHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j8mADqAS0KU=;J6a6aPfBej26eQC5F7do7uDeFg/
 UpFIYwq/gkrtcQptyNqoAUdQlZdF+CwMGZup+mc8soq1rshmv70TV8C1byX3bk00bUJdkp3xE
 fXgeWRb6rg9YbCG0XGdcx4B4Cswhpioc8fJf510vrVzJVyCHbb8ONpS+E53ACusW+9UjuoKdK
 bPO4Q1RrggjGXoPaKJcV00k7RXdFCVlZXusqEOvJbj3wlYfx5vcQFO6SDc8aJqFVTWVKn35mS
 WBfjTJktI88hk/PhC4cVR0o2/nu1LNxuVU5xrCS6FaXcC/MJWiCBhCBMtckAIe2oHiMeGQRJC
 pF+ndJfYOt0r1Zn5+A2eGaLIGiahzM8jFVCpEI06tK+J+W6rh0I9EDa/Q0j2ZyW9+Y5aKK2FY
 1Umqxk46XUoRIYdbebCA3MxwhH/7VBZttj3jIvFE7W3dpEcEWzYnYYq3ir38gN3ia7i+fUAUS
 0LbOixmTLUGtXvvufPXI9fhWoaFzViXrGDhNniHNZiB83fpO7kr8dCva1cjMZLBhmXhkP4EqI
 /8NfkBanyaDFR+WAP7KRrGwM05N+mFRzDdnBHSKuhwd7hC9TTniWpGffr/WFbVj/SXwyHCUeg
 3aI/xaosLTNNFqVO1agXx5qCJhWUFecTmYZmZSR0xxEZYOM5HlhbnoSDz0mZPx+ILCx6BESBQ
 ssQavw21Wf4BK80lIPfS8l2oFa1ywEUV7VY8MiANKFvtSG6fDgJAmKdxGKwo9BjpG0MwwkjNf
 0U7+zhQvNpFsrf5Y9xJriJXNwFKnkCGcBi+x1PRJkHdnSZ7bFSpNRjYs82/13SrQXyzWIM6fN
 iC3TxyVVRPIrk2S60gzIPahAK64wUMGDZNx+QD8Kdkfr8=

The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
g_cache_line_size") introduced NULL pointer dereferences by
using the wrong device.

Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line=
_size")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Changes in V2:
- drop cosmetic changes as noticed by Laurent

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 502ddc0f6e46..c06232fcb0fb 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -257,7 +257,7 @@ create_pagelist(struct vchiq_instance *instance, char =
*buf, char __user *ubuf,
 	if (count >=3D INT_MAX - PAGE_SIZE)
 		return NULL;

-	drv_mgmt =3D dev_get_drvdata(instance->state->dev->parent);
+	drv_mgmt =3D dev_get_drvdata(instance->state->dev);

 	if (buf)
 		offset =3D (uintptr_t)buf & (PAGE_SIZE - 1);
@@ -436,7 +436,7 @@ free_pagelist(struct vchiq_instance *instance, struct =
vchiq_pagelist_info *pagel

 	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, =
actual);

-	drv_mgmt =3D dev_get_drvdata(instance->state->dev->parent);
+	drv_mgmt =3D dev_get_drvdata(instance->state->dev);

 	/*
 	 * NOTE: dma_unmap_sg must be called before the
=2D-
2.34.1

