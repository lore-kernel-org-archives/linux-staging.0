Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4FA1F7916
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 19:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476585; cv=none; b=h6idepDo9wQJuMPIBsDp9UPo3ISmPclxwNCyE0zZznmra51vD2hUuBGZ8cBifWwvVTHWrv3IDmJD2N9/jHe4weZulTMB/vgQmPDfHrvVC7721KOWc/y1oyg8odUyUwh3u016ld/q9/QQZpIqoflFoEhdKTdLZRMEamzTzGF10C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476585; c=relaxed/simple;
	bh=bHEP2/PBGQV/NK5I65QMqZAWCBFAasSgtXfJoyLQmIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTk8czZbJtjdtpN2TqULhqyjBlylVzfWqn/VB6n7ZYekaQqSPtPrmFNyFZMV0d3tqKi9K2UGTiTWiwhYromEsbtp0NC3ayeglRQjuIA3HpOATooaOVe5/E9gtJEAMsxRSXN3iGkkfL7wgXhPJIizHy+iEx8KRSgH/r7Zuhk4ALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WSK6kdde; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WSK6kdde"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gMZRS4Fwpz9v7j;
	Fri, 22 May 2026 21:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779476580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yl72NLqB+cSEfWwLSHGvky3QBgSyCukNK1sP1jhGtfo=;
	b=WSK6kddeaxqC4vdEQoDZILHDsfWN+5Uf4e6gkFLNOE/Qa4wp8ifFaqt+RJwGhRQc3wttXy
	+6sYa/mqwtTi5XoajbD1xr0E4M0wjPoHbrYDwOerxmaRRWsBIuy9huS2fqEx95rbw3TmJQ
	BmsityhtOk5XuzLTlGjWd4d2qxS0ak+mgP7xFqkFS+6UbECaZkv10WNurkoATIPIP+6ZVP
	ZcZIp8pAvnyG79ka03NFpRZuD6XAQJ4ZLlyGHpp5jHsLYNueIs7dzNieJvPHFc8mYmVLmE
	yqfq1u7OPBDLvgLrAbQSmGxaM960rLUdaPMN6kBzqIXsO3qclOVW1bOohnx8eA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 2/2] staging: rtl8723bs: clean up wlanevents table in rtw_mlme_ext.c
Date: Fri, 22 May 2026 22:02:56 +0300
Message-ID: <20260522190256.49830-3-khomenkov@mailbox.org>
In-Reply-To: <20260522190256.49830-1-khomenkov@mailbox.org>
References: <20260522190256.49830-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xyhbd6psq1bx6uayj9f7gk7fn7hqcm9j
X-MBO-RS-ID: fcfae528e03b4f09cf3

Clean up the wlanevents table by removing redundant
ampersands, adding all index comments and aligning them.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 54 +++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c56082cd5264..eaedff8ae2e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5605,34 +5605,32 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 }
 
 static struct fwevent wlanevents[] = {
-	{0, rtw_dummy_event_callback},	/*0*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_survey_event_callback},		/*8*/
-	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
-
-	{0, &rtw_joinbss_event_callback},		/*10*/
-	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
-	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
-	{0, rtw_dummy_event_callback},
-	{0, rtw_dummy_event_callback},
-	{0, NULL},	/*15*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, rtw_fwdbg_event_callback},
-	{0, NULL},	 /*20*/
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_cpwm_event_callback},
-	{0, NULL},
-	{0, &rtw_wmm_event_callback},
-
+	{0, rtw_dummy_event_callback},						/*  0 */
+	{0, NULL},								/*  1 */
+	{0, NULL},								/*  2 */
+	{0, NULL},								/*  3 */
+	{0, NULL},								/*  4 */
+	{0, NULL},								/*  5 */
+	{0, NULL},								/*  6 */
+	{0, NULL},								/*  7 */
+	{0, rtw_survey_event_callback},						/*  8 */
+	{sizeof(struct surveydone_event), rtw_surveydone_event_callback},	/*  9 */
+	{0, rtw_joinbss_event_callback},					/* 10 */
+	{sizeof(struct stassoc_event), rtw_stassoc_event_callback},		/* 11 */
+	{sizeof(struct stadel_event), rtw_stadel_event_callback},		/* 12 */
+	{0, rtw_dummy_event_callback},						/* 13 */
+	{0, rtw_dummy_event_callback},						/* 14 */
+	{0, NULL},								/* 15 */
+	{0, NULL},								/* 16 */
+	{0, NULL},								/* 17 */
+	{0, NULL},								/* 18 */
+	{0, rtw_fwdbg_event_callback},						/* 19 */
+	{0, NULL},								/* 20 */
+	{0, NULL},								/* 21 */
+	{0, NULL},								/* 22 */
+	{0, rtw_cpwm_event_callback},						/* 23 */
+	{0, NULL},								/* 24 */
+	{0, rtw_wmm_event_callback},						/* 25 */
 };
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
-- 
2.47.3

