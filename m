Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE734D385
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 19:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476585; cv=none; b=TLle+UnJlPqssf+jn8iTLCn1IaVBH6v3U/hAA5CCbpRFyUOMbkBTxRPUDx9RnFQdmwkegiIzL1x5XeYAl4gEE/udkWYm8ObL9/D5jWCuKJpMPt8BkumuLyI5YrD/iBmtiKSv/fIJJkln3vHxghILShQ+bzXJgwaUh8CxamO1nmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476585; c=relaxed/simple;
	bh=v4NQxhT5NMzRMUtVp7qPUN9pJJ/siVD91UuJKEPKVkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXwdEbup0yYEpvhA6KtZScvC8TUJ0TEbY6HwOMSPW+iHv5ayu4N0IvovtNdN8saxpLb8yZoMFwffNwNq9efIC/y5fGdGiVzmBLLm73FCK8r6XExd2iSVVp+eT2inWY/dPhEVmnTbl2EqaB2r5c0QWiCNrw4zys5sgVaAYRleI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OuFx1gEr; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OuFx1gEr"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gMZRR5Jnnz9txs;
	Fri, 22 May 2026 21:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779476579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82UfFRENsEC95n1X0xB55Daok2D0pa358NkkqsMMIvI=;
	b=OuFx1gEr9seCtC+xz00r7wspM/YpXSl6j21xyqpdMnJD/x+zGzrm3z1IKGO1ySVltm+yHy
	GfjWnsMmooJ2KQCWUcJ0M2VKg8osjXxMwS5lzLo/1WUaFURHwc7+5/Dnq16vrDe5it5w7m
	YdJ+XeS2h4B7vgcEBhOTY7FAKSFQzubSrb+H+la8jICiax6SCI5fjggKaWHvTLHtRZa2RL
	qRBx8FCFs48ug+3v1/gswIhll+fe92qcUbTvUP+U6znUF0T4ACEayXMCWsvcL3wuxbKGFr
	15dbs6aV1qQPHnTuMfsFNFCbbuEivKgxqLPmkdjXZvyexvAjREM/RrloraV0yA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 1/2] staging: rtl8723bs: remove dead rtw_atimdone_event_callback()
Date: Fri, 22 May 2026 22:02:55 +0300
Message-ID: <20260522190256.49830-2-khomenkov@mailbox.org>
In-Reply-To: <20260522190256.49830-1-khomenkov@mailbox.org>
References: <20260522190256.49830-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1ebr3bne97ezrsuggm3iapzcanthzm8p
X-MBO-RS-ID: a72aff1a47be1412a6c

Remove the dead rtw_atimdone_event_callback() function since it is
unused anywhere in the driver. In the wlanevents table, replace it
with rtw_dummy_event_callback() to avoid an index shift.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 5 -----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..6d43948ffe40 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -624,11 +624,6 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	return bselected;
 }
 
-/* TODO: Perry : For Power Management */
-void rtw_atimdone_event_callback(struct adapter	*adapter, u8 *pbuf)
-{
-}
-
 void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
 	u32 len;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..c56082cd5264 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5619,7 +5619,7 @@ static struct fwevent wlanevents[] = {
 	{0, &rtw_joinbss_event_callback},		/*10*/
 	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
 	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
-	{0, &rtw_atimdone_event_callback},
+	{0, rtw_dummy_event_callback},
 	{0, rtw_dummy_event_callback},
 	{0, NULL},	/*15*/
 	{0, NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 8cc96164e1cf..e2fd899d6579 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -258,7 +258,6 @@ extern void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_atimdone_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_cpwm_event_callback(struct adapter *adapter, u8 *pbuf);
 extern void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf);
 
-- 
2.47.3

