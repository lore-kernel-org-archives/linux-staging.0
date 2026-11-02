Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623994;
	b=YGINL5iBLzIQmSyqawRJMJRZWLtJOQe5ynK+RGYuuMe8vPSSBb/T9/Eqv3dN2cN5WssT
	 QRjr+7oFoTRy9utgBmzg3yZg4BHiHY7gKMXRAmr+VPqQM8NuUBVk+F3LMHVfR/YnZMZZC
	 iGMphM3oRFNkOhMsg2c0YKksSpWhxGnfH+q3Bn+Kzlb9B045k19Nl0lxDvtXblUmii3mv
	 R6ckH+pwAhahUTicXtIS3OiZWZl5QRz7CcmSFAiUZLmM+4v/YXfhzL165vgMsOcslgnk9
	 kBSt36iv7fn2Kv5WJawmS0N+jUPkDNzy4CZc1hToCkEzHDORjcqMuAwkgUbkpJa0sQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623994;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TPDXEiwGt7D41lmUmIF/tgtt4iQ0LTVJ4ZzGPmpcPqA=;
	b=JN7iVgZP35KQEdlSLI6RQJ0TQ2k4R+JfOFoWzdqq3QCwrxgGjHt68Y0akBbtCobVQ9Qo
	 d7HamUbTYGbMCaCTG8ju9qzKcniLCJ0TEEpaaI9K9kBfc1AQCCjvO0A5HBuqt/g7mitqy
	 BnxQFLf7yH0NveabrAQGDPZqh0np2Ue31329OeYLVMA03epKoD0/KDvtihIQR8G/pL1yp
	 jSF3nzNw/GayQ+jMCfL/Dg9i4u0S/Wj9BVbYAvaEj0ci/X6eXowOsnx18yGO6rQGLh/25
	 WH+z6kjt1mqbvOmaPXr3gytDtvPOMLTGEFNJJVMB9XUs3L39VO+18cpKBY48/22yyEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2711B606A329
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 12:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2711B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id BA635188FA;
	Mon, 02 Nov 2026 17:53:12 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 03497188C4;
	Mon, 02 Nov 2026 17:53:01 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 3/3] staging: media: av7110: check dvb_net_init() result in av7110_register()
Date: Mon,  2 Nov 2026 17:51:31 +0500
Message-ID: <20261102125149.82725-4-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102125149.82725-1-a.karelin@ideco.ru>
References: <20261102125149.82725-1-a.karelin@ideco.ru>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

av7110_register() ignores the return value of dvb_net_init() for both
dvb_net and the optional budget-patch dvb_net1. dvb_net_init() fails if
the net device cannot be registered and leaves dvbnet->dvbdev NULL.
Probing then continues, and on device removal dvb_unregister() calls
dvb_net_release(), which dereferences dvbnet->dvbdev.

Check the result and unwind on failure.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 drivers/staging/media/av7110/av7110.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 3371e33db103..9390c347da50 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1314,7 +1314,9 @@ static int av7110_register(struct av7110 *av7110)
 			    &dvbdev_osd, av7110, DVB_DEVICE_OSD, 0);
 #endif
 
-	dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net, &dvbdemux->dmx);
+	ret = dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net, &dvbdemux->dmx);
+	if (ret < 0)
+		goto err_unregister_devices;
 
 	if (budgetpatch) {
 		/* initialize software demux1 without its own frontend
@@ -1333,7 +1335,7 @@ static int av7110_register(struct av7110 *av7110)
 
 		ret = dvb_dmx_init(&av7110->demux1);
 		if (ret < 0)
-			goto err_unregister;
+			goto err_net_release;
 
 		av7110->dmxdev1.filternum = 256;
 		av7110->dmxdev1.demux = &dvbdemux1->dmx;
@@ -1343,15 +1345,21 @@ static int av7110_register(struct av7110 *av7110)
 		if (ret < 0)
 			goto err_dmx1_release;
 
-		dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net1, &dvbdemux1->dmx);
+		ret = dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net1,
+				   &dvbdemux1->dmx);
+		if (ret < 0)
+			goto err_dmxdev1_release;
 		pr_info("additional demux1 for budget-patch registered\n");
 	}
 	return 0;
 
+err_dmxdev1_release:
+	dvb_dmxdev_release(&av7110->dmxdev1);
 err_dmx1_release:
 	dvb_dmx_release(&av7110->demux1);
-err_unregister:
+err_net_release:
 	dvb_net_release(&av7110->dvb_net);
+err_unregister_devices:
 	dvb_unregister_device(av7110->osd_dev);
 	av7110_ca_unregister(av7110);
 	av7110_av_unregister(av7110);
-- 
2.56.0


