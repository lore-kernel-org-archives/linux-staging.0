Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04C2836A6
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 03:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778385008; cv=none; b=apV7yeYRsSaio5FQDSklci4423bdGOQss90+5Yx+s205zTKdtIvQasS5oKD6N05oNhA1rnGi6IzmJyFcLbAM7uuBR4z9FkX2rpdpd1xcHooAfBqPoPjf2jJ44PyHXCq7AXHb32hmy/rpxO8fs+mcxsEwhqUABbEYSoM0sTv3AeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778385008; c=relaxed/simple;
	bh=j2LEaAPQIpovnO8bdIO0hn5mvoWAPLTxpWoQTaUIIuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7o4ZUqfzaDRTEKJBYt4MDhHdY8z+Ho8JvT8tsr28ZiTztOPJyohHDUQl0GXhpTXIf+hrbMWqXYoxmAbbDkNhIr/pq0GBNHH3weWrpHt4KX+3ElOq+a3GIY6MPwU7/fcm2sz3iNDliYhK9aOq/AqeZ/CDgVoPoCKXLbFR6+M8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTjjg7zU; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTjjg7zU"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-631b313e3d0so293193137.3
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 20:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778385006; x=1778989806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deRb2TvVfH8Ko1X1t/LsmlOwKWc51QYx91tLHoUjrlk=;
        b=lTjjg7zUhk817t57COUKaTXGRQPKjbWwaErOepGWFs8g/1rGAwPY0jH8p62pN4WUUF
         rgXZFvAtcpxjqciXt8cVPsrTDGC1q7RJQUMu1v63DT07wHPagWbXFm58G9b4Bry9Xutx
         hFHVn/pXXXyaS2GcwzhKYK5802MJYoOitfQshSewQFI0ZYR8yfSCPCl6F6fGdwPLjiNE
         k5AGDtSf6QO9ZuSRAPDyLdOlYJbHf0ntlumbSmtNWEI9+q6vaotZENYrnwwo5ZqtYBWY
         5Nnkcz4t/DpUsltlXqA2tKFi4EHtFC23bSRvd8k8B2+G1c9jv6YtP8Ly610y1cwxxo42
         W/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778385006; x=1778989806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deRb2TvVfH8Ko1X1t/LsmlOwKWc51QYx91tLHoUjrlk=;
        b=K00NejtUw4qdVGnJ6GeNBS6MUvKT3Gi4UDlvJkioJHRjTLjxuQMvdDMc7A9M0AaBqb
         nLNy4CAjOx2x5aHq3xsQZc5yoy8i4DSd2681SNiRPYQwJEPfPRaIlGsA7tAe2Ls7x2Eg
         G4toP8k1nqcF+C1qqpmDlNhh+z00VqlM3ed0+GdSOmFlzvDIc+nPeeYLKnBlsV31qHiM
         S0MVQoajgzxEJODKLIysIfF5bke9Jdy8/WZUK3fRRR89BPeSUgAM2jc+LO+yqwYCgWI8
         75L+M4Nc1HZQLjC0QEaLS+fMoxHRfcE1c/KHpAFyUQsu+7HlNTWe4j5M+a4Covq5l8d1
         P6YA==
X-Gm-Message-State: AOJu0Yx7KR2wD/+GnCMucnsYlgOLDmDg6bhxvfHjUVXQF0mQC3ZMIMic
	TsrqxRJuoij+gJ5vdxqGomyD7e5C7Ogea22ZltBhe2hO0V+G6ick66Ky
X-Gm-Gg: Acq92OGCFxov8ydCh/P+HU8JrzjfZOQfTfI/f1LCovhQlZz+wH+zF6S67vcwqtcSZ6s
	PzUimGxnA6QPzvsisJqs6e38M0MgzyW6DhxiZo23BrbINj6LgqsEQWsxHjBsYnT+S/mGPCVZnV6
	V4AdA2FveS6kjlTuBIldZL637jeVzqklLhv/tEZBUyHbrh4CdO2rx8cdOY7P31stYJDEGBNp4o3
	CadSe5k9aeYxIfcmHnVl4YGcgx4aY3kyMdevm35Zam/V6ez2lqt21SRHcKAcGKImaesEjEwHUTM
	Yt25rn5UQjX7dh5OBNAB9eaOOJCkMSXQnY3rjPcZAcFoI9sRofwMt4wn7+MD17uuwxEXS4dHnXu
	OPYXGrwMuT5yQ2jexCJt+YNPh+bhvzUBt++4jpN8wesx0dCTmrsuWvD0RBWvy0vbJjQ315I7HzW
	p2GHt21lVDhWcEuIgZz43PlY3ynWoa89VS1czYBd3AWUbNq6PUxdRBa7CLWiHl49izJlWNuYeFV
	KqOleZi
X-Received: by 2002:a05:6102:6447:b0:631:2a80:e492 with SMTP id ada2fe7eead31-631dcfbe4bamr1236337137.30.1778385006245;
        Sat, 09 May 2026 20:50:06 -0700 (PDT)
Received: from noahzen.tailef97f4.ts.net ([72.189.192.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8ac0sm3772840137.1.2026.05.09.20.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 20:50:05 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length checks in rtw_cmd.c
Date: Sat,  9 May 2026 23:29:36 -0400
Message-ID: <20260510032936.2852-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix both block comments and assignment statements that exceed the
100-column limit to follow Linux guidelines for readability.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..a401c856c727 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1117,13 +1117,17 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
+	pdvobjpriv->traffic_stat.cur_tx_bytes =
+		pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
+	pdvobjpriv->traffic_stat.cur_rx_bytes =
+		pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
 	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
 	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	pdvobjpriv->traffic_stat.cur_tx_tp =
+		(u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	pdvobjpriv->traffic_stat.cur_rx_tp =
+		(u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
@@ -1743,7 +1747,11 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	case DYNAMIC_CHK_WK_CID:
+		/*
+		 * only primary padapter go to this cmd, but execute
+		 * dynamic_chk_wk_hdl() for two interfaces
+		 */
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
@@ -1881,7 +1889,10 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
+		/*
+		 * we will set _FW_LINKED when there is one more sta
+		 * to join us (rtw_stassoc_event_callback)
+		 */
 	}
 
 createbss_cmd_fail:
-- 
2.53.0

