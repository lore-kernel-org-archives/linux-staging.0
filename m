Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2943E4C6E
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699039; cv=none; b=LIUYclaLnpnWDNBAesuI1Oq7dfStsteThtkGAw60PsPGOYaKf9AhIrgOCvQci5peD/NuRUITZUJYcMxin7yCZ2BZCkw9A0GndPApbWVaGXmC5J1uOXedCqwo40uNsZYZVDZ54jOnKVUFnKsy7UxLi7xsrgZXrykz4oSe3Mi3Dps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699039; c=relaxed/simple;
	bh=b9jKvI55pyRI8T7tgOhQXEspXytz33bEe/VOYrVQzs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za1qL41thboC0IVk9v278E6IF6S1kY4pmqIwM9FVyO0RXBuG8P9hve8bAU4yQzX5sCD7VvlNbeZp3b6LL522yAFjUzNc8WWuhei6NeUJgpihlHcXCRPaAR1WV6IeMZAeD54bAV1pXqut2G6C7GrBRzzR5ciWEZ1gI/wTsDmM71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VCQxcX81; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yrOGmjHb; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VCQxcX81";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yrOGmjHb"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gP8jG4F1Wz9vHw;
	Mon, 25 May 2026 10:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8ZQsVfCG3xV+ni0ayEcP7BewyBBqjKUQqUvk6BD3NAw=;
	b=VCQxcX81hj0HK8tnZqGE0HCbRoAOdqYXGp6kFrXFTlxwgcid2UPVWKRrk2mWFg1dPFLShC
	oIK2Zu2OXSnxgo7/8994/wsjfaCYVScYrGPs6V9Yc1RCVOnBm7jTSjmQqHmhP7UaOaICXM
	0nbYxp48yRG+x9odByR6c/pEUPsczcnhF5pi9f+SUGR/wcQpoSeGIl+TpSusJ8P//hbNn5
	Ex2XunCYwPRigcMSrwaQmNH9VE0Hsr7LTxFWfQoOtOEVSza4WeU3+hYepQnciKy0+OgNim
	9T6Dw2+DuOlIDfSn1LF+ZUd4lkuGqa2Kj8tdh8tA7t4X8ASWjYm4mILrRlDeCw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8ZQsVfCG3xV+ni0ayEcP7BewyBBqjKUQqUvk6BD3NAw=;
	b=yrOGmjHbBcF8/NAmrtcXxWnxHOtuO0zNo+NaRqZUGEic+qsfI3U+p11C2QQdPuR7ljfXP2
	tUrvpQIhMLwKQEQa3P0okzBMPEQlrWQm1rjgqomxVHVgeiGUK+Y88NfKRi8ZPAxP3b5QkR
	W8hxZNWeSel4usVKnwY8zGJEy0bvOZlyfbTp+vkcFg0wu5prdsBE//LlxHf3fEBSJehccS
	6GDmNmY2/BQadExND9xeMKYyqIPbctmxmejAPPgjMd9yU+88FX/YcdiqO0n4hi82AKqi20
	mQtdvZ1qnqfeD9+IiIH2nLUZ+EixwokNg90xFcP8rBDSyO8Wu6EKRS+4kK5FYQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 1/4] staging: rtl8723bs: sdio_intf.c: refactor function
Date: Mon, 25 May 2026 10:49:57 +0200
Message-ID: <20260525084956.215254-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7008381c30f6104edf
X-MBO-RS-META: ibghmmob9u8kc7a9c6xssnfciruei7mh

Remove unused argument of rtw_sdio_if1_init().

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..ff58923e43f1 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -217,7 +217,7 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -348,7 +348,7 @@ static int rtw_drv_init(
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_sdio_if1_init(dvobj, id);
+	if1 = rtw_sdio_if1_init(dvobj);
 	if (!if1)
 		goto free_dvobj;
 
-- 
2.54.0

