Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A058225775
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906149; cv=none; b=a/NB4/S8RpF5ktHYEvWtwlAs+5KXwlAffyQ/2t28yso5G7WIVGO8wm+LIgaepWzDR9FjgKFLVp+AXBTNU+iaz47pQANKrIi4D9ze0rNeFKbHv44ZaPJynjS+WYBniZI0xGGDZCFp0tnA6832mutM8X2w6AKBiXFuH8lYMFiiJj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906149; c=relaxed/simple;
	bh=QGKozdPUj5ZiCQsocssQhpFYvvsCmDrmXPfHPwWgaGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVQuDhR8dyNZy7oVuIgpmjvr54uCYFLV6JVUCGzM253xiC+UsdcZgtn4o1ruw82y70PNixCVW+ISY+jqnyylI5Fn8A5ifqWT97377XIlRMHeghRT5HdsnNqygkAa/SCO07+1wiuRGNE2R6KyMD66UkV1c83XNln63E9bRgpxWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSqv+MOW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSqv+MOW"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824b32875e7so432807b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906147; x=1771510947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69N7yU7PihVybqZx1K3um4uQDuGq0SJXjHJj1NQH/HY=;
        b=mSqv+MOWd4XHkWieBIHfXFBK4QnpHOAGOiOvMCaQIiqGy/AEHhjva0ENLd0HTW7d5R
         SqDvzKmRu4mAfoR/AjIxjYk9+/Wp+Zlj1MuUa22vOnJg+yOrmJxC1My8xRLBr03rq5UK
         lGvIIOiUuVqJ4qm1MmumGfwYUOU5efSXsnblHsNE/f2eBIgPeMH0DG4Qf9AwJu2fqKho
         GKK+O/nwzl8lJq2kq9A/ODZEeOAPBaQ9XklTHpYPagOJGpFI95W7BCRn8lGt8rmFz9V4
         15f7UcWWY/TZxmenQk8XN0mhYK7O4BZ0Af/SfMPNJP3eCpb5Nvd/1Y9SagCRezW8mxHF
         JpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906147; x=1771510947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69N7yU7PihVybqZx1K3um4uQDuGq0SJXjHJj1NQH/HY=;
        b=gIJc9iBTBLQ4w9SZuYFxemcAtAGMhszd/kdKcvI9/oGicD2N1uKVd0HT172qFY1e6T
         rLyMFwprquIPojqM3VManS7o2h4t8CHY671bWmWSw+dEF47irKCKF7aXXAhw1ARM6vT8
         ZzASKBCIgQTSEVyFXZyTWaeskcH48eHDuvXQm3g93ib+569yzpWlvWPJ91E2iAg8T08L
         BTiJRR7IIdKm9laFcvuZ02183mctP7YE2ODkCpQyRb5PVakpJ0MQv6Ya2jRT5qI323mM
         +Qyo2JjkBJLMlbK6ACmIj9qsx0j6wYTZn98I3wT4X3WCbXZELk9DyUsjsIsqoqNBMH4j
         Ncdg==
X-Forwarded-Encrypted: i=1; AJvYcCUkjCJ+5DxkXs02mjYbS1v9/NZWois01eXywOLe84DKEBV76+xVHhf87h9ugJjMswAvwWya/gqm6Bb4t+Od@lists.linux.dev
X-Gm-Message-State: AOJu0YyU+tIb1rEzBMVkB1EvJIpCs+eXnaws0ifxdQiwHoRnFk0FcqTw
	c3YizAofJWkn1ULn9wBt9/nVLYesHLVmXdPtEecj/xkRQNoThwaccGKt
X-Gm-Gg: AZuq6aKX9eNqDoZ28yb8vHrXmRm+JbH/8CfLz2PJhemAuPuuuDT0zJfam6UvnE93KDK
	jm+Z+EkLuRSM04dvh6wmM6HaMCCeAtJ5Mg8jzLjalDVDghnCWuSyGC782vVOj5chhpGc9PiamF6
	oCKOMyJ5UVCicON7VhYVz50vRGw9RsB3tF/q+2sNS5u9P++aqIvt2TDQZimocLZ4VTnEaAyoywl
	16GVe7Bn53uvtDk4I8O/Bz9eDqFhkeKS7D2+QaDqwaZXtiRRCyQY72TxA0+DhcmhpoUoITUx7n1
	8/U00Cuh7D3/jcZ/Am4iB1DOMmZPskS0R5fJEFkxi/dfeGO33fCSSLyGdgAWaZX0kFOWzXzg5c7
	ZQOiZVI2S9OOUX0rIDMAaPncJxJ9EAIMWjHnsWGY+11291z9dYHsDajaVmitS/xImgvU3l7sX4a
	KfK3JqEXN3d1GFnkLusxi7Q5LaHQDxFg==
X-Received: by 2002:a05:6a00:1d84:b0:824:9451:c1ee with SMTP id d2e1a72fcca58-824b3068659mr2141947b3a.55.1770906147356;
        Thu, 12 Feb 2026 06:22:27 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:22:26 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 5/7] staging: rtl8723bs: use bool for traffic_status_watchdog()
Date: Thu, 12 Feb 2026 19:51:29 +0530
Message-ID: <20260212142131.28131-6-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212142131.28131-1-khushalchitturi@gmail.com>
References: <20260212142131.28131-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes the return type of traffic_status_watchdog(),
its parameter, and its local variables from u8 to bool as they
represent boolean state.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: Convert from_timer parameter to bool.
v5 -> v6: Add new patch to convert traffic_status_watchdog variables
from u8 to bool

 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme.c        |  4 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 5cc11e6c7af6..c50a3a2997e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1125,14 +1125,14 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
-u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
+bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
 {
-	u8 should_enter_ps = false;
+	bool should_enter_ps = false;
 	u16 busy_threshold_high = 25;
 	u16 busy_threshold_low = 10;
 	u16 busy_threshold = busy_threshold_high;
-	u8 busy_traffic = false, tx_busy_traffic = false, rx_busy_traffic = false;
-	u8 higher_busy_traffic = false, higher_busy_rx_traffic = false, higher_busy_tx_traffic = false;
+	bool busy_traffic = false, tx_busy_traffic = false, rx_busy_traffic = false;
+	bool higher_busy_traffic = false, higher_busy_rx_traffic = false, higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1239,7 +1239,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 	/* if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING|_FW_UNDER_SURVEY) ==false) */
 	{
 		linked_status_chk(padapter);
-		traffic_status_watchdog(padapter, 0);
+		traffic_status_watchdog(padapter, false);
 	}
 	rtw_hal_dm_watchdog(padapter);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3c6278f9ae13..56d52fedc2ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1643,11 +1643,11 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
 		&& !(hal_btcoex_IsBtControlLps(adapter))
 		) {
-		u8 should_enter_ps;
+		bool should_enter_ps;
 
 		linked_status_chk(adapter);
 
-		should_enter_ps = traffic_status_watchdog(adapter, 1);
+		should_enter_ps = traffic_status_watchdog(adapter, true);
 		if (should_enter_ps) {
 			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a441a..31bb09bc3534 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -615,7 +615,7 @@ extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
 extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
 extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
+extern bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
-- 
2.52.0

