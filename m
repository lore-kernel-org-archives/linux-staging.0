Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EBD33E7
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949353; cv=none; b=O3F/4StmZF0xHJ6Hq3eAtnVw1M8Ku9rv2SkFKm8At1qrYxXV8hynmA5Cut99eF4sHFs3yve+hxXPK0UnULKj4fWyuY1Q/4IkL0+7Vx3v5bQw/8HhTs6xd7sYhTQfS/9CkDu8ZD2MDslLyCjuHWyouUDyE5Pp+DO5WQ68JWxKtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949353; c=relaxed/simple;
	bh=9fcSU8PZLc3G53yaIKcXU1bm8+vedTHObY8TmTInhpI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UlADaY6EdrJ/77WtJgfahi6mfZoIaGrXR8oH9yoq1W9/YU7gF3dr5Qix0LsK152SVBD9a29xNkmfiAKSTh7r7WcIxtRkgQC+pC+BNxVYc9qvL8C0ifg2izd03YkjMxqaRyJRRV6UAgHmyfJ/aqmqxVLMStoW/blsr3izcEmnOd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAocUEJC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAocUEJC"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-80176a6aac0so146482985a.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949351; x=1757554151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=BAocUEJCp3IZuoU2Yck4xNsIA63HEZMPDRZulorpj/3nq2XuaPSM2KVEGDFDCM2AxS
         7lbD4hW55CGS/ZTxmI/QqveunMLz3nLrs4PbRRT5tB3kexyvwBFAtjQ+YKbJFWvfzPgY
         My8Z+Iw8zu6Wk6Vbr7yX2g9S/FI+Dyj4IXPNzBBYAd4ggbKopttW6NzuJxYH8er7k9JG
         /YiEGExs8Sq26YiaH9sj1lp1xeGUwCqnryxXcBqF1LAoFvWalBpiLADQQxrY1Np2OYf9
         i0rTanA3i23ZGWncn6CszFhKelFCDbTomX3HBDO9Oum/ALho2aDqD4rwJuNjOa9IjIgb
         UAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949351; x=1757554151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMsQLzfREBWexRu+GN5366HpVTxolXnaYPuOdM55sFg=;
        b=MHm+4T4DMpiyCNa/Uj0WSVMdaZH0cHAERhPVYGBzjn8ah9CnhCbVzD63GZ2yhENsqh
         RlUv/PoqdifuEvFuTZhmPMd3jPpa84pmEM0W7WDk2qBftM7ZEKN/IJYlJFX4PN+DtOcp
         RwOuDoLp/ezGl8G5FeFSpRCFm6egzRVhEMUJu7rlkL9QBDcYLBhZJ48RLaps9OSGD7Fb
         q2PRN9z3tuKmfYcGfmUK9xlJ4pQ5e8uNKag+ZIcokUMQEhzpBDeqGONuLAjW+Ad/CD0R
         b+EhVPK5kWg4cVgG29Qm/XLqugu/e7Y1m9LlMqBTmVAt5tpe4u0gdHdJp/24Z+Qgv9dX
         Wt2Q==
X-Gm-Message-State: AOJu0Yy9Nc69sLbHT2u3L8aw2B95mxhkungfBreyHDqkhsfDrpSh2jNj
	E1UpdnrFMWYF0LK/B1q4RSKSgQFHqGMdnr4R4nIqqmkXHyis8K5nplBR
X-Gm-Gg: ASbGncsmcQ1sf6OkFHVnTmeKW8LiMganXYiJ1w7gw0y6xCVqgv3a8iOhFLYvhjSq+Ot
	OHLJ/T+P9Gz/QiZWyAy/t/Nt+TQXcF99AA8j5kDgSCswgz10okXlpA7i6HUtpjatAVRtSdxiP6A
	/WyXRbZnj2KNO8udlTxcnAP21awnDkyUkLocuA9ABdHiuNLozEsGm7eDaes2P0cD2weWwvm4YPT
	a9QLCv9SAiu4iUICL8w3FlKfqSzt15Hy6buIW+BBXn6ezMAN3gSMu8GXaj5TaCjTIidqWUACIu2
	pmuQT5aCnIY96mJKHGLbql80Q/RCgawdjWBijgLKMWqFLLDdIjO3j5tZ5imwOCl7mbPDYKEk+Qu
	IdLFKJcGSKSRjTuyO+PX6Tnlf0m41X5i3OMK6hwm7HXQ9MYo1lPM=
X-Google-Smtp-Source: AGHT+IHnPvuUC3nlAXJVULvaOVMLtqz2tocTpafM2+s2KrX7WNkMAz9X971W9yQIS+h53DhrHk43Dw==
X-Received: by 2002:a05:620a:710a:b0:806:6a46:ac20 with SMTP id af79cd13be357-8066a46acddmr1062226285a.3.1756949350976;
        Wed, 03 Sep 2025 18:29:10 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:10 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 10/16] staging: rtl8723bs: fix unbalanced braces around conditional blocks
Date: Thu,  4 Sep 2025 01:28:53 +0000
Message-Id: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
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

