Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623965;
	b=ewIiB66qxYIBOloJouyO7jemzMr2FrGq5kGKUuY5Fak2xsEeRsRdIu10J4k0Aw4Kh+19
	 K/TaPkMReELC+U0aycl38Kfpc8S8t9MoGgruxSH08YLvHHiN2IhXh83YWWOyqYEGvQid/
	 nu9hotv/8Wuk427/ktIpvTVOgdHUloK4dxCHYv9bdq2BpOl+1npmlZjU+gOZV6VoT7hYc
	 PJFlMvKo2K+npIvJWc9nJQNPgI5hC1NwgKVqNIauJJQIZRqHxhwwwixyW/pJuCnKd/a48
	 4anNfoeVQMucAZ117idSKcebrK6cVVL2yjzqgIVsMpez5iiAqh8uRyS4CyzzzOldxDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623965;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=StksVxaMzEh0HDG3wlpW4ejyh/JptCT7fjsw+2FvNUA=;
	b=UIpYLFgtvINwEUuX25hc050WP9TGNF2h/34JoZ1N7IIRMxNy+S+Q3XvT0y1DKMwuqiHR
	 sSN7ISC2R0viIYlsn5oulLaUYqZ4W3phpdR77R1eFg3I9SyH3de65m9saZaqVbWCihbCH
	 hxTXi9ivDqJMjUemxCwbtaydR5RiZYzKe7xbUPSdyOEcjmmgpt0D4gBF68zde+lLQFYBJ
	 ZpDj9S/BjWbXyBTGTAlWnq04Dp94OMAqZYFGMCiw7f83fSotbOaMjt64xRDY2ZsgQtLfJ
	 Zhc1OfPHb2IrvwCgwnbSoz3mz/HntatJK78UMxVFkb2GrAq1bGSnfTZ5HB02nX20/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E25606A329
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E25606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 03933188FA;
	Mon, 02 Nov 2026 17:52:42 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 54CBA188C4;
	Mon, 02 Nov 2026 17:52:31 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 1/3] staging: media: av7110: check dvb_dmx_init() result in av7110_register()
Date: Mon,  2 Nov 2026 17:51:29 +0500
Message-ID: <20261102125149.82725-2-a.karelin@ideco.ru>
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

av7110_register() ignores the return value of dvb_dmx_init() for both
the main demux and the optional budget-patch demux1. dvb_dmx_init()
fails if it cannot allocate the filter or feed arrays and leaves them
NULL, but probing continues, and the first filter or feed allocation on
that demux, e.g. when userspace sets a filter on the demux device,
dereferences the NULL array.

Check the result and fail the registration. av7110_attach() does not
call dvb_unregister() when av7110_register() fails, so add an error path
that releases everything av7110_register() has set up so far and clears
the registered flag. Use it for the existing add_frontend() and
connect_frontend() error returns as well, which leaked the demux and the
dmxdev.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 drivers/staging/media/av7110/av7110.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 432404eceaea..ecc15bb222c5 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1274,7 +1274,9 @@ static int av7110_register(struct av7110 *av7110)
 	dvbdemux->dmx.capabilities = (DMX_TS_FILTERING | DMX_SECTION_FILTERING |
 				      DMX_MEMORY_BASED_FILTERING);
 
-	dvb_dmx_init(&av7110->demux);
+	ret = dvb_dmx_init(&av7110->demux);
+	if (ret < 0)
+		goto err_registered;
 	av7110->demux.dmx.get_stc = dvb_get_stc;
 
 	av7110->dmxdev.filternum = (av7110->full_ts) ? 256 : 32;
@@ -1288,19 +1290,19 @@ static int av7110_register(struct av7110 *av7110)
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &av7110->hw_frontend);
 
 	if (ret < 0)
-		return ret;
+		goto err_dmxdev_release;
 
 	av7110->mem_frontend.source = DMX_MEMORY_FE;
 
 	ret = dvbdemux->dmx.add_frontend(&dvbdemux->dmx, &av7110->mem_frontend);
 
 	if (ret < 0)
-		return ret;
+		goto err_dmxdev_release;
 
 	ret = dvbdemux->dmx.connect_frontend(&dvbdemux->dmx,
 					     &av7110->hw_frontend);
 	if (ret < 0)
-		return ret;
+		goto err_dmxdev_release;
 
 	av7110_av_register(av7110);
 	av7110_ca_register(av7110);
@@ -1327,7 +1329,9 @@ static int av7110_register(struct av7110 *av7110)
 		dvbdemux1->dmx.capabilities = (DMX_TS_FILTERING | DMX_SECTION_FILTERING |
 					       DMX_MEMORY_BASED_FILTERING);
 
-		dvb_dmx_init(&av7110->demux1);
+		ret = dvb_dmx_init(&av7110->demux1);
+		if (ret < 0)
+			goto err_unregister;
 
 		av7110->dmxdev1.filternum = 256;
 		av7110->dmxdev1.demux = &dvbdemux1->dmx;
@@ -1339,6 +1343,18 @@ static int av7110_register(struct av7110 *av7110)
 		pr_info("additional demux1 for budget-patch registered\n");
 	}
 	return 0;
+
+err_unregister:
+	dvb_net_release(&av7110->dvb_net);
+	dvb_unregister_device(av7110->osd_dev);
+	av7110_ca_unregister(av7110);
+	av7110_av_unregister(av7110);
+err_dmxdev_release:
+	dvb_dmxdev_release(&av7110->dmxdev);
+	dvb_dmx_release(&av7110->demux);
+err_registered:
+	av7110->registered = 0;
+	return ret;
 }
 
 static void dvb_unregister(struct av7110 *av7110)
-- 
2.56.0


