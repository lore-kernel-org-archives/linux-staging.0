Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F13A1CED
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100270; cv=none; b=ZMqxMGlby+Oc8v6T0ZdGXZ5D+dud1hrMGuAAX516UKY+tEBgyFfF+a9A34FSIu3Z8RlMXXQBZl68yLDwitv3/K8yR9tCh2fm0+HbheT4yqL7LjhnXhNvctJAmKAJXp30OGS3UxOizhysnjEGvxZT71EQBKR84T6Ko+tz4O45liQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100270; c=relaxed/simple;
	bh=tSK3R5OPQYsXrCMfsh526thM1npJCsf1ipuLvolI6tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLGM3mRmAhDTosN7T0EseJEAdo2q6gHBWOv7lzAUSewV88Z+8uaJEb8Hbi5ZVmc+vyfuRpUG721OiPRAPDait1nvdYP4InJOfhMtWHQconjdFoJS0TXvNUDcG/d8wIimdqRIywVhDtLXrSoe1B72wJxQXDV/ymSvNW01xvnXQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BveizFPc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BveizFPc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so1117915e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100266; x=1772705066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fR/XQ3GCqMgFo7Nlwz5fppjYyjYdklKU/FLKvUyXePE=;
        b=BveizFPcljYLG4olrSf+bRDf8XJCFd8RvS+DoRqjuJsrjADnFLaXIzjRpf2MLXsZgB
         6h9hh35s4PNdJHBkrPeFSebX+rNLsdHacK16K2X0TrHIc5/D4zY53c+JokWR+PwC+p4m
         r5nYicpax4yxCF+e5f06slo5JdIKFIGISPWIiMp3P42TGrJqVX12iQmhB46R+xKuXypI
         CTH1C6SRbYJj/ZQj6+PGZgKk3zFe3QSy4sBa4F5BEbMUuJFTbBObWoHPgHNA2bVADaIw
         KjXQYp9s60VJXE21EQFCh1+JbGP8nx8vQ31K+Jgoy72XAxl702L/IKN1k3ZSYvpol0DJ
         A8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100266; x=1772705066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR/XQ3GCqMgFo7Nlwz5fppjYyjYdklKU/FLKvUyXePE=;
        b=TmFCd1gxkJDlONv29Q54PlCnLUSysdR9oGozcLVkxtOWJS7S9K81427LOQvMAaT0bK
         CtF8BoVBWwg5XOMgvauz2ryjkgk6Z/IZNL/cwaOgOcdK5G/OzCydARxFNLUjbw2aMf6Q
         82JqIpS/D+xm7ZJfpGOMRu8E2RhinH+Sq2MSHOeW6fPx38DWM+fvb0YNMui7IZz1pt6k
         QoGnS0zKpNtdXBc0qVPgY58awSDyN/Uma87ZcTVmUxRand2mPYleyZjgKtqayGmZ7WhP
         R/1KMqe9gxmuBYN8Fv6PaKi664+wGnUrUntRqaOy3vLVgUA+6Q8u80KQTwaFh0GfMpk2
         QLgg==
X-Gm-Message-State: AOJu0YyapRYKsn41j2Ksj0paNQQu3smVM/SfVmjq3I0aiApVzMioanT/
	3jGbxr9P/kKHUsS2pJB/FypZPBxq2jH0Mi9xLzlEcjKVH5kPtY3TN97RNjp5IloaGRg=
X-Gm-Gg: ATEYQzzOTzmNqLbWenshafP2v5NQpCfef0FN4MijDAnqZMCFBxy/oKZShbamK3L/xVn
	6ociu2FCY33ofJaYFI5ehTMU7OCW91kJ/XV0YzV9KHs0hdSIMKRpOekq/UzuepYO3jQBQk816OM
	TCDmSgVwxonD7EWzIk/6a6rUTZ66eCsKxPdPbTH7U1jkdiAfH0BcmZZD4GlWtwASYNyrAcKZ+E8
	l1n2q5FK0ysxF0mEK/lX8bpv0xluFeKBRpiApHVb6I3SwCL0hB0/hbFML/CEqaU/rd5qIyc8Zfj
	p/thVTg9vV4FFURkTCait0/bRxe5GAb82pUVrokYpMNzzGxv+vr4z8oIQyuuJWUrxFs1bFxjz4o
	Ty/tPNf+PN20Y9FG4aeWIZm9vcXYmhGBBh/UXXRx7P75cgPePnLOHw5oxrIJka20IlTuQyyEwXD
	nDS1QuhoxLc66dkSFwWTYXStPfDYJUIECSl8kq0D6ArVYIXDDeL9UX4DlJWXDUEHYNWv6kf5Rmc
	2xdPzmy3ptfvHp9OhAH6XuBbsYyFgU93Eo+exbsgdyEWiHBQoVg
X-Received: by 2002:a05:600c:45cc:b0:480:1f6b:d4a2 with SMTP id 5b1f17b1804b1-483a95f6f58mr171624795e9.7.1772100265963;
        Thu, 26 Feb 2026 02:04:25 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:25 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 02/12] staging: rtl8723bs: remove unnecessary casts in rtw_ieee80211.c
Date: Thu, 26 Feb 2026 14:02:46 +0400
Message-ID: <20260226100255.167059-4-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..f26c47cc6102 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -109,7 +109,7 @@ int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
 				unsigned int *frlen)
 {
-	memcpy((void *)pbuf, (void *)source, len);
+	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
 	return pbuf + len;
 }
@@ -126,7 +126,7 @@ u8 *rtw_set_ie(u8 *pbuf,
 	*(pbuf + 1) = (u8)len;
 
 	if (len > 0)
-		memcpy((void *)(pbuf + 2), (void *)source, len);
+		memcpy(pbuf + 2, source, len);
 
 	*frlen = *frlen + (len + 2);
 
@@ -371,7 +371,7 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
 				goto check_next_ie;
 
 			/* check version... */
-			memcpy((u8 *)&le_tmp, (pbuf + 6), sizeof(val16));
+			memcpy(&le_tmp, (pbuf + 6), sizeof(val16));
 
 			val16 = le16_to_cpu(le_tmp);
 			if (val16 != 0x0001)
@@ -1044,7 +1044,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	unsigned char *p;
 	__le16 le_cap;
 
-	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
+	memcpy(&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
 	cap = le16_to_cpu(le_cap);
 	if (cap & WLAN_CAPABILITY_PRIVACY) {
 		bencrypt = 1;
-- 
2.52.0

