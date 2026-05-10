Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304021ABC9
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420606; cv=none; b=j31gGM3YHKU/enCaoX/ctj0iEZGtK28xz2Wb/4fv9f9yuG6k8YsYX7kojcCz4HkSHOodgOPoOb20v3m2fWzf/SnniUR7WtTuxpTT1VHfuZU0lKqg26jp+uyNkbyJ6uqvcfroNGd/+VqSd6aqOvijao5vGH/Nulwvgm4kdt7PUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420606; c=relaxed/simple;
	bh=6lT3o9b210G+pMdcjF1uCKMSjk6y70c1C/aOQNfxmxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONEhQUZkNcLS8+YO8PjZ4bChDBjepXrfY65n5+/t/eG/4jwnaFcJdQkpmsA7X6ZRCCpgD5zNDyaRxxIR4UbJrGD2eNogZK+QmCHFm6ODJCNIvWqRTSc7Z3rz6t9L0UP84KBCLm1Xm5RLPt1bSDhk1nR0xHVvnnfonbyXryrNvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JX+Mijo7; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JX+Mijo7"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gD3wB279vz9txn;
	Sun, 10 May 2026 15:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZLFFKJdORC89IuMPoXSyJOFAzK5FcoKE5yNIy3y6Y8=;
	b=JX+Mijo7AyDfPrmSIi4IfSQlC1hYpN5qG2dqAhNXweReqFsqvTGOq7+Z70+akbY9hrKv4J
	Zm8I9aml+xKnDCyEbnlEOS/z5EyMe1mytqoj4dc0QCclvvzwRV2/XtUALIfTpjHBdiUa/d
	9M/4EXRpCUfvnK89SiceuKetDCJqPot8/BmAcznoOP9W/YAZ7W8Nday0+kEezmVDD1Ke7c
	GTR0H3QOG3IoX4CNlcNGxMBwGw/Ne302e7jfPKHWJa77qO/dzTHRHdNP1MoAFV+CzETLem
	vzjlk19oi2a300LcG2DEZOQhGNrKPeip4y2JLPjwaoYEmKMRiREDZltXauehyw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 4/9] staging: rtl8723bs: remove unused DBG_CH_SWITCH code
Date: Sun, 10 May 2026 16:43:10 +0300
Message-ID: <20260510134315.64295-5-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bd06c26b5b7a24e4014
X-MBO-RS-META: 5ywhsk8td76rrrrwtf5hfw6ibajry457

Remove the DBG_CH_SWITCH code since it is not used as the macro
is not defined anywhere.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 4f41f88908d7..917b80cbdc6a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -254,36 +254,10 @@ inline u8 rtw_get_oper_ch(struct adapter *adapter)
 
 inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
-#ifdef DBG_CH_SWITCH
-	const int len = 128;
-	char msg[128] = {0};
-	int cnt = 0;
-	int i = 0;
-#endif  /* DBG_CH_SWITCH */
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
 	if (dvobj->oper_channel != ch) {
 		dvobj->on_oper_ch_time = jiffies;
-
-#ifdef DBG_CH_SWITCH
-		cnt += scnprintf(msg + cnt, len - cnt, "switch to ch %3u", ch);
-
-		for (i = 0; i < dvobj->iface_nums; i++) {
-			struct adapter *iface = dvobj->padapters[i];
-
-			cnt += scnprintf(msg + cnt, len - cnt, " [%s:", ADPT_ARG(iface));
-			if (iface->mlmeextpriv.cur_channel == ch)
-				cnt += scnprintf(msg + cnt, len - cnt, "C");
-			else
-				cnt += scnprintf(msg + cnt, len - cnt, "_");
-			if (iface->wdinfo.listen_channel == ch && !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
-				cnt += scnprintf(msg + cnt, len - cnt, "L");
-			else
-				cnt += scnprintf(msg + cnt, len - cnt, "_");
-			cnt += scnprintf(msg + cnt, len - cnt, "]");
-		}
-
-#endif /* DBG_CH_SWITCH */
 	}
 
 	dvobj->oper_channel = ch;
-- 
2.47.3

