Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8D2882B2
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770881147; cv=none; b=WY9Z7E5y/brIvLMFC24DktDV30FPgBmB1r4cwWIq4Q5IHViD8rgj73c/yJOZf5q/NXznJ3LJ4g7Sn/E6mx+g0owIMov4u/UfdwBGGC7BJx192ICWmfl5+BuKxnUsHU3osg7PcC+7INuT/NyROSpS8S7oVn9PoDXiYXF49Akd7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770881147; c=relaxed/simple;
	bh=iSUzWAYBvhYA53eM14Oc3gXRQJr/OlpojgicTVzT/GA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q3BI3Uu1kFFfLNcvfa7qs+QYyJDiQSEXmZiFaREiC6rVoSN3AiPOaM9Rma2OXk132t+rVjTzp26EZSRI284AiG+Wm/Go9S8ZbQy7MDY8wgt2JVJcHOGlKR0+yRj5tF689LwGERwUMYRvbfy9UukRdvUXxPEComdQqJ7HwAFI11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHi1Ee3y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHi1Ee3y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43631742db9so482814f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 23:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770881145; x=1771485945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7v9t2sM9a3r+55iUctvgQaEwlOSsa2ilwQWdKZ4dJeY=;
        b=JHi1Ee3yeBrAXhfzdqH5IZs3haUngxMySHNdk+jWDyW0HQuht8eLPaUBHGXnzODGSH
         wL+RNtDditZ8L2nXhxw4JH/vt5Quz2seAlKxTo4ob2vA/YWZTNQ5iiHVXAnHUnJiCE7M
         UFGHa6S9nrQ3dtOXKKr/ZbQKUqepujesAmHdW2gMFjcVdvublrHbL/MYhsExvCYKGFsY
         MD9xIFtUzHKjLy2It95NwY5L6jPyZONRHIQ5tAxyy/YWXWzZgCePZIFfRi4NM9yV3Mnx
         Xp2IBMKG9E2jO+hW5/tCktYtoZFCWqu8KSxfoCDsWJTHG4cpWI2rKPrd0LMuyObRa8io
         rRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770881145; x=1771485945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v9t2sM9a3r+55iUctvgQaEwlOSsa2ilwQWdKZ4dJeY=;
        b=wUS0Rz+MAk8efuTEjq0j8oDRvzXGCc+0WBPuDxeVDvPAsnMPPZ8ZhVRzdyuG+5sOuG
         cc5jw0x/RGLXQKimmSt7k/K6S6kiQTQ0zqKxegEy21Lq9oI7uTqCBCs/v03eu1D3iXl/
         BwVyz5Gg0V7oWVPoffMmybgVWvtfZXGeC0SHcpHj0IJ9/dgfN9MfZvDYKmK2g6y2o5OT
         wrx6uma1X1vVsngEGEG0S3DlD7LVm4QcREWFOvzjxbplBUKyWedyQMsvavKxgbDYOAyj
         2RyLXfcQGLa3cpGIe+0EQEQm6PwndAkQdY3LKeMZc27oN/pwsg2FJboyzHZ4Fzy/+QI/
         gsoA==
X-Gm-Message-State: AOJu0YzqrgsGwTMBCEdeYm2RVkpPK1FSmiMtd1j9bZdiMNOEvev5nl7K
	f29mreUt+qU/Ji7Zw357b5TiWP/ypBre5+YtFsC65Q5LJghAyrwVlt4K
X-Gm-Gg: AZuq6aJpDhjNpTGiARDlCg7s+z2Q/PmIPLEqh5oZ1Bnh/xnkjTiQheSVapiuprBt9Mn
	ceIqSOeDZfM5247j3bHukTP7EJ+261hL0/1Iamdp2eRshuSNrIrLzkmvBB9ikgxQqCR6+A0tzjf
	pDw4TSfiYljZx97MpyH8GX5pylClfKghthb7NU/WVCOKuyHIn16SM4yXm18GgztzfBudACHiyJ+
	Kf2P4KdaMFgoDzUSoVDUHX+4p3ZRrFugl9etSVC4fm4S/7QJpDDw9LkMwqLexTO7VP4xLHtMR9z
	2V2JIDwND864ZiAkKyPXt48JRAA2FBs5cDDhPZCXldjqi3qqBdsQX7Cf+BruKvBD00qtDgLAhLT
	deUmTJb5+8kdvzUuEkWjZo0kOKyjN+ABVOErnCKRtsVYfc2JN+pFd3mE3ZQUU1a4zMPqTWReVew
	tt2EyjWWjLCfVK51YEKchQgp/pvWlIum2ZRxJvBMwdGrvmXIOWqkY=
X-Received: by 2002:a05:6000:2212:b0:437:73a2:2d32 with SMTP id ffacd0b85a97d-4378acecac2mr1838493f8f.2.1770881144502;
        Wed, 11 Feb 2026 23:25:44 -0800 (PST)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d46f9csm9558571f8f.10.2026.02.11.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 23:25:44 -0800 (PST)
From: Rivka <rivkab300@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rivka <rivkab300@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase variable name
Date: Thu, 12 Feb 2026 09:25:36 +0200
Message-Id: <20260212072536.2817-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pht_info_ie to ht_info_ie to address checkpatch warning.

Signed-off-by: Rivka <rivkab300@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4..9ab2219cd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -802,7 +802,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1097,7 +1097,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.34.1

