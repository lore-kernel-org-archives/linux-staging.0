Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08F38B7D2
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975735; cv=none; b=fFXWhEKDE/cYIr8Br3mS+Tj4FP0IYG15+OMSQ17ypTx4VzVoIdO3u5H6EizIPPVJZ02H3Z30czgO6h4RQ+E5lCCZXATeCHw8OL3PprzMp6SVUSG+zLB9OeZ8QLnE09JjgAa/bPPfdjCSLwqs3QJWWqTthAOjkSJHZOjt/we2Q7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975735; c=relaxed/simple;
	bh=Yz09HbUdWA3IkkZo8yyh90S3H8/2fOpRTy44q8ZP5ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fy/oLIYo4LYnByt97GwnDCQSsTvZeC5TVCNRIbJqeocVtgUbuZOQkea8E3HBMKGSHXUMYvyPwswxEEPpTAjza1orN15z5/z28E1g3xVtXLyC02f8L4DMyYBTzyVb0ECsA+HR1QHbqqGGEBaYB6KU8riD4rs5xbmK1R7jeylyF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prudhomme.li; spf=pass smtp.mailfrom=prudhomme.li; dkim=pass (2048-bit key) header.d=prudhomme.li header.i=@prudhomme.li header.b=bz4a/pwY; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prudhomme.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prudhomme.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prudhomme.li header.i=@prudhomme.li header.b="bz4a/pwY"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hg7RD6h8nzXfv;
	Wed,  9 Sep 2026 19:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prudhomme.li;
	s=20260414; t=1788975720;
	bh=Td/WAWgnONdTOLT95dVLAUCdSO+PeXmqpUT6XU7+7BU=;
	h=From:To:Cc:Subject:Date:From;
	b=bz4a/pwY2OmVfTnbng61l+KYROSkGpkXqxgRjyFV/raDW4ECFeHm2TbToJKkLt4Ji
	 udG/5vcTXf1yc/Zm6tpeaQDRARhVM4d402yq7NcSxmEEMsqG1OTFvr37NvBwDij2kU
	 40W+MXc74Wuq+2Zz7DuH8FVLz6StGveZG7PWdv0TOO38L90b8uW6ayrv9+XFlLcPh+
	 kX1ygyeLF/tB6Q0+Ltha5/J5yL+ZjVy622QYVJN1/i990U75Hc6vZGzpWAdD/BgyaY
	 SOECTqfMInF2okHTsjK0SfU3liIYB93602lEkkpmEsVTn7RMCfyyrU0N/lDmFdiu8K
	 KOchqXx64/wxQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hg7RD2Grqzxcq;
	Wed,  9 Sep 2026 19:42:00 +0200 (CEST)
From: Thomas Prud'homme <t+linux@prudhomme.li>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Thomas Prud'homme <t+linux@prudhomme.li>
Subject: [PATCH] staging: rtl8723bs: fix lines over 100 characters in hal_intf.c
Date: Wed,  9 Sep 2026 19:41:52 +0200
Message-ID: <20260909174152.16934-1-t+linux@prudhomme.li>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Wrap the parameter list of rtw_hal_set_odm_var() across two lines,
and move the comment on the rtl8723b_HalDmWatchDog_in_LPS() call
above the call instead of trailing it, so both lines fit within the
checkpatch.pl line length limit. No functional change.

Signed-off-by: Thomas Prud'homme <t+linux@prudhomme.li>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 2caade1a8..1096f5441 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -89,7 +89,8 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
 }
 
-void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
+void rtw_hal_set_odm_var(struct adapter *padapter,
+			 enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
 	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
@@ -216,7 +217,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
 	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
-		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
+		/* this function caller is in interrupt context */
+		rtl8723b_HalDmWatchDog_in_LPS(padapter);
 }
 
 void beacon_timing_control(struct adapter *padapter)
-- 
2.55.0.windows.3

