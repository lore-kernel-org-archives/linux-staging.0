Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80D29994B
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833583; cv=none; b=Bq/wcK48z2AOB4vMTLA00m+fR9oENh86xPJyYicUM0GWCY1bs+cMYzS0FtyDZnz2RaHK/ZML5ajh+G9WhbQleNxCnTOfXn/QUASi9yYO8UkpgM48sZ+VpFWaBJ9gvwV6VhiBwDXbfjBi+JUGHNCemN7NhFkOa3n8u7z+/rmXU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833583; c=relaxed/simple;
	bh=el9qVWydNmOeNIzbGNnXNPiYkxluIHMi/5utunI+8vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YezBk6C5R9TOhfpN55MpPtYumiRlzRVS1UY3YkZ5GBmd56S1YzHKVb2OTt5VMVeDtq7fQLRbmAtRZBaGGB5v5efiqQOYKamUXyx6N/UbBjxV+0y5iF2CE8U/UJBscJy7CRBF6fBUTgFmEOIUDL7LExqf8LXaWMlcr3nKxGgE+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUgoauni; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUgoauni"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e239baecso31364375ad.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833581; x=1764438381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDBzUiyTzJO7fneP3Pb21cquyuVILS1A5aClZFoIvU=;
        b=FUgoaunikp8PlRuhzqYTqoreFNz9xd5fiq5rBREvP4A607qQfcpM1Uw9ZK0MlETb+O
         GxCtAORhcPNTsgELiIbQ/pXnkN7j808CMrbOK63Y52PrK78PR961IN4JfaAcd/XDb4Zk
         PRD7DpqlwCng6oA3BmcHxf1NpIR3JzhhWZuSG+GXpQs98MvWC6Dui0QBzs+BAh+GX65l
         3cyve4NoIg1v75gx8HZt9sKBCc0yWTl8mkXMduBRiPKhFODCq1ghK7dFrYV/SaJGhRx0
         iI0DLgk7Qjh0DTU9nM5O6NBEGcFRMUE+z7gkXvcxavNaGLX4q6XG5jHraXmZMMQNmWyl
         1Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833581; x=1764438381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thDBzUiyTzJO7fneP3Pb21cquyuVILS1A5aClZFoIvU=;
        b=bBBc7PdTVaniS5vfSDqju8e2CNFyoIR/fXTKxL5qq+gbNidy8lejXvSzeyv0jzWWyM
         mIr7g2pc4MTaYBzZ88E4HLUc1fCsnNRDRWNRZFrHnGx4CkvqXJNHOfkdgT1zIbmk6UEh
         2bA342t0jx7yruh6O7xIe23q68b8Buvxr8GlJ70f0k2UIS4YjPbBpRTa7D6jPUTSd6Yw
         0PsV7T8WjGlBf9bUhNOrlZAC7xKaQ24pCD6UkbfVmpiDTQzYg/bZg1NmKpc3/tJNeNK7
         g5EcuTZV6/q8rnbAdUMkKluRsljAzcSm9J/16P5TJsk9ZRz3r4mcRTxEMoub4n+qgXYw
         Nhug==
X-Gm-Message-State: AOJu0YwsOx49VrFcjzssp1fiR2NG//3L2jWh9NxvCAU5DkXiLWe6fw7S
	hedh73Ytqq7mfQOVsHLOt2Qxwmi3foGgJLoHGLSCV57brDFMGV0OiHwr
X-Gm-Gg: ASbGnctyodSJb9YVHPb++KSxKJ2vOjXl8mmZWxxvU9dY14ch6eeHbVstxzPJY9d8a3V
	FRamEUjX/fwjyQgPoS7CHhoPHAMyEpByQWZb7WRdxvo4Ne1Knm2ShM3mDVLQ/tN3AEEFU2OveZN
	LUA5wDYrs9nkIMc1dYyhdm6XKn+86s9ewssIm54ImK/S+6+227KsCWywPYpXef44PT3rur2UMrZ
	OcOFy+xlKQB9IGyAwMqRT0Z8kVjC5isJMlDCI1WfW5NjMQHkK+lNsaVuOXrTHWnc1ciFmNAfNvq
	xzAIpWpgkX3uuQZnOBbBHAsWxaBkowcmSK/Q1Y84Cck+iMmQqwtvFSQSIMmSpjeymr/LAgJp+Jp
	Qa5SzPpdje4I4B4BKK+DeZJuJQyT+9FMuiDI8WD1NDQ7DzM7kEPwRi7IhyWAwzHfkBiCgnUfBAh
	9X6ps6A/kc9cfW+KBvimCgW7n0ksllsuumrH/SblTjiFPOEJWFluqoWgSDCqEjSqQ7fY2Uc0Opt
	lwxq07jQQz7wFT5BJ0=
X-Google-Smtp-Source: AGHT+IFNPCrN2dX5IWUa8SUMrzl9TV4hAj2RqZqhiyq0NRGXltMQMVe20dTIveHijRQPyvjFhlDKmA==
X-Received: by 2002:a17:902:cf04:b0:295:96bc:8698 with SMTP id d9443c01a7336-29b6bfa97bemr60401605ad.19.1763833581177;
        Sat, 22 Nov 2025 09:46:21 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:20 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: use offsetof in rtw_mlme_ext.c
Date: Sat, 22 Nov 2025 17:45:55 +0000
Message-ID: <20251122174555.215109-6-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122174555.215109-1-knavaneeth786@gmail.com>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom FIELD_OFFSET macro with the standard offsetof()
macro during the BSSID copy operation.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a897c433d2b0..9372b997fc23 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5275,7 +5275,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
 
-		memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, ie_length));
+		memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
 		pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
 		if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
@@ -5339,7 +5339,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	/* pmlmeinfo->assoc_AP_vendor = HT_IOT_PEER_MAX; */
 	pmlmeinfo->VHT_enable = 0;
 
-	memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, ie_length));
+	memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
 	pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
 	if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
-- 
2.43.0

