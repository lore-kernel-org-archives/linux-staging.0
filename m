Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB147B405
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119826; cv=none; b=K4EstLTLYu2UkgalU0cD/48t/3x/bSNSdQYcNgvi+9yPD9y/McfbneHis1DwhNXjCJW1iHSiV6rvUmTmXR/89JYK4ek1agub5EvqeHeyAHnGFzy4IG7QhzLLddF6nS64tVLbYdmvzkRI1bHrP4usV7KBKe/7BfqiDyAVjP2ARqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119826; c=relaxed/simple;
	bh=p5BJJIFOuCH2FQBegzzB8r2HroXxOgZWU9yO98C8Bjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdgYBxVfyo+I4I9fagma67xyxDuEB7S8Nr3e7egtOBBzAn4czY7yxpJjKdEoAwa2NcwB33f3SyAyKRbuQFfUXLen05+tLdhve5EoB5AukBhYdUHHIrkBDiGTIYcQ/KjDT7vjyEC/IjsB8Z1p6HyEgKoGTkhz6Z8bh+FHrAViMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5Ub1l2L; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5Ub1l2L"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1548085e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119822; x=1784724622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz/T7W3ofqiKO6uuCg8rzvGuRQTBtkTYjUum+zV4WC4=;
        b=I5Ub1l2Ls4489rVrHRh8zxznZW0XliE1k07o5hHzl+Eq05MzTm9uBbCDk20cPdJcYA
         pTp5UflgUT24OsPtm2x7WTrYApbCdG9DvEGSvHRZ/Wcx9OuVGpi/OtivoxHlnjY5RyhH
         045gttYnwB68NTGIKmhcryaxp31yUSm4rEFylifT+KUDv4LGHls0rCBPtjBUcsxQt9UJ
         kTPge45acC3MgkE9Asglh+hRggbc2YWoruzvMWzV+vIG8sZriULPo330UlyIAj3+c7X0
         sE6IeqWDYE0qeyBA8JtIvjerwKweO/Oi6x3zP7ReCoY+T6UCHHsqjtoubIHX7Xaa6esB
         ddew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119822; x=1784724622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz/T7W3ofqiKO6uuCg8rzvGuRQTBtkTYjUum+zV4WC4=;
        b=DrfP+Wd6o+uMtpjynjZ9J+erkrY2Kzj3mIHH0swPFWmyrfwUO5lAA9e0LRc7pS2bu0
         t8VhxDpz8WTMn37Gl0UUvODblG6bdWWiua9DiNdHWZfxeQRcjaJjK3NMOzLOFfBtpi46
         LhWxzN0NB/8XuUsP5pe06YVvBBeWPwp3Fbmdx3rAHQrngfiT6e+2gbdQg1lbHH9VE9G2
         bq+mXztxtk+TYXwT3c8HY/GZIoWFX4JxXNCQUgcvOY81Y5gsIhMbyur8P8vujH5Ee1bk
         4Uz9MyJpUeIUK0sNlVqXIP+Hm03tR2OJYcIWimMG9vjC5p+74Huf1F+80yaKz3i4N6xl
         UwBQ==
X-Gm-Message-State: AOJu0Yyjy0O53P5RkQhOVYY3BteAv8/ImtJRBMO1GmxFOMd8INaYvtpW
	+UJJdcLa3mntEmfUKfyZEnEX9fS2YPuzBpPbJ3y2UDE6FNRlC+EjmfAi
X-Gm-Gg: AfdE7cket0fNaEUBJDtbCFbN5Ink6ENhRyYn/AbNiGWzndIktmiJfm01VedAjl/6r58
	pvMaRBXgatKX3hvKbTkDXWHnVhONdXLpKUUK2GGuysxmi/kh+875GFy2PYvZR4BNtsJH/fWvsp0
	PzGmkloRzD2pmwHULOnnq1qHlgRQDIMr+Msy+q30IIG7BbzdLHce+1UKz+aLGK/ZHBDBINBDsUE
	A3ZLJ0tPD3BUx2h348Uzl5ksLH/yK9ALqcqR8RIjhwIFn0WvSlPO6UVJn8dy9+fscC2GOU/wRWg
	hfxsXZ5HN1R+l4gdDXZZgQPoiJyevokPn+qa+wLzvBOEhCtdXF2lv4cqdZrKSxDi5isfMLXGL4u
	h7KBu6a/MDpPqKR4hptN3fWqxASm7KmZeKzImrC59R7NkOA+tKDB5ra1ZhUBfVpQaUG9KIBKU5C
	eUNeq5ohJftAOChONo+9nxh72xPvn7Km5siMx+K9t7tKYCOYYB6FD1j8kLc8xmQ8lbH629I5f38
	ERQ0D+mqa9zmw==
X-Received: by 2002:ac2:4f09:0:b0:5ae:b764:3b9a with SMTP id 2adb3069b0e04-5b0236b253fmr5070457e87.46.1784119822174;
        Wed, 15 Jul 2026 05:50:22 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:21 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 09/61] staging: rtl8723bs: remove unused set_csa_hdl function
Date: Wed, 15 Jul 2026 19:47:37 +0700
Message-ID: <20260715124829.90290-10-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function set_csa_hdl() always returns H2C_REJECTED and is
not actively used. Replace its handler reference with NULL and
remove the dead code and its declaration.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0c8fb2754..9f1efbd25 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -149,7 +149,7 @@ static struct cmd_hdl wlancmds[] = {
 	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
 
-	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl) /*60*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), NULL) /*60*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*61*/
 	GEN_MLME_EXT_HANDLER(0, chk_bmc_sleepq_hdl) /*62*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct RunInThread_param), run_in_thread_hdl) /*63*/
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e1503b054..aca6111ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5787,10 +5787,6 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return	H2C_SUCCESS;
 }
 
-u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
-{
-	return	H2C_REJECTED;
-}
 
 /*  TDLS_ESTABLISHED	: write RCR DATA BIT */
 /*  TDLS_CS_OFF		: go back to the channel linked with AP, terminating channel switch procedure */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0f606357d..a0124eee5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -646,7 +646,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
-u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	/* Kurt: Handling DFS channel switch announcement ie. */
 u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
 
-- 
2.55.0

