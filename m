Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB8A35
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:24 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26b44247123so1514918a91.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492324; x=1693097124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN0Dz8EYWUsVecmkM6K8qhUJf9gNy1vPVpYgzSxYCV4=;
        b=eQcWro493IWsRQDzek8dDweYGrQSFdozCTzgbkPkZ59Mfi7DWTeN6G7v/0AvA1VMzc
         Kc6oIO7xGdmCnWgrLKh8XZy4xUbB6bA2Tu10L6xOYpw/OItvmpY8kmw0yPWNisLnbWUh
         3oee5COPeFmy0hmRrr8ASrQll9Cj5aUvqHI0+ErRhxL6zgiVRlvW+swwqExU+q7dbt2D
         UcRRs1HpONUVIBOn7IF1+dFXVEoTLPe/tnLB6OnIWuEPsQU8FbhjVyM1+Tjx+QoeuEiw
         wqZFDYw1HKYiOYJg93cT9tY67NxDoE7FwwjA9x6IbTUk8vEW8oHJ1Ys+WWFY2zQH9RUS
         oPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492324; x=1693097124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN0Dz8EYWUsVecmkM6K8qhUJf9gNy1vPVpYgzSxYCV4=;
        b=TZY+pFcSMpE1ivxcUMyJShZI2eSqeHyazNzsDwZWG5IU4F+MkA8LjGmNBvPNNZn7pM
         mxjZ1IdmZdMfhk9ns7nIme8j/t/KGlpLS5JmJ0RN+TQVzSZqg9qbJa58CmxmgR2t8wx4
         K/506PiL0nVWc6u1oNV6cfVHI28dri63H+8IYqq5Kl32Ukh+SnPnuhhM9V+E7xttK2ZX
         RVjB4gsnn811jv+EfJ33JhszsWZiGO9s82nKoc1gImJYlJcVaLnlPhp4E2RnmwINnQyb
         pSI/kYSXUuQvFCbj5SpM/fBzXiOQ94CHymP8thc0L+ixe5A9J3lTMBihZxrZ6GiogfUJ
         jPaw==
X-Gm-Message-State: AOJu0Yw4IgpafG5HmRfRcXLgNEhOFKb4uCsiRLBos1hJXr8hYUt1MnL8
	eWpOMYCN1neJWPK680KF8mtHVg==
X-Google-Smtp-Source: AGHT+IGFUhM8GrAZfMajXM2+u+qXwDz1uQDKGihUZ8BVfVwrTwu7lwJUSJ3eFmkvQ1lxFsOWMsR1bQ==
X-Received: by 2002:a17:90b:293:b0:26b:2c52:5fc with SMTP id az19-20020a17090b029300b0026b2c5205fcmr2429849pjb.18.1692492323706;
        Sat, 19 Aug 2023 17:45:23 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:23 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 06/16] Staging: rtl8192e: Rename variable pRxTs in function RxPktPendingTimeout()
Date: Sat, 19 Aug 2023 17:47:34 -0700
Message-ID: <20230820004744.278022-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pRxTs in function RxPktPendingTimeout() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 33 +++++++++++------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 24a8b9fc0168..75bf59d267c2 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -10,10 +10,9 @@
 
 static void RxPktPendingTimeout(struct timer_list *t)
 {
-	struct rx_ts_record *pRxTs = from_timer(pRxTs, t,
-						     rx_pkt_pending_timer);
-	struct rtllib_device *ieee = container_of(pRxTs, struct rtllib_device,
-						  RxTsRecord[pRxTs->num]);
+	struct rx_ts_record *ts = from_timer(ts, t, rx_pkt_pending_timer);
+	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
+						  RxTsRecord[ts->num]);
 
 	struct rx_reorder_entry *pReorderEntry = NULL;
 
@@ -22,24 +21,24 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	bool bPktInBuf = false;
 
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
-	if (pRxTs->rx_timeout_indicate_seq != 0xffff) {
-		while (!list_empty(&pRxTs->rx_pending_pkt_list)) {
+	if (ts->rx_timeout_indicate_seq != 0xffff) {
+		while (!list_empty(&ts->rx_pending_pkt_list)) {
 			pReorderEntry = (struct rx_reorder_entry *)
-					list_entry(pRxTs->rx_pending_pkt_list.prev,
+					list_entry(ts->rx_pending_pkt_list.prev,
 					struct rx_reorder_entry, List);
 			if (index == 0)
-				pRxTs->rx_indicate_seq = pReorderEntry->SeqNum;
+				ts->rx_indicate_seq = pReorderEntry->SeqNum;
 
 			if (SN_LESS(pReorderEntry->SeqNum,
-				    pRxTs->rx_indicate_seq) ||
+				    ts->rx_indicate_seq) ||
 			    SN_EQUAL(pReorderEntry->SeqNum,
-				     pRxTs->rx_indicate_seq)) {
+				     ts->rx_indicate_seq)) {
 				list_del_init(&pReorderEntry->List);
 
 				if (SN_EQUAL(pReorderEntry->SeqNum,
-				    pRxTs->rx_indicate_seq))
-					pRxTs->rx_indicate_seq =
-					      (pRxTs->rx_indicate_seq + 1) % 4096;
+				    ts->rx_indicate_seq))
+					ts->rx_indicate_seq =
+					      (ts->rx_indicate_seq + 1) % 4096;
 
 				netdev_dbg(ieee->dev,
 					   "%s(): Indicate SeqNum: %d\n",
@@ -58,7 +57,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 	}
 
 	if (index > 0) {
-		pRxTs->rx_timeout_indicate_seq = 0xffff;
+		ts->rx_timeout_indicate_seq = 0xffff;
 
 		if (index > REORDER_WIN_SIZE) {
 			netdev_warn(ieee->dev,
@@ -72,9 +71,9 @@ static void RxPktPendingTimeout(struct timer_list *t)
 		bPktInBuf = false;
 	}
 
-	if (bPktInBuf && (pRxTs->rx_timeout_indicate_seq == 0xffff)) {
-		pRxTs->rx_timeout_indicate_seq = pRxTs->rx_indicate_seq;
-		mod_timer(&pRxTs->rx_pkt_pending_timer,  jiffies +
+	if (bPktInBuf && (ts->rx_timeout_indicate_seq == 0xffff)) {
+		ts->rx_timeout_indicate_seq = ts->rx_indicate_seq;
+		mod_timer(&ts->rx_pkt_pending_timer,  jiffies +
 			  msecs_to_jiffies(ieee->ht_info->rx_reorder_pending_time)
 			  );
 	}
-- 
2.41.0

