Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A01DFE8
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524633; cv=none; b=DkFAGgS8SGXkuncUDm5MAmREmOfqwjBzqWtHwiFymu/VljkX9X/MPoGTPNxxBxQBnNZ6DPELxtlCezO246kxMBbBz3k45+bTJDu75nXcnCQFKSKhZU4N7cJXt5JRUNpsD0fk/ZHYyM6zLr/7ZSYesZVsDt/cskBkU83tb60i12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524633; c=relaxed/simple;
	bh=ywumAj6qLkf3fsQhGtmNvw0F9J0V3jlBaF2+D8zP+Rw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xy2F91Nevq0y2quusJ7+kO73dnbrz6Q1+Ks1I8glYKg2BXiLobpEOyWtXU6N7yxB9A17OXMbZjtantwqeXb86n+lFo1nERthy6j1Sl04UsClPHbbe+cQP4MEEd7PtoW0Qzohoblmm3T8Hqy5M/7oPGBjiaa/Ujf+uc9AfVswuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=fge2YdQS; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="fge2YdQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524620; x=1742129420; i=wahrenst@gmx.net;
	bh=P/WbteE2uE9evzP/bYrygew09XhuNjI4OrWKNDTxp60=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fge2YdQSoLjP/g431yvO3mWevQXpMeIeik9KLizjXsh7eEFdDB8RD2CymzDQDju2
	 93ufimY5fust3LPCdmnUFGFLRAdOhSUXRjPRHiQFv/eWttTJ4ONECcFMXBCGUBZoF
	 LXvR5WHCF34nKWFBbyvGVhVgE9o+nv5ccdi2ImKTV7XsCkvi7v+mHaI+zBk7rzbjJ
	 MhMkLwWNdpvGN46Qdo3vToc1N4VE8Fc2U0P1ZTcxTB7SMsrwEZF+5eFKYxWYPC4hN
	 pd1I9Vsvh3xwwrbiNGsH8wa+dHiD0iqIAOTPRCPXRyWghYwF3XVp4mzhGksJXmHV5
	 yzjeNA62/y5XvJG/yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1t1Uu73WMW-00sfgE; Sun, 09
 Mar 2025 13:50:19 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/5] staging: vchiq_arm: Register debugfs after cdev
Date: Sun,  9 Mar 2025 13:50:10 +0100
Message-Id: <20250309125014.37166-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309125014.37166-1-wahrenst@gmx.net>
References: <20250309125014.37166-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kptK/+PtUtRYwf35RfcAu+TpPIIYdWRfjShOuBGBJc5b8NXFm95
 7OESYLU4OgTLjAOWWIcl2Q2dP307/5HHgP4np1ydmcehhYAFfBRJrVyMZhi7pdh6rsJD7pE
 NhFtvQdVnTl3HNM7gDeM3rj+Qg9MHJgbT2zzWAXK1zZEFAJMVNIUcQx5YsNpBccBn6CiPe/
 LmZ0u21+X8C/CISx1fCCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PCguVzfA8w4=;VJ1hG7dTUxCcPbWzp8o42u+Uc69
 qEZLeEmgQxOUZZ9QdDriH9SIIUBrVXBTiS9Ls3JsOhY+3KynlMCvCRhK33gyKPjLM5DckUCxP
 6SqPzrjWgP/h4ygw0/wx0aRrFitiqX3ZauMGyAK+v0eoTU/WET8eK2Jc1vdrqcyHqhjuIT6nZ
 n8Gdpnhs/zt7XtyRdQhBPgAGoiviGJtZImHEzjEOe2fHt881/9If2wtT/q+LyEnKUacNdMHp7
 zJjHXAxzIq1hB59kxF/de6IhbL4fnMCHPJYaRLpAxv6C1tlxQ11MvI3pW7Zn5vymyR6RqFD4z
 FffrZEnZuta5bo6A1eKw4W/Rrk7tboP2EC8YFBw1bNPgIW5NlkSGU77lxvWLD9zDMPfJKEzWO
 fqvQfmDNp0GJzLeqkfRkPA6xqBtiHDdFfJ8SvnnmJpRBMHDlzTERuIYpz/Q+2zdvp9hNjReYZ
 gn6QX0L7lpUJViVWvnf2JwKwF49ofgAEpbhhFjjhNYxVwNPwQ6ZRoeCJvW4YBPOxMtgHrmt+d
 edmxAFWTtCVnEPdQSgqH+WYwYgwKBDnL/9puEAxcEHge5RbAut5fgcGHc22FOUx/WuVg+9mTM
 2KVeXtgge/9JTCXFt4waGALh1gJoqucfMKqZnkt3TeeHqgB90qWm99Tt32v0NN7Wrrq2aY44Q
 Xz3WPzhvlHIbQXD5l7B+7tjvPxhzI1VM7l5UfUX9jctq4DPpvmL5pf+1/lu66iMzDQ9Iu/WB0
 7ZPOkqoXqejFP+DoA4Ap28XT3g6HS7Tvsin/OCcXOw752ufOTvSMRX5cJ7m+zvIpd1ljO0On5
 ni6ZEAr4CLceEQovSRo1sm4zODlvrym1ia4TJCSjx85PkEJbcGLEYKs0D7Jnj5epBotMRgMsB
 2lSgYaehIqZb2Ygfn4IxhnWTQ10VWZ+7HQs79iQZjduOagHsJuBfftbC0QWAPQAc8zavrh4SD
 8/2pxNGuREzdvBaMBdiPzMewttr6OpS14Nh0d9CLeN+BWobULWKpqWWanz6JxMAFKW/2lzqD9
 k5JjBGD0CDxQ1yLyLMkkKL1JkTzUHRB69ZCzyTDCyWsBvcK5NaSPh6cHa4P1+tiFVM2uYFHoW
 KsEshW1z5Uu2BNulk7DmyBWtPd/YWGp/QWXJ5e0x+FP5ta2/+kS1G0CSwGwno+gctslavWpQQ
 Ikan3QlA13X/2oqGTEEYm8bKToX1rvE6s01jj6sYos8/VmlWog19ZTlDGE/bWW5Ojh6Xg23fy
 XFYgfj6oiriH2aJaNDvgk3vHtgzRY1r925Iw4S2IIusScCq7vI0yLL0tns56ev+Jo+yBmtfXG
 sHjkP6aFjJh5Gv9CqMcxR6hq71RzKZWQpsXx7aMHJ9uk3zYHCGjaD2RNoRAy8zVK4IC7gVUsq
 7dgzNDHTnDJ/jQy0OF/w458N2B8+O9JvKXiAMX1465wz5a7U36HLGPoi4k

The commit 2a4d15a4ae98 ("staging: vchiq: Refactor vchiq cdev code")
moved the debugfs directory creation before vchiq character device
registration. In case the latter fails, the debugfs directory won't
be cleaned up.

Fixes: 2a4d15a4ae98 ("staging: vchiq: Refactor vchiq cdev code")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index a4e83e5d619b..e2e80e90b555 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1386,8 +1386,6 @@ static int vchiq_probe(struct platform_device *pdev)
 		return ret;
 	}

-	vchiq_debugfs_init(&mgmt->state);
-
 	dev_dbg(&pdev->dev, "arm: platform initialised - version %d (min %d)\n",
 		VCHIQ_VERSION, VCHIQ_VERSION_MIN);

@@ -1401,6 +1399,8 @@ static int vchiq_probe(struct platform_device *pdev)
 		return ret;
 	}

+	vchiq_debugfs_init(&mgmt->state);
+
 	bcm2835_audio =3D vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	bcm2835_camera =3D vchiq_device_register(&pdev->dev, "bcm2835-camera");

=2D-
2.34.1

