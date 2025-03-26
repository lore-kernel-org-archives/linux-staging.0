Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A11A23AC;
	Wed, 26 Mar 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978025; cv=none; b=eTXqS8Z0RW19yG4XRgcUDKoTf76WP3IhC7rU8RmogSLVC9W3VVDVxaP1FtsNsNEYqF1M4Nmh8zcjhG9nepM0L+A4gsl0+riNXv8juAf41tR0bmpsJb+b6zP833Cc2Ixa1emVooK76SSSFgS3yxtsn13ivYtNFW1VF3xNNw2L8RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978025; c=relaxed/simple;
	bh=tSAgIjlp/S8IO9PaQ5b+0zUYrJ8/WKz17TC1D3LY5EE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=siio6WBwLiCCFqZKvj9DHYf9qAKM+wpEn962Y5Tz47nLm8tWI2atPVbZnATvxY9hDWflO85+LcAUBTfDz+pqDYPVyKR6No4cwmFIaR/amdKuki2peoiMbzznhafjXNn4Yshf2PRie8liUd2INidh+N5ER5v6WIr0mVjaLNloiT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj8UxD+1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj8UxD+1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso55972795e9.1;
        Wed, 26 Mar 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742978022; x=1743582822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YptWzLRWN4G8T9PEhf+CbTz6L757zfOcWe1gCHHyMUU=;
        b=Nj8UxD+1m4tG/Dzib/0qDy8yYDS+Uk33Tyi97B2jl7M6BhdhWZMBI64PcRNETdnmi4
         kIdIWqjmWdA1rciWpTokLOof+4OcBXx1BTprN+oVS6XpPch5pqX0xdLmx5Qe4bATsO0O
         8b/tqxcwriTgmmXnxTRmJoLJHHLTAGUPse27tRwI1zbGcbvsFTViQauYYiIItd1oxdZq
         hR07aVCjTlqDcETY1RARxBZQacDfmhLi+lBcvfyvySHMElKQYh2xZV1u2Tem0Rd6Gvf5
         7yhYkFO+J0P1uVpIM5zB2zAhmKlfDigNJhUs7OEP1X7mEhsIT7EHbHszxHRwQzobMBSE
         Ldbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978022; x=1743582822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YptWzLRWN4G8T9PEhf+CbTz6L757zfOcWe1gCHHyMUU=;
        b=ctp/GaRWud0YrpIiTnksCsKbAaOnPHXo+67aUlRfXOoKXZIyGuOkkdzx19WPXVRcBX
         w6i6cij2MaVrFY90Vpf7AdUU2jG9aXFp597w2SsVv6Yac19CkRl0FegmdveP0beRyC9c
         WrGTbSikQr1EWpHtcaTVsm4sNQPg7x7AVrtKHsCNTT0tEYEqY+K0MCCrj40mBLvBBxy7
         cRX6qCuLWPt1PPfhczZO8n42ZY8MuYqrDfrLlRVyU99aqQkTxs+PZbnNsnAnd/rEQka6
         S/3JfQk6Tq/6VhG15eyvhAtA7rwnPXmE84tB5el3A9HGKWzXgPOGlx9Mv4KIT26g6j1f
         wCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7r1sM05mM0xca26xK3lct6tY8t3iVOmuzTSTiM+PKD0WoipfM35mck1b848hKSoVN5GyPGWQSDXll2YkE@lists.linux.dev, AJvYcCW6RkTvLIJVi6javaHN0X7sQmO0uKJtUrGF6oPOn5N8IxCPv2wrVpSH3JbRXOVtLqlCDMf/WYIFw8gD@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7747hj+E0VI229Kc7QVgBSyo5Ch2BJww6Lq1Oht1u58sEsgUV
	ITAVcgFDvMm3kbh0ekMqo3lvxf4Pg+7XV+8xtuxlVM0qjK6fg3QZ
X-Gm-Gg: ASbGncvD/ZkLh12kTdmzT6y9dL/A3aSJqW1HzMHhc2LAR0tWX7ZWM0Dt9+XyjgAuSJG
	ha/ETymIqcGvtweC4v5t9CvDn4fpNJuPZyBt4IylIbsVyLPmGXIEDIE95EA+k4dA+Qw8VcFgFxT
	3G29jcSFWtmaf6Oj0N68j6SS9d88xgAtusCFXwMYqVVt4FI+96XKtpDs6CUFzsv1D8pNWQIxMHs
	Oh2qqYJU0F8Klqqe/eE6Iq22sL6+YV7auy/1+iszQij39VUVg3W2o/gTCoO0WSOsAiX0o7qK4/l
	HPY9wNLNyX0hkjV3bqZkGKMXv8NNAeaYFtTHadJaLw==
X-Google-Smtp-Source: AGHT+IFGR/5N32FLuT/8q9nzuTHqx03EQhMHCz+C23JuTo7WP+ktMehZeb/v3x+H/xZ8eWy3VAzBew==
X-Received: by 2002:a05:600c:1d92:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43d509e3881mr195372595e9.6.1742978021600;
        Wed, 26 Mar 2025 01:33:41 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f332adsm227297175e9.3.2025.03.26.01.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:33:41 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: rtl8723bs: Rename variables
Date: Wed, 26 Mar 2025 11:33:34 +0300
Message-ID: <20250326083334.13030-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `mediaStatus` to `media_status` and variable
`lpsVal` to `lps_val` to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
	CHECK: Avoid CamelCase: <mediaStatus>
	CHECK: Avoid CamelCase: <lpsVal>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

changes in v4:
  reverted double blank line changes committed earier ensuring
  my patch contains uniform changes.
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index d54095f50113..f4b19ef7b341 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,14 +8,14 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus)
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((mediaStatus == RT_MEDIA_CONNECT)
+	if ((media_status == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-	hal_btcoex_MediaStatusNotify(padapter, mediaStatus);
+	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
 
 void rtw_btcoex_HaltNotify(struct adapter *padapter)
@@ -52,14 +52,14 @@ void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable)
 void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
-	u8 lpsVal;
+	u8 lps_val;
 
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-	lpsVal = hal_btcoex_LpsVal(padapter);
-	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lpsVal, "BTCOEX");
+	lps_val = hal_btcoex_LpsVal(padapter);
+	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
 void rtw_btcoex_LPS_Leave(struct adapter *padapter)
-- 
2.43.0

