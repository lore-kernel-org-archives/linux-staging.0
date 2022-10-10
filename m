Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B07F5C80
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:05:04 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id bv10so14794504wrb.4
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pprgVZGAGbPdg2DYLGRO9Li8WU2C1HD2XRqcNM7ZtVo=;
        b=VqHaCguyDZB4LZ4+PAxBbYMKZNZefEyWZx5XRHHRDTO+75d8LE+dUNWeeE/cOJXKxr
         nlCPzgscyHlY8mNwO6TMwnZHmI4O6a2Y4ZawNhRUeH+hnyym3+0CZoDex03sIMRyg09/
         9sS2yGTlasOD27Np0Pk3zrvMkZPTwnU8gsNZ8UWqBZHkVJ37TygLxqARXgP1xzIBsGt3
         MANfLiG3+zDGED37O/iSnz0v/cA8A1XOP69Y0hFxYHvdiYdMcnn+dvtg2XMPcPqiK60E
         1QoTICJYsGXK7fYInlRgmrfGKRJY75yBDFYT7b9ZUC0HzJPHo4Wzfx/hMjy3PPYsUJE6
         4j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pprgVZGAGbPdg2DYLGRO9Li8WU2C1HD2XRqcNM7ZtVo=;
        b=MUA7AAsIgIRPYXIZE//ZqlkHeJAyFxv6OQnqfSF00OpTYB/0NZSiKu6DZxywht4Cmt
         98ik2ETG3KWf34HwX0QrFA0xAOmXWaSIDo2AuuBME++pXWt9Af2Dxfz+NR9OckxPWfsx
         hYhy8nnD1ARkgeqB8htClMTec+I9Nf6uX+qGnBKMjroGwjvms0h5i6fhmbhsE6UWkpyB
         orY5zXxfeF+hqFLghQCqUTtfWy5PYIdoyqHKK0Pprx6LqxThPz6D9PeeFrMIJeA6IczZ
         OXpNi5igsNuGZXq0m+QTIkC2vgoQHEyuFQ2N5Q1yi05Kan7YEQUHDEIp8WNMllDQ4qf/
         TSjQ==
X-Gm-Message-State: ACrzQf3lIbNS82WFv2f1u5ZF+XO46fCo87AeFaN9sgkS6ajjl551p5Fn
	TqJ4CS/VuWp40aKNY+uy1fFdNNUdkSp7RecaC+8=
X-Google-Smtp-Source: AMsMyM5fL+wkBA56cCiHi4wZs6JeC5ureuAJx725pdA1IOR2xuZ6AjXKTyjAIfWdA1Yfimuq44Iz2Q==
X-Received: by 2002:a5d:6484:0:b0:230:7cad:c268 with SMTP id o4-20020a5d6484000000b002307cadc268mr4529807wri.335.1665428702754;
        Mon, 10 Oct 2022 12:05:02 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id i29-20020a1c541d000000b003c41144b3cfsm8650140wmb.20.2022.10.10.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:05:01 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 1/3] staging: rtl8192e: Rename CurSTAConnectState and PreSTAConnectState
Date: Mon, 10 Oct 2022 20:04:55 +0100
Message-Id: <20221010190457.13199-2-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
References: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CurSTAConnectState to cur_sta_connect_state,
PreSTAConnectState to pre_sta_connect_state to avoid CamelCase
which is not accepted by checkpatch.

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 22 +++++++++++-----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index f4f7820ad35d..3e7affb3f812 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1138,8 +1138,8 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 
 	dm_digtable.dig_state		= DM_STA_DIG_MAX;
 	dm_digtable.dig_highpwr_state	= DM_STA_DIG_MAX;
-	dm_digtable.CurSTAConnectState = DIG_STA_DISCONNECT;
-	dm_digtable.PreSTAConnectState = DIG_STA_DISCONNECT;
+	dm_digtable.cur_sta_connect_state = DIG_STA_DISCONNECT;
+	dm_digtable.pre_sta_connect_state = DIG_STA_DISCONNECT;
 
 	dm_digtable.rssi_low_thresh	= DM_DIG_THRESH_LOW;
 	dm_digtable.rssi_high_thresh	= DM_DIG_THRESH_HIGH;
@@ -1207,9 +1207,9 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	}
 
 	if (priv->rtllib->state == RTLLIB_LINKED)
-		dm_digtable.CurSTAConnectState = DIG_STA_CONNECT;
+		dm_digtable.cur_sta_connect_state = DIG_STA_CONNECT;
 	else
-		dm_digtable.CurSTAConnectState = DIG_STA_DISCONNECT;
+		dm_digtable.cur_sta_connect_state = DIG_STA_DISCONNECT;
 
 
 	dm_digtable.rssi_val = priv->undecorated_smoothed_pwdb;
@@ -1218,7 +1218,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	_rtl92e_dm_cs_ratio(dev);
 	if (dm_digtable.dig_algorithm_switch)
 		dm_digtable.dig_algorithm_switch = 0;
-	dm_digtable.PreSTAConnectState = dm_digtable.CurSTAConnectState;
+	dm_digtable.pre_sta_connect_state = dm_digtable.cur_sta_connect_state;
 
 }
 
@@ -1368,8 +1368,8 @@ static void _rtl92e_dm_initial_gain(struct net_device *dev)
 		return;
 	}
 
-	if (dm_digtable.PreSTAConnectState == dm_digtable.CurSTAConnectState) {
-		if (dm_digtable.CurSTAConnectState == DIG_STA_CONNECT) {
+	if (dm_digtable.pre_sta_connect_state == dm_digtable.cur_sta_connect_state) {
+		if (dm_digtable.cur_sta_connect_state == DIG_STA_CONNECT) {
 			long gain_range = dm_digtable.rssi_val + 10 -
 					  dm_digtable.backoff_val;
 			gain_range = clamp_t(long, gain_range,
@@ -1419,8 +1419,8 @@ static void _rtl92e_dm_pd_th(struct net_device *dev)
 		reset_cnt = 0;
 	}
 
-	if (dm_digtable.PreSTAConnectState == dm_digtable.CurSTAConnectState) {
-		if (dm_digtable.CurSTAConnectState == DIG_STA_CONNECT) {
+	if (dm_digtable.pre_sta_connect_state == dm_digtable.cur_sta_connect_state) {
+		if (dm_digtable.cur_sta_connect_state == DIG_STA_CONNECT) {
 			if (dm_digtable.rssi_val >=
 			    dm_digtable.rssi_high_power_highthresh)
 				dm_digtable.curpd_thstate =
@@ -1487,8 +1487,8 @@ static void _rtl92e_dm_cs_ratio(struct net_device *dev)
 		reset_cnt = 0;
 	}
 
-	if (dm_digtable.PreSTAConnectState == dm_digtable.CurSTAConnectState) {
-		if (dm_digtable.CurSTAConnectState == DIG_STA_CONNECT) {
+	if (dm_digtable.pre_sta_connect_state == dm_digtable.cur_sta_connect_state) {
+		if (dm_digtable.cur_sta_connect_state == DIG_STA_CONNECT) {
 			if (dm_digtable.rssi_val <= dm_digtable.rssi_low_thresh)
 				dm_digtable.curcs_ratio_state = DIG_CS_RATIO_LOWER;
 			else if (dm_digtable.rssi_val >= dm_digtable.rssi_high_thresh)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 9fadb1ea231c..daabe21da5b7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -66,8 +66,8 @@ struct dig_t {
 
 	u8		dig_state;
 	u8		dig_highpwr_state;
-	u8		CurSTAConnectState;
-	u8		PreSTAConnectState;
+	u8		cur_sta_connect_state;
+	u8		pre_sta_connect_state;
 
 	u8		curpd_thstate;
 	u8		prepd_thstate;
-- 
2.25.1

