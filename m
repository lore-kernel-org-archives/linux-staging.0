Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF24A05;
	Wed, 26 Mar 2025 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742971620; cv=none; b=H5qxAD25wR21Ym9Li/LAq41UJZodsN360SuFtM4pcOleb+4e2ufsRq7SwWT7UlTxKp9jRG1eftljYMEXfKoLeDs6canYcXKpcYNGc6p3EcwudITyXHsqUZZiixM+ILUZiIxVQP1EHQJzQn1KMRIt0FgfbdkBmb5i8wBALG9oRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742971620; c=relaxed/simple;
	bh=rfs2BZ7t3BWRe4MgBwS40Fxv53iK1LxffPws9X1W4Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZPVHTIVNb5j40XGtJhJa4jJbkWLCXkfgBwPAqjwUNq57rCR+n2gsRuzkaV6XoKAOiEibWlWjy9mq/1vKUP2dxUqqCycfD1OBGfs29JacEeBXJNmWpjQwtTstdPd7tolJRr23KEbSwC0QwnrIHUB3UNZm1tYhY6P1LVUNYFG6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEBZsxAI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEBZsxAI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a823036so64343725e9.0;
        Tue, 25 Mar 2025 23:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742971617; x=1743576417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ny5+61l3czR1CA2kOZOSeI2wheuddYkyZQLmEzW64=;
        b=CEBZsxAIo1C4D0m7/mT+qaT6Gd6TXsqR/+VEfzT6SkSmBnfCtOd2nawYdYrY6ivFzn
         jbzL9lsFDURSM1p790kMYOf3W2a0TbColQ02upMY7aC3PI8GhdaINJwx7n7jDpk1AMeX
         q7+NBtaETPsVyQ+83QdaEkejPF8sA9Qn7haG++KD2N3kjMZ5/5VYHQrqVLId35YlykTS
         srJjBzEC9mt45GE/f2Hsq4yQZZ7OIAW4T0KVP9P9EvBnBIsl9ZvkIlY0SOLR54jgjWQB
         d6gtr11pSBvnzZnyFMEBcrF51qzTIR2/lujaLw62lF5/Db/+5HSJ5zfET0OVr3njRLTt
         5crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742971617; x=1743576417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0ny5+61l3czR1CA2kOZOSeI2wheuddYkyZQLmEzW64=;
        b=tfYT5UiNJTGFTYqtraiKhw4pZbl9D7wcxhPh33orEqBuk9IlDG/KTd8qY7JRW03tKF
         VBAr4e6YMtWmTgOZDQK8A98ZE7Hh3Lw4OR3FahKbRkKLz1lpv8A1w8UJxqHb9/2pYhl1
         SulCalUjLM1SNQswF9ZrS2rA2BzBV/m9J7EyT354m5z9W7cbYHM/zXRVlxy+ayEY356W
         S9tZkmTiOgp1pc+sCSWfZU9dGnidgLrCE6GuSROtmyFwNfwHYyZFNzGuXfTv3yLrBY4o
         5OtVstfapOI7EjPoGmAfpiIO7Dz/ONqNFYOymbFjGSAVcwg5zJSYGeSmWUU7JwpVLVv7
         Ut5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYUzrLYYRvjmj2oCXPAZAJiJe4WnOuagsQQAsuxmlsBUHzuZW6g5TxMPkzBzmPhdEzor5NoWFNnuqHbeA4@lists.linux.dev, AJvYcCXkCexCYPy77V/JoFokijzz4oIKp0yr5kQSnFE87bo5bXVyvtuDXKxcrs4CIcjl1LybhL6yiJq/GIlM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7PRalqS1D1+91ibHSS7W0EyefLeQYeW9ASKS35E8/ZAbLtNi0
	wMyMTjVhw6ztHUoMLT3Kydyadi76MU7fn31qEI2ou56Ry5gNg55O
X-Gm-Gg: ASbGnctD3GZ4Dky4rWESGMhbHLTfKtTe2vUK8c1SmF8n9myylC1kYF7sPOhyw5UwwMu
	+FiEAKtqirlkJepCF6jvNJJ2BQocg4agrr3Wz8HAVcHcEXgKn4/qdYV0l7f7reiJOkOPlwjqWru
	L/5IDnrtAw7Lo2hwkcQot5flCH+2pii1/KzrfBLjaQTQ3cW5ouQh9wnCZPQq++dgrtxU35U2XyB
	3wLAcQU/Sahaxed7gjilnTQ8GZRhuZKY1cP5XQJtjZ0t+ZRWe6K44ivT/XtKfWgsYPs9HYnGccs
	i9PKbHkW4aRzcIRcN9GD1IJ66IzJDynM5Kn6oTZcbA==
X-Google-Smtp-Source: AGHT+IE7D2Ij3U0QNaWzufulupKrE6f5+QxvsQxn39MmFMpvn5EuBP413aKBi5byWZMPxUhQOwtkCQ==
X-Received: by 2002:a5d:64cc:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-3997f8f277dmr16680318f8f.3.1742971616570;
        Tue, 25 Mar 2025 23:46:56 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b83sm16139702f8f.33.2025.03.25.23.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:46:55 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: Rename variables v2
Date: Wed, 26 Mar 2025 09:46:47 +0300
Message-ID: <20250326064647.8380-1-karanja99erick@gmail.com>
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

changes in v2:
  reverted double blank line changes committed earier ensuring
  my patch contains uniform changes.

Fixes checkpatch.pl warning:
	CHECK: Avoid CamelCase: <mediaStatus>
	CHECK: Avoid CamelCase: <lpsVal>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
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

