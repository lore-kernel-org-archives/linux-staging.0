Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C633DEFE
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699964; cv=none; b=WHEpf4XlhBRNe2J63T3jPA7DwsMzYvVb5cUv6WQSdS9Ea7Kl+6lPdrXH9woDqz5hn2/x0E+qQGFdRPWDyknes7zeidAdivgRzUJ1ih366CIgGJ9XnxKI2X6kB5YVh961Y5uE5Q4K+V3Mp3GNtlIeXcEKLp7+SJS1IrvBSBo3NoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699964; c=relaxed/simple;
	bh=QJUg7FLbFnQUG2YzTqHy7BGeo6je8PcoF1Z3xw4s04E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFEHnIe2MzFQt8xDg7LU0g5lhTgrUnrTz6v/pSSgDwj8DwTNFZ5i0OQ1E6CrHnn6VJAlRPOma8A03oiiCdFjKGmhlatzURXd63/Y1Xgc6998OFsfZYWOLlVv5vJNkcF0UhTgrKwv0KQOcVgXeL8UUL7OdngoxCw3fer0NEq9iog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pmi3Jyys; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=efOm3w16; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Pmi3Jyys";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="efOm3w16"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gP9365C1rz9tGx;
	Mon, 25 May 2026 11:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3HbPco5MtraARviEzgvug4kKOI728hoNgd/++kThKA=;
	b=Pmi3JyysljqCTIEFomEtamjDUEkcv7BCYYYyQxh9v3sfua55bguAjMXbbrHYo2gxGLKLfZ
	5//W2Sz5ygrAKRfGXd+KxDNzeiiSOJSaUSdB545RQ8dNA6teumlZsqqVWdLalVKGHm12t1
	GSsW1SG3KTBn+lT2ZVJUOnHL/gWbxY8UqGuI1AYf77hyhXvqERrp4aRr3De9aizDipywXr
	avkUu2GXSD2PCSiybqCoeMOxl3ww6IZr1FJvvXk4Ybe3cgTqHpD84RATRUpiehqCvb+UCF
	v5Iath06vIMRBZNcPeOpRjiEYt8vAGAY1tJ+raWXcAX8WOdeZ67UhCnWPBU96g==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3HbPco5MtraARviEzgvug4kKOI728hoNgd/++kThKA=;
	b=efOm3w163OL4EQp+Stou2tZZ/LKg3phfttQd1d87IT+WQS1hhUJnVBPOGzuxyJ/q9yNLA3
	lVRJVuCpP3QsELxkO3iIUAVrFyEaA9lGWnomGqL03r4cM733n+tuITtP4u/WtXrNv2+T6k
	GqepyBl5KPE0XtniiH8m3UFK618v4+H7c0jFB9Rm5TRSDYJpEheTBCLKnDee+T2kfYhc1p
	1O0WRDDvBvR5GXDnOegPKzQMTFPts0dF+sJ/7aBFEr9Q1Sd3GWp5ad6rgy+sGNAR+S2BKs
	5Cwx/qpiyEli+w9ukv5gk4GdxdGfqjktLCOEpYzVoXxzyZLyeLXe4Rqm6NDSVg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 2/4] staging: rtl8723bs: cleanup whitespace of sdio_intf.c
Date: Mon, 25 May 2026 11:05:42 +0200
Message-ID: <20260525090542.216591-1-manuelebner@mailbox.org>
In-Reply-To: <20260525084956.215254-2-manuelebner@mailbox.org>
References: <20260525084956.215254-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dzj96kzbsuds6mjqjtcqm5smrh7ge5hy
X-MBO-RS-ID: 55e1daf2f9d7a662b20

Add and remove empty lines where appropriate.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index ff58923e43f1..63ec486f9a34 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -151,6 +150,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -216,7 +216,6 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
 static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
@@ -250,7 +249,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
-- 
2.54.0

