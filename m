Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16090107A9
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68730bafa6bso1432262b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972382; x=1693577182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwwuCo8KBh0cfLqeeZn8s6/Au0pyZRuVkbX5bDVq5Js=;
        b=K/DFww+41uC/mYbcn9wLhQ8uT+9am4Jiz0TKX1Yx/LS9E+78+bxfuvpGrWOHWfRE+z
         Ft+ovDIZKXqb5psgxfIoiAkRmoRixABTpr3zqlOHZjdN7A7aR99r2a+tWVPgrD2YTFP8
         QW/fadhVrvU+71IdYTb79h4JIISzXp5ahEJ8pGEPKpSMqwQhaUQvMmmcVRuoiyGyODL7
         SOOd57ZxMzanK7ZhsG5zgLUDZymN3Oqo0OmHrmbtygUbWRIjFbp///zWOCzUs+qEBwLa
         OVAcb3iwKV8h8Y8Opxi9W91KvnnJcGS1Js6ZaaxO6M+r9rzqh1ThGpA3hMTSpChTyGRB
         gBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972382; x=1693577182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwwuCo8KBh0cfLqeeZn8s6/Au0pyZRuVkbX5bDVq5Js=;
        b=e/IxeAfdO+LYCz2kkpp+lC1B/kKdwe68/wamgagCzNRapKdsr/GmpgREqEKqTJsI6z
         jQiu+DqRHQDeHwHNs8HlQkbf16iEI74tQoFbftKBG8lBaN8Dsj1Ys4EnDfNwcSvKECSp
         bRdU9MZzUE4VJ8fiINkIJL7jOWAFGy7n5N3sgqaRGRuMouUPOYwk5Npo12B0BBpY+WVW
         L+jfK6llPsvVjm2zb8q81MNrpWLFPdD63kBPXchtRyWLg2lSO6bKEivZdqE2K4s0qD3Q
         9D7LUncma9Spc0ndMnmm+9vtjyg/2T0WjfQlTk4AxOsVyysX6I/Kdm7LWuKXsBLiT1xG
         jyFQ==
X-Gm-Message-State: AOJu0YxyCkiaFFVcfis6yVLCDDqqFWB09YiWeRc4cTnCHq4xRKniTrJW
	8J1wXZF7Q+TCeE6jPR2hfH5R5cM+f3BIszwPtwk4gYb6
X-Google-Smtp-Source: AGHT+IHunQoKYS3z2B0VHjx+wPLMR7nRVQI8gs30w81Z94gKnaWmHdCfkUcSP18FAo2T0+0XX/iF2w==
X-Received: by 2002:a05:6a20:7491:b0:f0:50c4:4c43 with SMTP id p17-20020a056a20749100b000f050c44c43mr27532780pzd.5.1692972382385;
        Fri, 25 Aug 2023 07:06:22 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:22 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 06/16] Staging: rtl8192e: Rename variable pRxTs in function RxPktPendingTimeout()
Date: Fri, 25 Aug 2023 07:08:37 -0700
Message-ID: <20230825140847.501113-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
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
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending as v4
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

