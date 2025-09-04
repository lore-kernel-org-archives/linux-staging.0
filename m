Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E82223335
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952118; cv=none; b=j6TOCGJQE8IVrFUGVN9bPTVVhKlxR0e5j8Qn6v9UK/xQO09k1Zog+8g0mStb+9SJVlQswyQNMSoWnaWHkqTH+hm6UY/8ax2+jXarBpZPTbEbG7ri5EL9wBE6foZccQUbHkXrf0IoR621iklqlQRwWE+ofyQLOb/m+ml+LO/iusQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952118; c=relaxed/simple;
	bh=9fcSU8PZLc3G53yaIKcXU1bm8+vedTHObY8TmTInhpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LXzQfAe1SGtbnRwZr4W4dCv2NYfYQ96Qz+RL0kY12JRThnHlOYMGMX+YBa/Phn+dbwPMkV8jOz+yyscKtE/NrKpIFYjFN3qN2ru7ccEgTvX9NCcGJOTl8KCb1IqTQ4vlhIv2P2xtkZuzaAvTGiR4ckbDKu5GbQLAfHHvMe2kWz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIQ/ZkWJ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIQ/ZkWJ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70ddadde494so4363366d6.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952115; x=1757556915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=NIQ/ZkWJU3jhCifyKZcu0H6itY+xoKEI4VsnliJ8wTrX8WqIuxIYbIDObm/xXUgRgq
         rsgkWXybekvuK4aPLmpcYqqcpXYeD1SV+wtNMXwXrCCNpTEW/XZRPBVSou6fyEDFJOye
         lEFpn9zKF5UsMzrtFWtBXqiUBw4F0nSr5uW2ocGfpJEPN8Wh/NzhxqpkLfa6edjbz/J8
         DX/TTWAKAoKzEMaOZIGChEnrU23l8WxrxEbi/NNQ9TsZu1nvixvCy7SZYnCGfeIV5GHs
         kHPZQ3jIIMqlfpArqGecd5mapdtR6yeWEqeTaeDMXix07uOnVeBfefujmEZHJwQ/vA8i
         dTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952115; x=1757556915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=DgLAfnjPm8xzLvW+mnJMqvZ5uWqbaH9VMZCfHPDStudSFm7GP98cvpusUFy3/ousKE
         OUfwcKbaiXYyszd5DZb95TfBqniM/90f1b/UOMe+B+bFViIpwvKKQYQ9dslmtJFie0qp
         RcivC+AXJYk5Qy9IMg/laYVe4xHA9dlFztXSDW9QeL5/FHpHhirU4iUs3X9pZnir4jmS
         VrrkQWgPPIzrCOTmGp/xd5288gUnpALJaT1P55MHRM9YWWEE22qQD4NkYEaQOpcXiyZK
         4aiu5YvJjytpTQB1ZmHg8DqWXesZ/g8ZsvCmZILoRIAhdeZdHGCn7VeMpFZpaIQ5GPUj
         V7nQ==
X-Gm-Message-State: AOJu0YwUXT9T5hg1MkDDTBSOE+s4EzTwcYCGxkX2pT+oj+bZq8OQNgWi
	ydSjxeHSJcbxEfWiLqY0PQQ0lL2LGrPodgTdrLMeX3bq4Y4fzeGp/K1n
X-Gm-Gg: ASbGncsAy5P+3kSPL4Iofx6yLNNsK0XEZTXGRipcskhh/BrfVEzh457BxZct0AoZsIF
	zrdAi8rFRqYqsiRHOpk21/y1MO0hNzEQfgByajxOmEwsF5tgwpgHPSVeeyKzQlAdmiAv6N1AMYl
	lILYiwobFLskRNgPSKKdKvx0bz0FWL9L7A+W0ltCx/XiQyOBbZacgU4M3od05BL+pGYkGzAUBe+
	DFew/Kdl+54zsbGUPFu0CY7kHHkaVsrQKtk97Z4liQWJ7dg5uK2oTXj3XVXTYiBVdgp0dXWQDG9
	h1hRtTtroiclqD6MgAO4xoX8IvzXHrdmLRBVcUkHWeK9ucSP9N5EsOUe4/bwq+0XoRMsI7FgkaV
	Dg8e3yLsO9x2kTwt8+5o+87JBvwXqvx9sou6KiIsDVDZpHGYPNNI=
X-Google-Smtp-Source: AGHT+IHUXNaffbsZdMbCgX5ExDY64JlgIBmgJ89fMamL5Y5pBJVeELzY7CRcnq2dB8wPzqYZv0uKlQ==
X-Received: by 2002:a05:6214:1c82:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70fac75c92amr207317956d6.16.1756952115169;
        Wed, 03 Sep 2025 19:15:15 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:14 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 10/16] staging: rtl8723bs: fix unbalanced braces around conditional blocks
Date: Thu,  4 Sep 2025 02:14:42 +0000
Message-Id: <20250904021448.216461-11-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Balance braces in conditional blocks to match kernel coding style and
prevent potential confusion. This improves code structure and readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a2b1e34765ac..050fc54e251b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -785,8 +785,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
+				}
 
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
@@ -1674,8 +1675,9 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
@@ -2412,9 +2414,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 			operation_bw = padapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
-		} else
+		} else {
 			/* TDLS: TODO 40? */
 			operation_bw = CHANNEL_WIDTH_40;
+		}
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-- 
2.39.5

