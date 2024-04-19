Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6E12DD90
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713536846; cv=none; b=k/KBUlnebEi87jpl8lqatEKKbb45/aZTdko8DsiMCgShhjt+e7kNM+ZXrlc0vvhGx5rokQE7P1hvvbCT80OHMmeKZ89PSi/Jh1kcOGp19HsVrvANjfJ6HGB0MHboqjMpEkfhFDHxZaqUl2fmqTEZnHWRdrV0hrBOzyPAPC6OcbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713536846; c=relaxed/simple;
	bh=v4LaSOEBuazVXfMsigZCaUjcNpcVfpKuTHBWU2OQRGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RHHMk29/l9OeEN6l2f031LP+B+++OobZWELNJfLms7eKoV1q42gnUZ7x0zR5QQ7iQ16nI/9xzf+vAd7Aada/MxhE2zE7mpm74CvxlehLVxqxpLWI4pXiRQdTdQPXJnvgY6HEgMZwfa9VJKYfyj413FvpNXOCI3AUSlMIVjSBq1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Z9hoEG27; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Z9hoEG27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713536831; x=1714141631; i=wahrenst@gmx.net;
	bh=AaNkgdxXm7U/qu3aiwXm8r8W25b/1Mh+5OB/yHfIrYw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Z9hoEG279KeXe4mJaR/9x8eEfdbAcMv/R/Ag7394siNwIfJutd+Xw0SRvtv+RloH
	 YzwF5JbWKp7zmTxBMJHRxuJ4JmjnCKDswQgESZVAxWepx4paeKlq/dsYXpcDYvVC+
	 f58Dto1dqc1B2+fYZQIAf55ynPeVaubFk0xwbeLiNmy8Dq4l3fstdaQVlJJ4NttlI
	 v2wRscJqAqSdE59/s9D7CRJIXJwbhYRgwQC+duqpO/L0E5W7pDyf0Grh+yxfhxVA0
	 z0JigHojbedntYn6UFD17s8TiN3hweXQcVxsX2zvO/H4a/bWfmAsTb4FHKVYupLXl
	 xH7rKYRJIExgquu85A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1smhks1289-016fvd; Fri, 19
 Apr 2024 16:27:11 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] staging: vc04_services: vchiq_arm: Fix NULL ptr dereferences
Date: Fri, 19 Apr 2024 16:26:50 +0200
Message-Id: <20240419142650.206583-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qiDh/T0QRN67ss/fyMYZjpEHGCQioC0vEyHBzmu+MQMOEgqAQlR
 2+9lheMfxkEKE3ghb4NOH8Ke2wjMB95+bVt8vSWU3SDM2JE5+NMG0fog7EK5v/2U1YpbVCw
 +ISG+WjMY3F4c3B370tczg6XzOUXoLmS0ArWzHW/NibJAdFUdCYKPcQYAtHkY2D4typ1QlH
 te/9vhxeC3t4wJCFG1xEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Pbz3FSd140M=;PH1rIeWVrfD4psubD39IkfcQ0O5
 BYTWLVpWhsf6+CljTo6rUkWKCNZWdc8Ho6D3nNb8YjPW0aZrk/lxS62JNUyKdC8DPI4oknqri
 zaGuh6JHE6LMHqXndEeLkKXCnROfaaS+kgZpcyGZtf7u+FBUPoArxgEvkmgJl55dXCGWzWLRI
 W9BH13hjEpbK20KiTRwSM4h4C1V/8UgflC3IpH8TVhZOoHzfkeQtV+PJ/mr2WzxdStkBSPPBO
 mb1nMky9UJ4hNhmRvu5QbTejubik8CLg6jMmoIgnpKiuyVoTSFQ90zgkxAXDzQKbxwFElxD9R
 cQZqFZjNDAMgyd5PGVF9K2yNwI+Jj4/RII8h6u3s62KMTaFYZ+LOtslYq6gw5sOYffDaixqOr
 KBU0d9j8K8Do3OrPuyIXjWAzk7o1aKsjTnp9u+HHYcBOya8ZCVtT+wOQhDr95uUlIrTU3kDai
 fih9MXck9Ny0sVk1b78y+sFVRioW761lv5YXV4TPJzIL6Z4Ujp2Sz46YoUD23CxHL/w+4kCtF
 og9jBwmCntNZi0w3N+Hk+bEXYVC23nP30VhZLpgFY3VpBA78qCt0CF8HBXFaQgjl7E+Fa6aLn
 Dv+WSG0Y/mblQFp3+EET7+kE3CPwZdOoxyW0/mFBwaHZO8KbJFc7Cz9KwYfvaqeGl3Jgo1YjS
 smE9xnnHmS4XNXD/Zdp3OHEpS9HUFjKUvRvdYjzlFnJ/11FIjx/kG3pcaKz5jPRmW7c5kq2EI
 JgF5e9XqXVLgXfQHk9teV4EKvyyoxqLrDjnoc7XIlXEbrYLXjXMPeIovPCioFJTGl7aFUvCwp
 A1w5pU+sjQek4d+eC5EcAka4cgE+slaCbXVBSGZyt8jT8=

The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
g_cache_line_size") introduced NULL pointer dereferences by
messing up usage of device driver data. But the real issue here
is the mixed usage of platform and device driver data. So fix
this by switching completely to device driver data.

Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line=
_size")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 502ddc0f6e46..3b032d987f0c 100644
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
@@ -497,7 +497,7 @@ free_pagelist(struct vchiq_instance *instance, struct =
vchiq_pagelist_info *pagel
 static int vchiq_platform_init(struct platform_device *pdev, struct vchiq=
_state *state)
 {
 	struct device *dev =3D &pdev->dev;
-	struct vchiq_drv_mgmt *drv_mgmt =3D platform_get_drvdata(pdev);
+	struct vchiq_drv_mgmt *drv_mgmt =3D dev_get_drvdata(dev);
 	struct rpi_firmware *fw =3D drv_mgmt->fw;
 	struct vchiq_slot_zero *vchiq_slot_zero;
 	void *slot_mem;
@@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;

 	mgmt->info =3D info;
-	platform_set_drvdata(pdev, mgmt);
+	dev_set_drvdata(&pdev->dev, mgmt);

 	err =3D vchiq_platform_init(pdev, &mgmt->state);
 	if (err)
=2D-
2.34.1

