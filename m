Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2623C4576
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388805; cv=none; b=cCGKPVhDDq2nHe+lFlTvUQjZ5E3S6h9HEOulDCVryRb6xGRbIHT88evXhfkBmFIm9VglMQg5B4hkDeqO/h2A53TCNFTHrVp9JWtLY200lbuezneejoZ/uRVYAzijsU2qOWFuJrHHroEitkcY3rP+P5IAxx+yxQN++OPRW3YtXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388805; c=relaxed/simple;
	bh=qx7CV1RKVtA01h+qec5efQYU1tu74ok8nQrTaGFhVG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WslL5Wv7Iu9C3kOQIyvtyWHYaCU33kbs4k4FxOQHtuwdfs9NC7F2Sut05JdXwSHj4M1brE3bURqXEfgFdmnGGSefHe9xnNkouBQW/uRlUrErykpuGz2htChbinspzIV5xTVtCEXwWBKvsOL2nVewUqTDtNpk+KUumVB8pYO7QGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ofNlY//P; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fPdqn8wG; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ofNlY//P";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fPdqn8wG"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gLxzK4842z9v57;
	Thu, 21 May 2026 20:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779388797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nd9sC4oyVu3bg0dT8GaLcBNTwpcdyRALDiH3gmnCJxg=;
	b=ofNlY//PM2wTsc4RwsvNKWA2/rONLRHAgRLiMYnnLnm/46cTqSV193ycncS5OwJjeAArm7
	Vk0f5onvHbSOOKa7t3oMC4QBcVPL64asJuRfpDhvEosz+dKmu1C7YYpzDAO98C0/ThlUel
	W8ik13HsnugHgQlQeAYjY1krazcC8ReRzhFTDDEQ+fmcOEwCXlea/16wv9vUuJlYr4fXk7
	MFAE9fyhPM3e/nL7Kp5NZQSZjtxjq76mYm7qG1ibPQSxQnSGBijdvo41/8Lf5HorAOpHy8
	Rn0Q4C1jagbu6U+qzPPsoxPe4TItfqEKCrfS4ldk7ENILjdRz8XhwJxbLrqHXQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fPdqn8wG;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779388796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nd9sC4oyVu3bg0dT8GaLcBNTwpcdyRALDiH3gmnCJxg=;
	b=fPdqn8wGSCrcOsqAlel1YYQRxgH5cspwbcv23cxYUR+nstGCewjCKRw8s4P9WTNl2lWF12
	eSmg1uv9iWz56+v3vsV85ugdPeUESRXaMnBX8jG5KGn61xHhePvRVnJE/eTrgSWjR7aGrH
	+h8aQeAFlAVnkS76QfWTIv3cVRID5oMSMoFmjM4qoBNt682E2fJVgZXCNG8J8SI6FjMMs5
	thS3FdL6vocWm1UQzfFL9iuyLOkeVHpuBdmspTf2FkZw4xWaQ3+Czq4IAJotzJRKKoT/5t
	cHEHTaDsCgCxcWEkIr97xAM6/ZH4q7JiSPacP9Jc5w+p7Zy9M/y4A73UtZv9NA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] staging: cleanup of sdio_intf.c
Date: Thu, 21 May 2026 20:39:32 +0200
Message-ID: <20260521183931.176951-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 56zys9d1ztyxqmbwswibcqxsj8pz6pts
X-MBO-RS-ID: 33cd247f40a1ece8f1a
X-Rspamd-Queue-Id: 4gLxzK4842z9v57

removed unused argument of rtw_sdio_if1_init()
removed empty lines, added linew where appropriate

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..32a0ee08f175 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -144,13 +143,13 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -216,8 +215,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -250,7 +248,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
@@ -336,9 +333,8 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func,
+			const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
@@ -348,7 +344,7 @@ static int rtw_drv_init(
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_sdio_if1_init(dvobj, id);
+	if1 = rtw_sdio_if1_init(dvobj);
 	if (!if1)
 		goto free_dvobj;
 
-- 
2.54.0

