Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96E5663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HjAFSCNR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso2083869a12.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063388; x=1701668188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn+SPjvCPtSLlzTnlY099QE9bYM53ql+/mB40G+ws6Y=;
        b=HjAFSCNRM5ql2U+Be7P2lREUeCG0C0NeR8O/WOnNEZgcbY8h2SkhCJ1P+Em1Borgn9
         P564t7K0bRlceTampar8xpra/XrfeBaCtT69FdBCTMAPp4ntasQtGlqOdqec5vkplxTM
         +tWFBTWcTjYbQ08t73xZ20OuHNpxVmZecXsQdAFbQjhY0npu5Jxdl0ieajmUhf9ZVkLK
         6xawCkUowMcAwJOzdpfSLHhHpG98DMdNjPVj4pwFwpk834AqG+AkOiuKFFQutd+3yCUh
         SjIXQFJn3sDE6oaaVZLvlEhp/UUdrUdfTlfvank8ozmRLb9GcMQDhpaEpX2XsyG0svif
         AriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063388; x=1701668188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wn+SPjvCPtSLlzTnlY099QE9bYM53ql+/mB40G+ws6Y=;
        b=SQExCyV56IvOfxfUFHzNUmq6Uh7go/DWfUSjnq85o1BB4bl9ZcI3L0SuQw7q0qpLLk
         l2pi977w88Qud0XdYjrqHh5UZKGCX6tyXFed2tMxyaxhzpEyZVB9AVBH3Qxlb01vbL3/
         MUPjALWoOt88yhsz3dF+MTKVh7i3hkRtoQAWccczyiesip76I7sTuClwfh2+7MOj55SD
         50er3pjz9ZoxXUb/SaJj2vKU+D/I+rILTq4RoLvw1ouReFdtCx2S6obB3N8bd8+HAuwo
         ZmYzTu5vydazKfAQ82WVUvYBKJXeCPKZiIiOka6OmKofGryR91s5w6XzQtbl2mH0IREI
         7cQQ==
X-Gm-Message-State: AOJu0YypFZxYa9OBkBRx5oQC6vNppSlHx+RwzfVNJZgQuYe+QOEmL42r
	xuZQUKMhwnj8G0eMyTtPwa2nPw==
X-Google-Smtp-Source: AGHT+IG0xQP2toGzHlRIhECM2hmUB67kjEwko7EwyI04YY4RSvtctedIYN/3QUnzDAUPFlegfWeQvA==
X-Received: by 2002:a05:6a20:1587:b0:185:a3d6:7bda with SMTP id h7-20020a056a20158700b00185a3d67bdamr10611887pzj.39.1701063388371;
        Sun, 26 Nov 2023 21:36:28 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:28 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/15] Staging: rtl8192e: Rename variable TsAddBaTimer
Date: Sun, 26 Nov 2023 21:43:00 -0800
Message-ID: <20231127054305.148276-11-tdavies@darkphysics.net>
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

Rename variable TsAddBaTimer to ts_add_ba_timer to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c |  2 +-
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 328947fc058c..2053feb51f61 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -455,7 +455,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		ts->using_ba = false;
 		ts->add_ba_req_in_progress = false;
 		ts->add_ba_req_delayed = false;
-		del_timer_sync(&ts->TsAddBaTimer);
+		del_timer_sync(&ts->ts_add_ba_timer);
 		tx_ts_delete_ba(ieee, ts);
 	}
 	return 0;
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 4ab712634b4b..8e22c717fb27 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -31,7 +31,7 @@ struct tx_ts_record {
 	u8				add_ba_req_delayed;
 	u8				using_ba;
 	u8				disable_add_ba;
-	struct timer_list		TsAddBaTimer;
+	struct timer_list		ts_add_ba_timer;
 	u8				num;
 };
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index e06e563ae718..f96538f3e4ee 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -82,7 +82,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 
 static void TsAddBaProcess(struct timer_list *t)
 {
-	struct tx_ts_record *ts = from_timer(ts, t, TsAddBaTimer);
+	struct tx_ts_record *ts = from_timer(ts, t, ts_add_ba_timer);
 	u8 num = ts->num;
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
 				     TxTsRecord[num]);
@@ -130,7 +130,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 
 	for (count = 0; count < TOTAL_TS_NUM; count++) {
 		pTxTS->num = count;
-		timer_setup(&pTxTS->TsAddBaTimer, TsAddBaProcess, 0);
+		timer_setup(&pTxTS->ts_add_ba_timer, TsAddBaProcess, 0);
 
 		timer_setup(&pTxTS->tx_pending_ba_record.timer, rtllib_ba_setup_timeout,
 			    0);
@@ -356,7 +356,7 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 	} else {
 		struct tx_ts_record *pTxTS = (struct tx_ts_record *)pTs;
 
-		del_timer_sync(&pTxTS->TsAddBaTimer);
+		del_timer_sync(&pTxTS->ts_add_ba_timer);
 	}
 }
 
@@ -438,11 +438,11 @@ void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 
 		if (pTxTS->add_ba_req_delayed) {
 			netdev_dbg(ieee->dev, "Start ADDBA after 60 sec!!\n");
-			mod_timer(&pTxTS->TsAddBaTimer, jiffies +
+			mod_timer(&pTxTS->ts_add_ba_timer, jiffies +
 				  msecs_to_jiffies(TS_ADDBA_DELAY));
 		} else {
 			netdev_dbg(ieee->dev, "Immediately Start ADDBA\n");
-			mod_timer(&pTxTS->TsAddBaTimer, jiffies + 10);
+			mod_timer(&pTxTS->ts_add_ba_timer, jiffies + 10);
 		}
 	} else {
 		netdev_dbg(ieee->dev, "BA timer is already added\n");
-- 
2.39.2

