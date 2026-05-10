Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A438F633
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420610; cv=none; b=lyou8Q3pBj46WKLMPJgaW4cBkvF47XEYh+bMCeVL743hgra6K03mEnn1Vnkmv0jpqUNH1r7Csbc+CEChYF3C9+sP1/6ScVYBBfxdLKZkqEIzwEfSFWbSKvaVcEeMDDs+7YFMrqJW/ff2zDC5jEheyl8sdaphRh/0LLPkmQaaCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420610; c=relaxed/simple;
	bh=QZ4ZpoEsWg2JPlTS3uPdH3f0ykN6O9n/23e1w+yMxgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCrAt4N7bbVOQIeDoEIX1nNggc1xJBi+UJTysSFWJWs0FG1Wbju4N/8SLWDE8InZPP4NXX2I8npDiNrGtZ+cpyhWg1G+ARt/U4Q0+CM+1CCa7D5Vq2FjUKWbVrCbGcErDwjMfwA3vqYMRau5f/+bhTrEpgkoeOVWGERtFfZRvFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CbD+/3Qw; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CbD+/3Qw"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gD3w74G92z9ttW;
	Sun, 10 May 2026 15:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uj4uLw2tf0afkyYc/VXmS8fox21z4Gry/pRhzjPoInY=;
	b=CbD+/3QwvMntqad+bOBglai/lSHF0KT/FDjUYJhMNskczUn8ynmDtf0S86EfOiYPD6wrBD
	JCgX0pqr/lZbqL4LNV8gK92wLWl1jR7Drd/f+qdPq98Nym0rs30FtMDZSeezAFOjh149vj
	SiLhPyiKilRQJTI6lOMyzmecu96VR/asJFdt33/XAySa+7qJGFfXnkGvzAY1RONciuM9F5
	lJ1WoI2+qj8PK9uCDmetCx8YIesgllChurNMVviDR6gRCgn29kWuP9YsFIztdbhazvT9ub
	Wt8b+YXUtBxzDX4WZTgKr6X+ZC1YjQLxA2lEL3t4uZbLaBBqTCrFpPE4ppRPNA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 1/9] staging: rtl8723bs: remove unused DBG_FIXED_CHAN code
Date: Sun, 10 May 2026 16:43:07 +0300
Message-ID: <20260510134315.64295-2-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cd5b2423f25dc9a8098
X-MBO-RS-META: m3gcxxsqmyzfurksjmajsaa88jfyx491

Remove the DBG_FIXED_CHAN code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 14 --------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  4 ----
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 67570b81034f..c966527c0ca5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -398,10 +398,6 @@ void init_mlme_ext_priv(struct adapter *padapter)
 	pmlmeext->chan_scan_time = SURVEY_TO;
 	pmlmeext->mlmeext_init = true;
 	pmlmeext->active_keep_alive_check = true;
-
-#ifdef DBG_FIXED_CHAN
-	pmlmeext->fixed_chan = 0xFF;
-#endif
 }
 
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
@@ -3750,18 +3746,8 @@ void site_survey(struct adapter *padapter)
 		/* val8 |= 0x0f; */
 		/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
 		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
-#ifdef DBG_FIXED_CHAN
-			if (pmlmeext->fixed_chan != 0xff)
-				set_channel_bwmode(padapter, pmlmeext->fixed_chan, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
-			else
-#endif
 				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
 		} else {
-#ifdef DBG_FIXED_CHAN
-			if (pmlmeext->fixed_chan != 0xff)
-				r8723bs_select_channel(padapter, pmlmeext->fixed_chan);
-			else
-#endif
 				r8723bs_select_channel(padapter, survey_channel);
 		}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 95769f90d196..b37d08bd5a59 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -416,10 +416,6 @@ struct mlme_ext_priv {
 	u16  action_public_rxseq;
 
 	u8 active_keep_alive_check;
-#ifdef DBG_FIXED_CHAN
-	u8 fixed_chan;
-#endif
-
 };
 
 void init_mlme_default_rate_set(struct adapter *padapter);
-- 
2.47.3

