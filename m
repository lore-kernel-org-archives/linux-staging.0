Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C5A3D
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:27 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-269304c135aso1499330a91.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492327; x=1693097127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b24yTN6PgZpHb8A0TLFMxrHJdvHtJ3OKJgdjirWdIM=;
        b=e2WKAbCwUcFtqTbC3x8ysZWAiVu426Y/WcK0VO+rWvjjIcKnaKJVvgf1Yhs11eujm2
         7KJbR5xY+0wLEF1ErmtqiM/kXiHpabRu+IUemIy+kXOhk5JpWTH2cPaE1Zb8Gr5IS+8I
         PPxlMigWCnftIAyWH4Z3cBfODcWkFwDqKkMDuCh6H9ESeohTurDXS9BMJkwUtH0/ZMBf
         eEo5CWR1UYYZ2t9ZrDTYMxqvO68K4yqtfU5KxVcGQG7Yk2ghctaYrQao+5AqLWSFEkVW
         rvIatsJJI8ULbvR1CcqHju5BWcCmdQv+FAHD2DFOQ3PAMCsV5Z7KYDmXHcezkK/zUXnH
         9FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492327; x=1693097127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b24yTN6PgZpHb8A0TLFMxrHJdvHtJ3OKJgdjirWdIM=;
        b=CIqH0qAtr6JyTaxjf5CrzpS7KYBR77x1J4OHwRv1yEdHFwECjjIWH3fokV8HivteL3
         Xm5JxQiMz6j9t5k5Nsjh7jBeodFoL78odj+jhrrmXLKBt63rW2KvYXwgz7WkbVSdiG/m
         auqaxme/mTWGJit/Xr2eIlZthu5nR63nJcpVVkvDqLzbXcUwS02auayNoeBWXtmjkK0A
         +OO7/83WGQTgfZocDWil7yGj0rCDdmnQT8cceXDaXQ8kO4DH25DKFeufYqP6/9B/HD1T
         vifAnooynBZtn9eH7e2eE62BSt+dCrFkgKPoxFD0kNZ5V/YEC+Nx2Tok7nuPxDTdkJio
         nTew==
X-Gm-Message-State: AOJu0Yy4Vlv7NO4fOgUlbWBXprYrX7Oxu3uGBygF1So/fGNl5LW4kbJT
	eXKRV93dA7xWR8qBXdyTvKl0Zw==
X-Google-Smtp-Source: AGHT+IHjEb6jdUNSvDcgsjopg+OwBVex/DQvMumX9weIIwoE/vfQ//iZffuyvCaEUoT/KzU1/XEd2A==
X-Received: by 2002:a17:90b:108d:b0:268:1e51:3496 with SMTP id gj13-20020a17090b108d00b002681e513496mr2752387pjb.21.1692492326964;
        Sat, 19 Aug 2023 17:45:26 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/16] Staging: rtl8192e: Rename variable pRxTS in function RemoveTsEntry()
Date: Sat, 19 Aug 2023 17:47:38 -0700
Message-ID: <20230820004744.278022-11-tdavies@darkphysics.net>
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

Rename variable pRxTS in function RemoveTsEntry() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 131a5d7b4599..944970272801 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -364,14 +364,14 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 
 	if (TxRxSelect == RX_DIR) {
 		struct rx_reorder_entry *pRxReorderEntry;
-		struct rx_ts_record *pRxTS = (struct rx_ts_record *)pTs;
+		struct rx_ts_record *ts = (struct rx_ts_record *)pTs;
 
-		if (timer_pending(&pRxTS->rx_pkt_pending_timer))
-			del_timer_sync(&pRxTS->rx_pkt_pending_timer);
+		if (timer_pending(&ts->rx_pkt_pending_timer))
+			del_timer_sync(&ts->rx_pkt_pending_timer);
 
-		while (!list_empty(&pRxTS->rx_pending_pkt_list)) {
+		while (!list_empty(&ts->rx_pending_pkt_list)) {
 			pRxReorderEntry = (struct rx_reorder_entry *)
-					list_entry(pRxTS->rx_pending_pkt_list.prev,
+					list_entry(ts->rx_pending_pkt_list.prev,
 					struct rx_reorder_entry, List);
 			netdev_dbg(ieee->dev,  "%s(): Delete SeqNum %d!\n",
 				   __func__, pRxReorderEntry->SeqNum);
-- 
2.41.0

