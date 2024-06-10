Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3D4D8B6
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053376; cv=none; b=R4SeeEPymCULhbjaHuYqStbUraQl3WOO1uPedj6bOJwrsWfPh7Fewc+QB5nrcgTHXFmtVvU7NRMPSjx/Wv4S2ACWELZXzSXYYauiJjiF2QV3c31R40kpSgLI0Qtp2Rf7PTM/6kWhNlJ4mJ6452Vcr6MzqmKtjuR7MiR4i1XFPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053376; c=relaxed/simple;
	bh=p9OoPnDAXdppL0AFx94l2keBpIHvfCHIpv9GHLzQ0+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXtc9rCU1E+8OYFWsRc6ARaTdebnx3hguI6/iB8U/cBWG2wxuIP8yIxvMW/OQoYMBod57+Su7BaT/kvNBEpuH5J7kZzbe5v6qPy/b8k3cuqLvhHtWM7obvOhrAJfVjTEvF1CXWHlPGujQ4GXEnqaBLO+QLGf94VImmTfh8EtRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QrwY2C0B; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QrwY2C0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053364; x=1718658164; i=wahrenst@gmx.net;
	bh=dz+Ztr+H90QiZfF3gUr2cM0tb7zn20bPsMucWMQkuCY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QrwY2C0BSTKCjEiavKGw7a9ZqqUCjGLoy3Bjrh+hQW9Vm5qc+AB7hIHPG/phnyWV
	 Eg8FIFfht2tSMqZLWCFTUPREOi41HDSY4l7C8FmuJOCNNLj5moGXzMEfY8bfZii/E
	 kglUdoZ0NZ4bOR/Utd02FirzhqoSP5ElTa5JnJoriyYFj/krMZpGIx9rygFxEm0st
	 YFNOl1mQd1Qmpp0G8wtsgAUDrxrO2jkA3xFx9X5EAGzwjyVbGdx5pzE1z8gzzQ1Ds
	 vmwdnNBAmDEXIPfwv8+QEKg6eEr748qiHgc97bAPRXi7DNw+CEVwAapxGBctOPi1f
	 tGDphvvYPjy3E0wGUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1sYzTG1DJ8-015Lbc; Mon, 10
 Jun 2024 23:02:44 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 09/10] staging: vchiq_arm: Don't cast scatter-gather elements
Date: Mon, 10 Jun 2024 23:02:19 +0200
Message-Id: <20240610210220.95524-10-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610210220.95524-1-wahrenst@gmx.net>
References: <20240610210220.95524-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AU1M+rIRn+YXGsOGeaf1U8LDOmKf2Ayj9OTRLgWmnyZM5sErLNo
 YvwObcWEVuYC+HGUL5EKpr7lwAFMy5jLTNKTxL/xgk1xHmW4WdUU/FW9n6T1aisS6kggUlQ
 SzAtuj1Jmjq3pLCW1TudkpS874sM1MOxWtpP2CCROyyOI7Yngezxj3Y5GTUk/ySdTyi3FuH
 +X2qVI6iEh2reaZ4e7YoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9wxSLz1OYSk=;rsn4us+HhQLrct/dLRbRVGzM48k
 VYz0gRJRZAeMZnm9uB5IcJyeldXlciiMJc2r2hgPN6R30UjEo+S22on27z0NLNv2rDS46DkHd
 1FSbwII8cgTRfaoNar4IZSOIutWGpCfP1YCtO0L7UZifknn2sZCMVrCklQGqs7lCJQ9EySz24
 LXSiGNDS06hBDasv//qcJ91dJ15LQPpVNF7qiLANtDBxcgsFh93FI/D+a1QcxnrX2BdSEmwnq
 CYOY96Oy6ABmdV7U2u+4mvoEQIKBUCghOyiqaGJ5PtrzlYNwPNDV3A4qu8VahkWK0ZZNv6nqF
 9k5iJbluiVniYDXok05lwexoO+ORyrhAVBc7JUr7XZHdtIrlv0GhBj6FnDCqCnhWugB1I3lh0
 Rb7bbvrJJEEfAidkncZ0jxzjrhGrDRrTYnvPi0tPGaDW8wwUyfTXqVTNa0wa2/UbA0LGspCEt
 E3TtYjIx9gQ11SACl50lpXyM0V+PUm9qalbFKTwXWNoiEk6QvpV/0L0PvIhc1g0Ml9KtKtm9T
 lZsqX750g7KKNTOtg1nic1dQhlXbpu4UTje+4E3hvvMAuTrl/kv7mQzm2kFzAI8eaeYPIUm1V
 qrCXQHq49nykuqyuP5dxjYn+wWfQKsllXwkAANav3sk7nVCpjkWPxYfME8kHy3W/tdJ2VrZBZ
 eYz9p6cVhP9plUczUAkMJUlozpISYvwlAOE3hUsob6I4KPvnTWwAme2G4BbK/Urug6W95/Mpo
 KemMslPTxUgs3T7NgfLBypZzW/Yp2PP/j+GID3ekSGkqJYwrFJiULQS7UXrJ67hWsmAOT0rwk
 BT/eIaQUjyUzoP3vQMNTjM7JlfAPCjEz3RaJouMSgJh+A=

The kernel uses different types for DMA length & address,
so better use them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 706bfc7a0b90..02392073c4aa 100644
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

