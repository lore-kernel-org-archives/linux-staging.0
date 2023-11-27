Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29221566C
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="AoJ1/E50"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cf80a7be0aso31484815ad.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063394; x=1701668194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrOmN5h7Hp9zhTp9GrVqL3qhDYZcamqD4piT786f28U=;
        b=AoJ1/E50DEpuRoHh57LSBA+ALvWVw9qDtkaL9bXQDEV/ClMHjDIGJdfxJZeVG3ZKB9
         3totpWC8awqr761h7hUhYLu2mKGsPDeQtw1znGEu8rD3gzCQh3GWf9HMJZBg+7zFm4K6
         ms2W5AHb+FFyxRW5wtL/4uK9xrXK6MPDEwfB8rr+0/zoY+2jE14GfuCpQIyHWmi0saNJ
         FyaA++FwT+vQL6c9323kDrNbBzIcNCW40yxQ0OHokPggMnMcSmRe8fVjXLMFR4+w8ZyZ
         +P7peEbldHbmIx5H+Ftv0yVsSIdnNCtZKjoejnnaw1eSOCm+SWx92dU3X91MnZzw7BJH
         rRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063394; x=1701668194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrOmN5h7Hp9zhTp9GrVqL3qhDYZcamqD4piT786f28U=;
        b=L5yQ3ywRAF+VI+mweB8ra7ExAR+33M+MENZkdHOhWgk95VTzhZ93H81nDXeSnQAd7b
         zc1VyRRZNvxKSXb+GksPOGJQPsNOtcqYQNTzhZ30hVH+vQiK9BgPVNN0EoR1MxrmQ7L6
         8bfuma8QC0maST2aBFSsaWiOBndjzXjqRIMDRfpMNLXqwdFshdeFVQqslBO+5EdoL1bN
         7pLOoYcZ0l3WhTOXlhP9s4LpHAXAcDIc4ztXK4JJ/Ab9CLQ4/V4UFZJJQ8JW3wDYGiMk
         LEy3hgLsySIS7v+eHoFhKDO6/0URYNKtDkFDu+B4o90lA/d4jM2A9UFGHc5T8GQkj2cZ
         tQrw==
X-Gm-Message-State: AOJu0YyWFYjMG0DXFLIbZjLLj/S9Ik6g6EoulX91DpusXp+zVHibskb3
	0bSzL4jZpQnOAfOQb9pdTNX08Q==
X-Google-Smtp-Source: AGHT+IHKWM5PNkHMdgW7GOMibQDlx4FTE9/Ju8V8e7vWg7P8uTMRAzIYK0dviMay6bdBd9R6o3ewfw==
X-Received: by 2002:a17:903:11c8:b0:1cc:511d:eb43 with SMTP id q8-20020a17090311c800b001cc511deb43mr13690297plh.61.1701063394559;
        Sun, 26 Nov 2023 21:36:34 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:34 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/15] Staging: rtl8192e: Rename variable TsCommonInfo
Date: Sun, 26 Nov 2023 21:43:05 -0800
Message-ID: <20231127054305.148276-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable TsCommonInfo to ts_common_info to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index b00d0f7c7517..58a950ef77ce 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,14 +474,14 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = ts->TsCommonInfo.tspec.ucTSID;
+	ba->ba_param_set.field.tid = ts->ts_common_info.tspec.ucTSID;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (ts->tx_cur_seq + 3) % 4096;
 
 	activate_ba_entry(ba, BA_SETUP_TIMEOUT);
 
-	rtllib_send_ADDBAReq(ieee, ts->TsCommonInfo.addr, ba);
+	rtllib_send_ADDBAReq(ieee, ts->ts_common_info.addr, ba);
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
@@ -525,7 +525,7 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
 				     TxTsRecord[ts->num]);
 	tx_ts_delete_ba(ieee, ts);
-	rtllib_send_DELBA(ieee, ts->TsCommonInfo.addr,
+	rtllib_send_DELBA(ieee, ts->ts_common_info.addr,
 			  &ts->tx_admitted_ba_record, TX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 8e22c717fb27..31f7cfbb3aa5 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -23,7 +23,7 @@ struct ts_common_info {
 };
 
 struct tx_ts_record {
-	struct ts_common_info TsCommonInfo;
+	struct ts_common_info ts_common_info;
 	u16				tx_cur_seq;
 	struct ba_record tx_pending_ba_record;
 	struct ba_record tx_admitted_ba_record;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index f96538f3e4ee..bec73bc53dd0 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -99,7 +99,7 @@ static void ResetTsCommonInfo(struct ts_common_info *ts_common_info)
 
 static void ResetTxTsEntry(struct tx_ts_record *ts)
 {
-	ResetTsCommonInfo(&ts->TsCommonInfo);
+	ResetTsCommonInfo(&ts->ts_common_info);
 	ts->tx_cur_seq = 0;
 	ts->add_ba_req_in_progress = false;
 	ts->add_ba_req_delayed = false;
@@ -138,7 +138,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 			    rtllib_tx_ba_inact_timeout, 0);
 
 		ResetTxTsEntry(pTxTS);
-		list_add_tail(&pTxTS->TsCommonInfo.List,
+		list_add_tail(&pTxTS->ts_common_info.List,
 				&ieee->Tx_TS_Unused_List);
 		pTxTS++;
 	}
@@ -292,7 +292,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 			struct tx_ts_record *tmp =
 				container_of(*ppTS,
 				struct tx_ts_record,
-				TsCommonInfo);
+				ts_common_info);
 			ResetTxTsEntry(tmp);
 		} else {
 			struct rx_ts_record *ts =
-- 
2.39.2

