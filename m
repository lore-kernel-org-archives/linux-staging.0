Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E76EB55
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748778; cv=none; b=ucYoOKU5qA0AVaZm+DccJvbuxp9JWr6rTzSh6DAY7uIcUg6Sx4Xk+/QF8Ath+Qz9n6yYuEgpiVuVD8GE9j/09QsI1yRUXWG9a2NFcM9C04GIy2Aqsd/nwKTR5DYq7RwOVGrtQhHO51tIf+7XaqpU642x+lLIcxWJMd+8D9gMaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748778; c=relaxed/simple;
	bh=nkptEJqOQE2+6wrLAUuYdfLGOOYUQC9bteAa4mWyU9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5vvQlahdGL9RYJFv7DtcXQOhoG5uGrC3UNM16Ra6aTqt5iD3F0n3vQkMZY7kl0iXxTMIiY2nzlI+j5ZPfEvyzPZht4f34LQG0UMFd7YVmUC4LzGZrUQmoiEGUJ9GGSJ244+bLL6eIYXV2X1owOUaAIPcpq4QVZ5eXX0hHkamIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=P6lNLEsW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="P6lNLEsW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f43ee95078so6184027b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748776; x=1716353576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/vMjY9MMZPdnh9VWVVbKPQx3shyavZBcDLjbDKqtMI=;
        b=P6lNLEsW7oR9pVONLHF3SZ5p/ZfMvg/gqCwgYeip2A97jsle5GYdHHc3eY5tJpXRiu
         bBzRApzoFk1O0270gNMZtSJQ315DZM5ZwKMBpusl4GPteUlLbJWIrQts4JTPgY47YiG0
         5sELjrLBjKhoJCz3eAjxEQsnx0pElVYTQM0RzHZc/GlHWSff2q4KpaNv1Lya1OL4vDFL
         /er9W1YqfWXz0Rt6ZjBN8n09CvlfBAA4h7FiTbTzTqIgCNU87XIkhabXQkwEChnb/XHS
         IvY70W8xw3sZsUfJTCBSzpSHLbKphoOqt04w3k5O/HiLYM4iF2NfxWZbjzctpwNxcv/U
         R30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748776; x=1716353576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/vMjY9MMZPdnh9VWVVbKPQx3shyavZBcDLjbDKqtMI=;
        b=sxPVZpO+7ByksRiZyLQCYgxwrkT76py77+RlLYxPbzA/nm4JYD8zQ6fNnVLyXpA5Mu
         i9eMVugf6Xk0f0v8j/DrjiVURI5fj47sKAXiWntNizU2+ViUf5N3cxzCAW1y1Y5FOA+J
         a4I7SfmmEOTomwcRTFA7nuXpbj8dNy+hBor0i3huaEH0/N5asxf7btf2wXyrYjlZfk9j
         ibv0MFWyya8uRIaPEKohFmp2slN1BZeAfnzpUptFqzFq/MQW3K1pXUS/ASZcPxD4i4TI
         zCJK57cofCUqDGNCdZR2WSpHtu8SvqINHdoa40cMzZ7flABWJYSLoSp7ekvYrFJKqg2R
         fSdQ==
X-Gm-Message-State: AOJu0YwZzLo/RpNJRVkEzeZ0e1Et51H2fql4Lj8PJ7EWMRcyxYbeePzK
	RMB/4OJC1x53boJiBUYC4ZXRp/vyl+dTB6Sj076hs/RrQeLjNy/tZuWtk/x7Ej0=
X-Google-Smtp-Source: AGHT+IElzfY19fa8de6K/sc2J/9/ZZDO0caJ5RXxO9clQ88I9Nnd58mBxLMlN/it8652PIjWhC8irQ==
X-Received: by 2002:a05:6a00:23d3:b0:6f3:ef3d:60f4 with SMTP id d2e1a72fcca58-6f4e03a2c5amr17680652b3a.33.1715748775937;
        Tue, 14 May 2024 21:52:55 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:55 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 31/31] Staging: rtl8192e: Rename variable bPktInBuf
Date: Tue, 14 May 2024 21:52:28 -0700
Message-Id: <20240515045228.35928-32-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bPktInBuf to pkt_in_buf
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  8 ++++----
 drivers/staging/rtl8192e/rtllib_rx.c      | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 9903fe3f3c77..7cdeca7ed8c2 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -18,7 +18,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 
 	unsigned long flags = 0;
 	u8 index = 0;
-	bool bPktInBuf = false;
+	bool pkt_in_buf = false;
 
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
 	if (ts->rx_timeout_indicate_seq != 0xffff) {
@@ -50,7 +50,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 				list_add_tail(&pReorderEntry->list,
 					      &ieee->RxReorder_Unused_List);
 			} else {
-				bPktInBuf = true;
+				pkt_in_buf = true;
 				break;
 			}
 		}
@@ -68,10 +68,10 @@ static void RxPktPendingTimeout(struct timer_list *t)
 			return;
 		}
 		rtllib_indicate_packets(ieee, ieee->stats_IndicateArray, index);
-		bPktInBuf = false;
+		pkt_in_buf = false;
 	}
 
-	if (bPktInBuf && (ts->rx_timeout_indicate_seq == 0xffff)) {
+	if (pkt_in_buf && (ts->rx_timeout_indicate_seq == 0xffff)) {
 		ts->rx_timeout_indicate_seq = ts->rx_indicate_seq;
 		mod_timer(&ts->rx_pkt_pending_timer,  jiffies +
 			  msecs_to_jiffies(ieee->ht_info->rx_reorder_pending_time)
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 43e94af07e99..c17e7d3ca8c3 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -529,7 +529,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	u8 win_size = ht_info->rx_reorder_win_size;
 	u16 win_end = 0;
 	u8 index = 0;
-	bool match_win_start = false, bPktInBuf = false;
+	bool match_win_start = false, pkt_in_buf = false;
 	unsigned long flags;
 
 	netdev_dbg(ieee->dev,
@@ -665,7 +665,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				netdev_err(ieee->dev,
 					   "%s(): Buffer overflow!\n",
 					   __func__);
-				bPktInBuf = true;
+				pkt_in_buf = true;
 				break;
 			}
 
@@ -683,7 +683,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 			list_add_tail(&pReorderEntry->list,
 				      &ieee->RxReorder_Unused_List);
 		} else {
-			bPktInBuf = true;
+			pkt_in_buf = true;
 			break;
 		}
 	}
@@ -707,10 +707,10 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 			return;
 		}
 		rtllib_indicate_packets(ieee, ieee->prxb_indicate_array, index);
-		bPktInBuf = false;
+		pkt_in_buf = false;
 	}
 
-	if (bPktInBuf && ts->rx_timeout_indicate_seq == 0xffff) {
+	if (pkt_in_buf && ts->rx_timeout_indicate_seq == 0xffff) {
 		netdev_dbg(ieee->dev, "%s(): SET rx timeout timer\n", __func__);
 		ts->rx_timeout_indicate_seq = ts->rx_indicate_seq;
 		spin_unlock_irqrestore(&ieee->reorder_spinlock, flags);
-- 
2.30.2

