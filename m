Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338232BF26
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769946016; cv=none; b=jOKDjjYNT3C2u50mufokexRG99tSVYSupuIcWjR2008LhtQtNXIOzdtQ6AQVcKuj9Mruma4Nryd0zjjVrjRKzy+fOhTGPMdWL7NqGtCtwVhJhk5rhfU5zPiNT+xYaD53IWW858PR8fnDE5zn93AokLwT8aja03LZsTiqcM1BPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769946016; c=relaxed/simple;
	bh=qe8eFPgsqvNqJ6QDx27xR0PTuugEHIEOKSmTEkT8Kog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBdyjlhb976qNQVKKtR5slXM6Eklt4KsdgddMaEbsfXgC4YI+oYU94IQpdNhxYbT6KfZskpfzlvohjJhpC75JJM86/tvaX2+R4RNsGAstPm+k4AsTvRsOGBAXDSOYe0T51gzRAs+bzHdrDEB3L3ek0vx7eNtcjvm3n1J05ihCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO6bGPPu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO6bGPPu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so3519562a91.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769946015; x=1770550815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwpTkEgA8CYzigtWuNHN2tV3pXmflhzy9Fi92GAaHfE=;
        b=XO6bGPPuG776TnsgEW0znjav5HK/q1UxWrMXmzBkKO/j7Bso0s3YVvakJQwdMfcht8
         q+dfDVmSWLRUz4rpURUpciOFuIQLa0XFXTNpNneSlH82Mk+sXwuohnwc/4GLOFsVRNmZ
         G5qB0C2rzzSzHqZxqZLfbtZG4RikAgowXRr6aMwz3PaT0Tc/Nf5FOaiNHWAZmbCH386y
         Agc0a0hFvop23lKgQunS9ibd5dzQiAuTdxNoVmH4Yg0WZXkgW1/d9bp9a+V/9X27oILu
         FPohfGhSkW/vN7VtVl0EyoCGA3HhRJXljUZOzrfUGsP1WueonSZy0T9tq7uxFE540bfb
         IOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769946015; x=1770550815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwpTkEgA8CYzigtWuNHN2tV3pXmflhzy9Fi92GAaHfE=;
        b=LOuCwAC9eolGTqMtVw0JaUV1T4VtvwbC8ad4cJGG1pn+k+09zQuM6XpIw3xIpzo95L
         JnzzflbxzhZJvYhdNGajNMJkEjSLD5OqMaKSG3clfgo8OuLVtHy7Lc0Q+vTprIFfXCp0
         8fN3lRENpHAbEQdehsj+NiRJuMcuiSNdZjj7000U/9liPTHJu8mvwiBbJgRL+ICQGOrl
         YaCr9cvPLxhi0FkRPRKxKi2XDpx6KLFCEMl/cDDyFG6CsTgDQmePHX8wmL5qJOhCzYzD
         5uPDG/o7e48UFoCnicxjbfN0WfzPxFvko8pm9ztDfy9FtK5m2Z+Sy5cCiJt+95C/ageE
         jzQA==
X-Forwarded-Encrypted: i=1; AJvYcCVzechnL4KJfX95jBBfBxgHRWFb5fow00K8uphZKjO2CpoCkZ+FnmLpa1FukK1+UlNXtLII+HdgCP/DHT+Z@lists.linux.dev
X-Gm-Message-State: AOJu0YygadMBQvWjmUBlj5UKDNmYHMl0BBes07k07o3JiT5VG5NFNZKR
	TW64lp0sQv0qfgYqP/Tjh9mSrZSb6OwdPZSfX8F//qPOEsct55zoAbRN
X-Gm-Gg: AZuq6aKl/7cTOrKNraxSx5wMSJDp3zjmeeluxx+pllQBQ7q930cpSXVJWSsdE3JUfvM
	IRZZh5fOko0aoV7j379OaCvt3mRMClfaqgwIuSZHEbcz0d1iCATFL45MogrfzgWUJFkNzNk7/SU
	yJpgwZYmy1kXR3lr6YzlLLWTJ2urWIfLqGr+RfD6Q1NBODtVRkIdzXzt82UbNfVP0nYLZyFOpWC
	y74bc2N2v8aU/yin20qdnqW+rsjmvYl9LMuOzIS4loGlQ2au5kMrTk74Ks267TSzaKtj9SEgynW
	ywNID15750bN6wqSwfzaqL3PwnCAgt56V3w1/BLP/qt12vbRR9tblbK8jph7OhBQtiXiKhLHGDw
	eqciQ/0VRoY+FzeUGy+/9HA6NMzj5WB0+wUVRJE02v3TXENq7YmTVW8FG3CpIwHOaG3Grai7Lt9
	+vQwOvRvs7imc7lcyZ
X-Received: by 2002:a17:903:2f91:b0:2a8:d9ea:8b59 with SMTP id d9443c01a7336-2a8d9ea8ce0mr93715345ad.7.1769946014987;
        Sun, 01 Feb 2026 03:40:14 -0800 (PST)
Received: from snowman ([2401:4900:614d:8c00:9d3:b11e:236d:377a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f7caasm121156675ad.101.2026.02.01.03.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:40:14 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v6 2/4] staging: rtl8723bs: convert traffic status variables to bool
Date: Sun,  1 Feb 2026 17:08:35 +0530
Message-ID: <20260201113837.8531-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201113837.8531-1-khushalchitturi@gmail.com>
References: <20260201113837.8531-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces u8 variables in traffic_status_watchdog() and its
callers with bool to reflect their usage.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v5 -> v6: Add new patch to convert traffic_status_watchdog variables
from u8 to bool

 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 16 ++++++++--------
 drivers/staging/rtl8723bs/core/rtw_mlme.c        |  7 +++----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ab3c7d3846b5..a8254616cd36 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1128,18 +1128,18 @@ static void collect_traffic_statistics(struct adapter *padapter)
 	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
-u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
+bool traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
-	u8 should_enter_ps = false;
+	bool should_enter_ps = false;
 	u16 busy_threshold_high = 25;
 	u16 busy_threshold_low = 10;
 	u16 busy_threshold = busy_threshold_high;
-	u8 busy_traffic = false;
-	u8 tx_busy_traffic = false;
-	u8 rx_busy_traffic = false;
-	u8 higher_busy_traffic = false;
-	u8 higher_busy_rx_traffic = false;
-	u8 higher_busy_tx_traffic = false;
+	bool busy_traffic = false;
+	bool tx_busy_traffic = false;
+	bool rx_busy_traffic = false;
+	bool higher_busy_traffic = false;
+	bool higher_busy_rx_traffic = false;
+	bool higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4088a1aaae3c..e9287e2b2eee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1652,10 +1652,9 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
-		) {
-		u8 should_enter_ps;
+	if (adapter_to_pwrctl(adapter)->fw_current_in_ps_mode &&
+	    !hal_btcoex_IsBtControlLps(adapter)) {
+		bool should_enter_ps;
 
 		linked_status_chk(adapter);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index dd5080056e58..4119d7b6d6db 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -615,7 +615,7 @@ extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr
 extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
 extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
 extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
+extern bool traffic_status_watchdog(struct adapter *padapter, u8 from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
-- 
2.52.0

