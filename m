Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E074B12B
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PJOMRkdB"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d9f069e9b0so2243711a34.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857324; x=1703462124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4USW94FsBNR0aa35+yh754CY1XmSRlXZWhpF6abWQqM=;
        b=PJOMRkdBxRIYKYIbXiSndVW/UE5huB3NcHW9JpXU0g+slrcG3KBTB73IguPBoe775f
         xYffAeBkqgS6JLH0f7S2KMPqq8ncGTtn1y+4LoeoO7PpeMI3YRZZIZZY/BK8pazU6wVh
         Uvph7HT9+SbOYwGbwnf5eO/yNZL8YOhtFoVyZLr0zk+WnPdliv1wKpPIec53hPSZXgon
         M6rn5zD/P3R30QWfmoIET1WX49VJSPE+qPqb+BFJpYYTQCHWMrVAJZAqtzyiPIC0Zx+a
         oh7KS69JSxfTF+uIsMbB1aY6tBsViPi9w43V767+3lBS6nb7WFPPuq4TmgIDgyDFTMEG
         kHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857324; x=1703462124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4USW94FsBNR0aa35+yh754CY1XmSRlXZWhpF6abWQqM=;
        b=LmJgNM64DiwzFuK2ZuzaCAeHZL+BXA65MT+B6vYbgTHIC01Vw9Y4Bb0rWH8VR9JwD4
         L8EWQL3KkT4zXVO+8luTS+s+m1q13epYbI+Gnqb7w7uTDZdLRdjFKGZZJ0pm9P8gC4+0
         hgdjU9mCr2v7Dm+WNj8Y+Ra5QvbK4/UHDnpCYdBqPhDjUo7OdN/jvc5xTWjgG2Ra1A3K
         Gi/mwvhfsNMKOYPJ/txmoDFgpDEA1n8jvYMYxSkuSS91zH9hKic5UVXc66IbVWrQbjcl
         gAPUWnX3umxJgD9WPIgIVGF/HBzdu7FMNR5xCSZyDMUB4NEasCT+3hc0r01W2ZD3Rii+
         JRwA==
X-Gm-Message-State: AOJu0YwlxGnVkBeO9ARIBEExZeBqwGyCG58jpQwds7eJGxvY87RJXv7a
	vTFQvKRn+6vmZW9cX270wSBldQ==
X-Google-Smtp-Source: AGHT+IEq6+2qC+LXZozEgV7/eE1Qoo5CR9gBTOR3o3osYSJHZsA6YTyHiVR8IhIMoitOAq7YIcB2+g==
X-Received: by 2002:aca:1109:0:b0:3b8:b063:506e with SMTP id 9-20020aca1109000000b003b8b063506emr16336643oir.111.1702857324005;
        Sun, 17 Dec 2023 15:55:24 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:23 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/6] Staging: rtl8192e: Rename array variable RxTsRecord
Date: Sun, 17 Dec 2023 15:55:15 -0800
Message-Id: <20231217235520.30377-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217235520.30377-1-tdavies@darkphysics.net>
References: <20231217235520.30377-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename array variable RxTsRecord to rx_ts_records to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 58a950ef77ce..401b9efb25aa 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -535,7 +535,7 @@ void rtllib_rx_ba_inact_timeout(struct timer_list *t)
 	struct rx_ts_record *ts = from_timer(ts, t,
 					      rx_admitted_ba_record.timer);
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
-				     RxTsRecord[ts->num]);
+				     rx_ts_records[ts->num]);
 
 	rx_ts_delete_ba(ieee, ts);
 	rtllib_send_DELBA(ieee, ts->ts_common_info.addr,
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index bec73bc53dd0..d23d35d5dce1 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -12,7 +12,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 {
 	struct rx_ts_record *ts = from_timer(ts, t, rx_pkt_pending_timer);
 	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
-						  RxTsRecord[ts->num]);
+						  rx_ts_records[ts->num]);
 
 	struct rx_reorder_entry *pReorderEntry = NULL;
 
@@ -120,7 +120,7 @@ static void ResetRxTsEntry(struct rx_ts_record *ts)
 void rtllib_ts_init(struct rtllib_device *ieee)
 {
 	struct tx_ts_record *pTxTS  = ieee->TxTsRecord;
-	struct rx_ts_record *rxts  = ieee->RxTsRecord;
+	struct rx_ts_record *rxts  = ieee->rx_ts_records;
 	struct rx_reorder_entry *pRxReorderEntry = ieee->RxReorderEntry;
 	u8				count = 0;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b4413cfcb17e..e7d4ed9eb899 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1229,7 +1229,7 @@ struct rtllib_device {
 	struct list_head		Rx_TS_Admit_List;
 	struct list_head		Rx_TS_Pending_List;
 	struct list_head		Rx_TS_Unused_List;
-	struct rx_ts_record RxTsRecord[TOTAL_TS_NUM];
+	struct rx_ts_record rx_ts_records[TOTAL_TS_NUM];
 	struct rx_reorder_entry RxReorderEntry[128];
 	struct list_head		RxReorder_Unused_List;
 
-- 
2.39.2

