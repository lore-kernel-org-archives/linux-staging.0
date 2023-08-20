Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75832A35
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:26 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4108da3a9efso4461511cf.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492325; x=1693097125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o6P/vgcJ/7IFuo4n4m5mxxXKz8P2E+6X17T3+dbtoI=;
        b=Yf0xzQ+QOsnHwmXZVPBQno45SM6Kp5WrhYpv4ek7v4Xc4z+/OwSkmR2BNMo16h/nif
         d0Z2NvFhYQvfVCNH0GDdciP7uzPF3fO+ep1/C73YlDmxLJhCLYp0frsVrtYNlaov1AoY
         sVhwC/FG8VFmcFW04Ju35Jxn4b32s392jkH0u72gsNlzs9jGyQpcTXhneGV3fn6N/EvB
         5KudN/ORo/UqtXi4Z1x2wbcWwJAxNC1q8nHIrvYkUdbufCunAGIzfpkq9hb8leYCcdmZ
         +Q2cwhDahEjMWVpDtafWOi3B6RDFI/w9Q24OpwIAmlMhnV8+XIJ7eT0ViJiraxqSa4T5
         gJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492325; x=1693097125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4o6P/vgcJ/7IFuo4n4m5mxxXKz8P2E+6X17T3+dbtoI=;
        b=jqEkj7DQyuWPthm4Z8Kod8XDtDMAUAbX+vIANfRLuE3dziiL8lw0+dkqUwEjM8WWOz
         njKu9hYAgjSNKxcQv63z9grmg8qy/0Itp5vXgUeDY0lp862gb3c1K3CqlPTciv/yYIzm
         A17Ico8yVHXjjLfzbR+41Api/tfW1IaOsGtUTU94KjSV91vVFN9eHKpTIV/mmBkTE4aY
         Q96siMUxYVGsPJLX2HdxWOmYDZ7AeE2Y8wvd7ayZqZjo6AHtW7jHCUe5aSLICXpRM+uv
         4Ma6SfecD2GsfuTn/a9AmX+JYveui/50kkmnfDutDOnMcmfqVFb6V8gBoO1LGvK1imIX
         L8fw==
X-Gm-Message-State: AOJu0YzeC66nsXc1Wu0ELteujywMKoCpc5L2+Wv/A8nOLlYAX5EkC9OY
	4DEgkFLpxiv09uych4cHYgpszg==
X-Google-Smtp-Source: AGHT+IGy6+1WMlxLXsDT9XTVxdIxiy5kY/9kfZHgEzsEeUOs/T0p/iMwazhK9vUihVpU6YN+rcFLFw==
X-Received: by 2002:a05:622a:28e:b0:410:8e9f:f082 with SMTP id z14-20020a05622a028e00b004108e9ff082mr3054316qtw.14.1692492325273;
        Sat, 19 Aug 2023 17:45:25 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:25 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 08/16] Staging: rtl8192e: Rename variable pRxTS in function TSInitialize()
Date: Sat, 19 Aug 2023 17:47:36 -0700
Message-ID: <20230820004744.278022-9-tdavies@darkphysics.net>
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

Rename variable pRxTS in function TSInitialize() to rxts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2:Resend as 16 patch series - no longer throttled by email provider
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index c892fe044f29..ac97b6d627da 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -123,7 +123,7 @@ static void ResetRxTsEntry(struct rx_ts_record *ts)
 void TSInitialize(struct rtllib_device *ieee)
 {
 	struct tx_ts_record *pTxTS  = ieee->TxTsRecord;
-	struct rx_ts_record *pRxTS  = ieee->RxTsRecord;
+	struct rx_ts_record *rxts  = ieee->RxTsRecord;
 	struct rx_reorder_entry *pRxReorderEntry = ieee->RxReorderEntry;
 	u8				count = 0;
 
@@ -150,17 +150,17 @@ void TSInitialize(struct rtllib_device *ieee)
 	INIT_LIST_HEAD(&ieee->Rx_TS_Pending_List);
 	INIT_LIST_HEAD(&ieee->Rx_TS_Unused_List);
 	for (count = 0; count < TOTAL_TS_NUM; count++) {
-		pRxTS->num = count;
-		INIT_LIST_HEAD(&pRxTS->rx_pending_pkt_list);
-		timer_setup(&pRxTS->rx_admitted_ba_record.timer,
+		rxts->num = count;
+		INIT_LIST_HEAD(&rxts->rx_pending_pkt_list);
+		timer_setup(&rxts->rx_admitted_ba_record.timer,
 			    rtllib_rx_ba_inact_timeout, 0);
 
-		timer_setup(&pRxTS->rx_pkt_pending_timer, RxPktPendingTimeout, 0);
+		timer_setup(&rxts->rx_pkt_pending_timer, RxPktPendingTimeout, 0);
 
-		ResetRxTsEntry(pRxTS);
-		list_add_tail(&pRxTS->ts_common_info.List,
+		ResetRxTsEntry(rxts);
+		list_add_tail(&rxts->ts_common_info.List,
 			      &ieee->Rx_TS_Unused_List);
-		pRxTS++;
+		rxts++;
 	}
 	INIT_LIST_HEAD(&ieee->RxReorder_Unused_List);
 	for (count = 0; count < REORDER_ENTRY_NUM; count++) {
-- 
2.41.0

