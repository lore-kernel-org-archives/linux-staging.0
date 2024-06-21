Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115EA1EB45
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976027; cv=none; b=ZHc/Oe2gZ/swdN2RNboCCy+QyavMK5Y1GFHJ1vHdf8ov9kpsLYQYEV41XI0Mcw33/X5kOw1iWLuTvGH7uA0RzG2srx40ADUzpD1L5y/e0pSuW9oA9SiR0CXVEX5Zr9m1qBnehPmCv9FVldXLDHr2sWuGTPHO9n7bhQhkWTgdM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976027; c=relaxed/simple;
	bh=YZ23w8GN2ZDcMGq4JT+jqZQdx3C+2tXHOFQxQVnSPdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jITZgUopIId38viW1+MbPG6Jh9u6yvlWgJtjbAWWUc+pPFZLOYQkFIZ4RGs3tIZqGOKXjdwMbUrqYEYDchZNxB72TencEuqOws9oown3c0xluRHTxgFFAzsKhjuO7Qt0s3nDZUt6FxtufCi+4u+XWCoclUUtFQaG8eSXy5vXThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ns9jXKmH; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ns9jXKmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976016; x=1719580816; i=wahrenst@gmx.net;
	bh=WGwqd975to9Nc6K92tWIbNW9GhNoaX3gZDD9jZNa8gI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ns9jXKmHLPYukUOp5ya/7OVOXVA3Qb6IFCv9XWZJlbStb66DLgxPFgGvA3uHxkoO
	 MLExLk+FYpFDwSnlggYYSsdoFvGpdK0Q5oPNtE6cZ7Ab2IZ5bf5TcWhX8D2q+Ph8g
	 brwV66GwEqjdzqLe0jjIhhIIiPaG86bWVlfIai8Pvn8yrJpmEEtMojsO8NW9aW+CC
	 lqFwBBIvlWwnnlWD3aSO8rlxP2V9ZW8G/s5yLsbqVGeX6ljMQBX6vyzWpndgOxhtn
	 hQLNJdG/DMsB02doFRYo0PaX5J3TTW3AzchJSG+Ppu6b7AHa90BW1YRr4sogHrleV
	 hkyIuto8/L8QE0461g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1ryYxz3zpQ-00NnBk; Fri, 21
 Jun 2024 15:20:16 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 02/10] staging: vchiq_arm: Drop obsolete comment
Date: Fri, 21 Jun 2024 15:19:50 +0200
Message-Id: <20240621131958.98208-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:yEdTAysFKPgx1duXtm089Ojkf1CVkI3ARW1c5Zue+KWtHQKkfJI
 ed8HhV3h54/weFMWYUxLZwXeO4buQBIvnSnBu7L54lPas0uv1Tnh9b4Um6vTiPEj81jzoYh
 4Bk4CYAT1sgWS3XBR1nfYwNSJbo8KsuNBRFQKEbbF+G2KswjSlPOQxjRlPs0qVqSuJmlwc5
 KOX4//JMVGzHuL7l3qAFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MMcm+CF4pFs=;2DCv13Wi91wJyXr887gncArKqtz
 Nrwujct9SM+k1yk1Qe3Tz+F67uGwsxEMixnPZPcg2Q/amNo0f9daHQupsn/gSNbUR+O516uIa
 /PvrudaDl1gDtuiR7rJ19/3HrSJWxonhKjKQMB2IklNcRKHpPExaMw2hZEGWOrbqzWhg9uay3
 Mx3DcWGafV6hmHbbCXUdY/lGYr/WfNe4USJyXx8rcvdBHrb2ytLISK1Qre1VtO+NdrcFuxjoM
 JRP4J/XaG1Pe0MJVdGZh8s6ajwZ8a70kmHWTHfSaoeaW//JpjwbMXJMLFMxXrKCiCBjs0u6ux
 19EeHaVLKQPy1XQbsY93n7wJhTVyB1dDVLj2LTal7jwdj6ngQn0M38MXZdK3sgMLBXnQHdkHh
 OCq2TzukSkzvVbUvoS99OkC5Uc6No7Ue/nqsKSiTqXnkGCu4xUZK4PXNHuKZJ37Cph7Euiia0
 183IFYDiqmFocqBGyOke4kZl3VgqNbMQXLFnEy9hinO32sIUaWFrQ1pcRNx7L79UpavHB2C5R
 NAeD8vwAs5X5aOXiv87/i70ts/zKFsQ8d7bDyBIQn7zd7FzeAgQRBCw1gAUPlbeXEWGLH//I+
 8m321hNbT6Yv4G5lrp8dm2zFovrziLDwMyr2enR0IXhfWJ46sXtmf3WInh8oz+2Y2nWJU62Ij
 x2V7chqyG3KVJPiMUGZ627BOKRR113MPb1t92EF3vJUyuRHXhpsXkgeG9TBUsUZeNgrBzV0IZ
 aQZFm1CZW7SbBW0JjBjjpqLI/PNPVd/qDWUwZwXFPqu7ot+GW3WLZ1tNUPneyacYxk67wI+Fw
 3InvhBy8uIDZput6Y1DN5vHL+QduPng2KHPw3eGWcnCUU=

The BUG_ON has been replaced with WARN_ON. So we can drop the
comment.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 2357402f8ab9..6cfc5a769b8a 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1448,7 +1448,6 @@ vchiq_release_internal(struct vchiq_state *state, st=
ruct vchiq_service *service)

 	write_lock_bh(&arm_state->susp_res_lock);
 	if (!arm_state->videocore_use_count || !(*entity_uc)) {
-		/* Don't use BUG_ON - don't allow user thread to crash kernel */
 		WARN_ON(!arm_state->videocore_use_count);
 		WARN_ON(!(*entity_uc));
 		ret =3D -EINVAL;
=2D-
2.34.1

