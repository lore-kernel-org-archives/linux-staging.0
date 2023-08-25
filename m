Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6911182
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:25 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68a6f6a66e1so798363b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972384; x=1693577184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPmplxJVV6adqWaaprj33kljpEVv+8iOqRG/qMzwQmY=;
        b=gFyPvcF1bpmtB7/Q+e/2+Ahm/70En8bzfs5SPZZJv05j9u5+1OxgOx6plbqRgT8x/j
         Tjr1dYdhTBInHYRNOeGcVhzcsRJBAvyzI0N+NAtDmuuFZh0pQ9Aaa8Wujal0F2bx2+Ww
         AnCjAHUIUZdpiqi2M+G0cINjyrKxDcm8NU0fOljhn082nA6BwWjuajg1q+sN6hkDyH8o
         y6g0EecchVkwPeSRZyvX2pkcJnNmIYGrgFjmKIMLPTE/RmRjCV0XOJhpw6vFSqb1Xz2N
         4dntDfXPeWN9jBibDAcagtiWgdckc83LcshhRkayzUSxXTx+OOdDu37ZKdqV5EzFKm0D
         7NuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972385; x=1693577185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPmplxJVV6adqWaaprj33kljpEVv+8iOqRG/qMzwQmY=;
        b=L47CmP4hPOBoVMEOgkAyYVScN/IduPhfEGtMA9L5ULoamP/Uob9+hK81c4Jpl3+Kvw
         Ab8856dHnf0dX5U0ly9YI/Q5cDuUa1iOMDLBWplmsoNi+cUG3oUXfdhNl11Rsn/yG6hV
         Fjub19W/dFK5s05QfnfxTry1dW6U7SWuHflC4RigmUesyDKhU7WnHBP65Su5+UD5VKrf
         uCDB5P0DoqcPRhXra3E2ZxKf0FNaHKdJjuHjMkm8qsKxJU//Cl4zux1jLk9O0zF37CS6
         amHh+s72QVVMl2j5ZeAQycZgaXFCmwsJZFkuGUmtWHGdnJgO/ajKESbLKxHOb/R1wpT4
         tKhg==
X-Gm-Message-State: AOJu0YzOUhK4OtF/N9MZ1II2m5JtkEzR/AqVeJLnQ3T/OkwZQZlsvTvT
	1yuPqDuHDiCmpSc8XCJKrCt38Q==
X-Google-Smtp-Source: AGHT+IHLghVtlUhy40IKeq60myhHcheNDaxhWRMOKfgzl2oPFJ9rPcUgdHfhtVSDtmUgX9/F4odkxg==
X-Received: by 2002:a05:6a00:15cb:b0:688:11cc:ed98 with SMTP id o11-20020a056a0015cb00b0068811cced98mr19039922pfu.32.1692972384648;
        Fri, 25 Aug 2023 07:06:24 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:24 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 08/16] Staging: rtl8192e: Rename variable pRxTS in function TSInitialize()
Date: Fri, 25 Aug 2023 07:08:39 -0700
Message-ID: <20230825140847.501113-9-tdavies@darkphysics.net>
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

Rename variable pRxTS in function TSInitialize() to rxts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
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

